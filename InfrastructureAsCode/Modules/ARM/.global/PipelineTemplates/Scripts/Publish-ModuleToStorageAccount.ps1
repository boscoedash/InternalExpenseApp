<#
.SYNOPSIS
Publish a new version of a given module to a storage account

.DESCRIPTION
Publish a new version of a given module to a storage account
The function will take evaluate which version should be published based on the provided input parameters (uiCustomVersion, pipelineCustomVersion, versioningOption) and the version currently deployed to the feed
If a UICustomVersion is provided, it has the highest priority over the other options
Second in line is the pipeline customVersion which is considered only if it is higher than the latest version deployed to the artifact feed
As a final case, one of the provided version options is chosen and applied with the default being 'patch'

The storage account is set up if not already existing.

.PARAMETER moduleName
Mandatory. The name of the module to publish.

.PARAMETER modulePath
Mandatory. Path to the module from root.

.PARAMETER componentsBasePath
Mandatory. The path to the component/module root.

.PARAMETER componentStorageAccountRGName
Mandatory. ResourceGroup of the storage account to publish to.

.PARAMETER componentStorageAccountRGLocation
Mandatory. Location of the storage account resource group.

.PARAMETER componentStorageAccountName
Mandatory. Name of the storage account to publish to.

.PARAMETER componentStorageContainerName
Mandatory. Name of the blob container to publish to.

.PARAMETER componentStorageAccountSubscriptionId
Mandatory. SubscriptionId of the storage account to publish to.

.PARAMETER uiCustomVersion
Optional. A custom version that can be provided by the UI. '-' represents an empty value.

.PARAMETER pipelineCustomVersion
Optional. A custom version the can be provided as a value in the pipeline file.

.PARAMETER versioningOption
Optional. A version option that can be specified in the UI. Defaults to 'patch'

.EXAMPLE
Publish-ModuleToStorageAccount -moduleName 'KeyVault' -modulePath 'Modules/ARM/KeyVault' -componentsBasePath '$(System.DefaultWorkingDirectory)'  -componentStorageAccountSubscriptionId '8629be3b-96bc-482d-a04b-ffff597c65a2' -componentStorageAccountRGName 'artifacts-rg' -componentStorageAccountRGLocation 'West Europe' -componentStorageAccountName 'iacs' -componentStorageContainerName 'components' -uiCustomVersion '3.0.0'

Try to publish the KeyVault module with version 3.0.0 to the storage account 'iacs' and container 'components' based on a value provided in the UI
#>
function Publish-ModuleToStorageAccount {

    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [string] $moduleName,

        [Parameter(Mandatory)]
        [string] $modulePath,

        [Parameter(Mandatory)]
        [string] $componentsBasePath,

        [Parameter(Mandatory)]
        [string] $componentStorageAccountRGName,

        [Parameter(Mandatory)]
        [string] $componentStorageAccountRGLocation,
        
        [Parameter(Mandatory)]
        [string] $componentStorageAccountName,
        
        [Parameter(Mandatory)]
        [string] $componentStorageContainerName,
        
        [Parameter(Mandatory)]
        [string] $componentStorageAccountSubscriptionId,

        [Parameter(Mandatory = $false)]
        [string] $uiCustomVersion = '-',
        
        [Parameter(Mandatory = $false)]
        [string] $pipelineCustomVersion = '0.0.1',
        
        [Parameter(Mandatory = $false)]
        [ValidateSet('Major', 'Minor', 'Patch')]
        [string] $versioningOption = 'Patch'
    )
    
    begin {
        Write-Debug ("{0} entered" -f $MyInvocation.MyCommand) 
    }
    
    process {
        #############################
        ##    EVALUATE RESOURCES   ##
        #############################
        if ($PSCmdlet.ShouldProcess("Resource group [$componentStorageAccountRGName] to location [$componentStorageAccountRGLocation]", "Deploy")) {
            az group create --name $componentStorageAccountRGName `
                --location $componentStorageAccountRGLocation `
                --subscription $componentStorageAccountSubscriptionId `
                --output none
        }

        if ($PSCmdlet.ShouldProcess("Storage account [$componentStorageAccountName] to resource group [$componentStorageAccountRGName]", "Deploy")) {
            az storage account create --name $componentStorageAccountName `
                --resource-group $componentStorageAccountRGName `
                --subscription $componentStorageAccountSubscriptionId `
                --kind StorageV2 `
                --output none
        }

        if ($PSCmdlet.ShouldProcess("Container [$componentStorageContainerName] to storage account [$componentStorageAccountName]", "Deploy")) {
            az storage container create --name $componentStorageContainerName `
                --account-name $componentStorageAccountName `
                --subscription $componentStorageAccountSubscriptionId `
                --output none
        }

        #################################
        ##    FIND AVAILABLE VERSION   ##
        #################################
        if ($PSCmdlet.ShouldProcess("Latest available version of module [$moduleName] in storage account [$componentStorageAccountName]", "Fetch")) {
            $res = az storage blob list --container-name $componentStorageContainerName --account-name $componentStorageAccountName --subscription $componentStorageAccountSubscriptionId --output table --prefix $modulePath -o json | ConvertFrom-Json
        }
        if (-not $res) {
            Write-Verbose "No version detected in storage account [$componentStorageAccountName]. Creating new."
            $latestVersion = New-Object System.Version('0.0.0')
        }
        else {
            $uniqueVersions = $res.Name | ForEach-Object { $_.Split('/')[3] } | Get-Unique | Where-Object { $_ -like '*.*.*' } # remove Where-object for working example
            $latestVersion = (($uniqueVersions -as [Version[]]) | Measure-Object -Maximum).Maximum
            Write-Verbose "Published versions detected in storage account [$componentStorageAccountName]. Fetched latest [$latestVersion]."
        }    

        ############################
        ##    EVALUATE VERSION    ##
        ############################

        if ($uiCustomVersion -ne '-') {
            Write-Verbose "A custom version [$uiCustomVersion] was specified in the UI. Using it."
            $newVersion = $uiCustomVersion
        }
        elseif (-not ([String]::IsNullOrEmpty($pipelineCustomVersion)) -and ((New-Object System.Version($pipelineCustomVersion)) -gt (New-Object System.Version($latestVersion)))) {
            Write-Verbose "A custom version [$pipelineCustomVersion] was specified in the pipeline script and is higher than the current latest. Using it."  
            $newVersion = $pipelineCustomVersion
        }
        else {
            Write-Verbose "No custom version set. Using default versioning."

            switch ($versioningOption) {
                'major' {
                    Write-Verbose 'Apply version update on "major" level'
                    $newVersion = (New-Object -TypeName System.Version -ArgumentList ($latestVersion.Major + 1), $latestVersion.Minor, $latestVersion.Build).ToString()
                    break
                }
                'minor' {
                    Write-Verbose 'Apply version update on "minor" level'
                    $newVersion = (New-Object -TypeName System.Version -ArgumentList $latestVersion.Major, ($latestVersion.Minor + 1), $latestVersion.Build).ToString()
                    break
                }
                'patch' {
                    Write-Verbose 'Apply version update on "patch" level'
                    $newVersion = (New-Object -TypeName System.Version -ArgumentList $latestVersion.Major, $latestVersion.Minor, ($latestVersion.Build + 1)).ToString()
                    break
                }              
                default {
                    throw "Unsupported version option: $versioningOption."
                }
            }
        }

        $newVersionObject = New-Object System.Version($newVersion)
        if ($newVersionObject -lt $latestVersion -or $newVersionObject -eq $latestVersion) {
            throw ("The provided custom version [{0}] must be higher than the current latest version [{1}] published in the storage account [{2}]" -f $newVersionObject.ToString(), $latestVersion.ToString(), $componentStorageAccountName)
        }

        ################
        ##    SYNC    ##
        ################
        if ($PSCmdlet.ShouldProcess("Module [$moduleName] to folder [$newVersion] of storage account [$componentStorageAccountName]", "Publish")) {
            az storage blob sync --container $componentStorageContainerName `
                --source "$componentsBasePath/$modulePath" `
                --destination "$modulePath/$newVersion" `
                --account-name $componentStorageAccountName `
                --subscription $componentStorageAccountSubscriptionId `
                --output none
        }
        Write-Verbose "Publish complete"
    }
    
    end {
        Write-Debug ("{0} exited" -f $MyInvocation.MyCommand) 
    }
}