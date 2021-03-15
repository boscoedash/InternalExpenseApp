<#
    .SYNOPSIS
        Install Chrome Selenium Web Driver and set the  Environment Path SeleniumDownloadURI

    .PARAMETER DriverVersion
        Version of the Chrome Selenium driver to download

    .PARAMETER DestinationPath
        Path to store the driver on the target machine
#>
param
(
    [Parameter()]
    [string]
    $DriverVersion = '89.0.4389.23',

    [Parameter()]
    [string]
    $DestinationPath = "$($env:SystemDrive)\SeleniumWebDrivers\ChromeDriver"
)

$SeleniumDriverListUri = 'https://chromedriver.storage.googleapis.com'
[xml]$driverList = (Invoke-WebRequest -UseBasicParsing -Uri $SeleniumDriverListUri).Content
$latestDriverVersion = Split-Path -Path ($driverList.ListBucketResult.Contents.Key.Where({$_ -like "*/chromedriver_win32.zip"}) | Select-Object -Last 1) -Parent
if ($latestDriverVersion -ne $DriverVersion)
{
    Write-Host "WARNING: Not using latest Selenium chrome driver, version: [$latestDriverVersion]. Currently using: [$DriverVersion]" -ForegroundColor DarkYellow
}

$SeleniumDownloadURI = "$SeleniumDriverListUri/$DriverVersion/chromedriver_win32.zip"
$DriversFile = Join-Path -Path $DestinationPath -ChildPath 'ChromeDriver.exe'
$DriverVersionName = ($SeleniumDownloadURI.Split('/') | Select-Object -Last 2) -join '_'
$DriversZipFile = Join-Path -Path $DestinationPath -ChildPath $DriverVersionName
if (-not (Test-Path -Path $DestinationPath))
{
    $null = New-Item -ItemType 'Directory' -Path $DestinationPath -Force
}

if (-not (Get-Item -Path $DriversZipFile -ErrorAction 'SilentlyContinue'))
{
    Write-Host "Cleaning folder contents from [$DestinationPath]..."
    Remove-Item -Path "$DestinationPath\*" -Recurse -Force

    Write-Host "Downloading Selenium driver from [$SeleniumDownloadURI] to [$DriversZipFile]..."
    Invoke-WebRequest -UseBasicParsing -Uri $SeleniumDownloadURI -OutFile $DriversZipFile -ErrorAction Stop
  
    Write-Host "Extracting driver to: [$DestinationPath]"
    Expand-Archive -Path $DriversZipFile -DestinationPath $DestinationPath -Force
}

if (-not $env:ChromeWebDriver -or $env:ChromeWebDriver -ne $DestinationPath)
{
    Write-Host 'Setting the environment variables'
    setx ChromeWebDriver $DestinationPath /M
}
