<#
.SYNOPSIS
Prepare to publish a module as an universal package to a DevOps artifact feed

.DESCRIPTION
Prepare to publish a module as an universal package to a DevOps artifact feed
The function will take evaluate which version should be published based on the provided input parameters (uiCustomVersion, pipelineCustomVersion, versioningOption) and the version currently deployed to the feed
If a UICustomVersion is provided, it has the highest priority over the other options
Second in line is the pipeline customVersion which is considered only if it is higher than the latest version deployed to the artifact feed
As a final case, one of the provided version options is chosen and applied with the default being 'patch'

The function returns
- the provided module name as a lowercase version (required by the publish-task)
- the version option to be applied if applicable
- the version to be applied if applicable

.PARAMETER moduleName
Mandatory. The name of the module to publish.

.PARAMETER vstsFeedOrganization
Mandatory. Name of the organization hosting the artifacts feed.

.PARAMETER vstsFeedProject
Optional. Name of the project hosting the artifacts feed. May be empty.

.PARAMETER vstsFeedName
Mandatory. Name to the feed to publish to.  

.PARAMETER uiCustomVersion
Optional. A custom version that can be provided by the UI. '-' represents an empty value.

.PARAMETER pipelineCustomVersion
Optional. A custom version the can be provided as a value in the pipeline file.

.PARAMETER versioningOption
Optional. A version option that can be specified in the UI. Defaults to 'patch'

.EXAMPLE
Initialize-UniversalArtifactPublish -moduleName 'keyvault' -vstsFeedOrganization 'servicescode' -vstsFeedProject '$(System.TeamProject)' -vstsFeedName 'Modules' -uiCustomVersion '3.0.0'

Try to publish the key vault module with version 3.0.0 to the module feed 'servicescode/$(System.TeamProject)/Modules' based on a value provided in the UI

.EXAMPLE
Initialize-UniversalArtifactPublish -moduleName 'keyvault' -vstsFeedOrganization 'servicescode' -vstsFeedProject '$(System.TeamProject)' -vstsFeedName 'Modules' -pipelineCustomVersion '1.0.0'

Try to publish the key vault module with version 1.0.0 to the module feed 'servicescode/$(System.TeamProject)/Modules' based on a value provided in the pipeline file

.EXAMPLE
Initialize-UniversalArtifactPublish -moduleName 'keyvault' -vstsFeedOrganization 'servicescode' -vstsFeedProject '$(System.TeamProject)' -vstsFeedName 'Modules'

Try to publish the next key vault module version to the module feed 'servicescode/$(System.TeamProject)/Modules' based on the default versioning behavior
#>
function Initialize-UniversalArtifactPublish {
    
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string] $moduleName,

        [Parameter(Mandatory)]
        [string] $vstsFeedOrganization,
        
        [Parameter(Mandatory = $false)]
        [string] $vstsFeedProject = '',
        
        [Parameter(Mandatory)]
        [string] $vstsFeedName,

        [Parameter(Mandatory = $false)]
        [string] $uiCustomVersion = '-',
        
        [Parameter(Mandatory = $false)]
        [string] $pipelineCustomVersion = '0.0.1',
        
        [Parameter(Mandatory = $false)]
        [ValidateSet('Major','Minor','Patch', 'Custom')]
        [string] $versioningOption = 'Patch'
    )
    
    begin {
        
    }
    
    process {
        # For function output
        $resultSet = @{}

        $lowerModuleName = $moduleName.ToLower()
        $resultSet['lowerModuleName'] = $lowerModuleName
        
        #################################
        ##    FIND AVAILABLE VERSION   ##
        #################################
        try {
            $head = @{ Authorization = "Bearer $env:TOKEN" }
            $url = "https://feeds.dev.azure.com/$vstsFeedOrganization/$vstsFeedProject/_apis/packaging/Feeds/$vstsFeedName/packages?packageNameQuery=$lowerModuleName&api-version=6.0-preview"
            $packages = Invoke-RestMethod -Uri $url -Method Get -Headers $head -ContentType application/json
            if ($packages) {
                if ($packages.value.id.count -gt 1) {
                    # Handle the case where multiple modules in the feed start with with the same packageName. In this case we have to filter the result of the REST query even further.
                    $packages.value = $packages.value | Where-Object { $_.Name -eq $lowerModuleName }
                }

                $latestFeedVersion = ($packages.value.versions.Where( { $_.isLatest -eq $True })).version
                Write-Verbose ("Package Id of [{0}] is [{1}]" -f $lowerModuleName, $packages.value.Id) -Verbose        
                Write-Verbose "The latest version is [$latestFeedVersion]" -Verbose
            }
            else {
                Write-Verbose "No packages via url [$url] found" -Verbose
            }
        }
        catch {
            $_
        }        
        
        ############################
        ##    EVALUATE VERSION    ##
        ############################

        if ([String]::IsNullOrEmpty($latestFeedVersion)) {
            Write-Verbose ("No version for module [{0}] found in feed [{1}]. Assuming intial publish" -f $lowerModuleName, $vstsFeedName) -Verbose
            $latestFeedVersion = New-Object System.Version('0.0.1')
        }
        
        if ($uiCustomVersion -ne '-') {
            Write-Verbose "A custom version [$uiCustomVersion] was specified in the UI. Using it." -Verbose
            $versioningOption = 'custom'
            $newVersion = $uiCustomVersion
        }
        elseif (-not (([String]::IsNullOrEmpty($pipelineCustomVersion)) -or ([String]::IsNullOrEmpty($latestFeedVersion))) -and ((New-Object System.Version($pipelineCustomVersion)) -gt (New-Object System.Version($latestFeedVersion))) ) {
            Write-Verbose "A custom version [$pipelineCustomVersion] was specified in the pipeline script and is higher than the current latest. Using it." -Verbose  
            $versioningOption = 'custom'
            $newVersion = $pipelineCustomVersion
        }
        else {
            Write-Verbose "No custom version set. Using default versioning."
        }
        
        # Test if mode custom
        # -------------------
        if ($versioningOption -eq 'custom') {
            $newVersionObject = New-Object System.Version($newVersion)
            $latestFeedVersionObject = New-Object System.Version($latestFeedVersion)
            if ($newVersionObject -lt $latestFeedVersionObject -or $newVersionObject -eq $latestFeedVersionObject) {
                throw ("The provided custom version [{0}] must be higher than the current latest version [{1}] published in the artifacts feed [{2}]" -f $newVersionObject.ToString(), $latestFeedVersionObject.ToString(), $vstsFeedName)
            }          
            Write-Verbose "Using publish version [$newVersionObject]" -Verbose
            $resultSet['newVersionObject'] = $newVersionObject
        }
        Write-Verbose "Using publish mode [$versioningOption]" -Verbose
        $resultSet['publishingMode'] = $versioningOption
        
        return $resultSet
    }
    
    end {
        
    }
}