# Windows configuration
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions
Disable-GameBarTips
Disable-UAC
Disable-BingSearch
Set-TaskbarOptions -Size Small -Combine Always
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

# Basics
## Web
cinst -y googlechrome
cinst -y firefox
cinst -y qbittorrent
cinst -y lastpass

## Utils
cinst -y 7zip.install
cinst -y windirstat
cinst -y everything
cinst -y sumatrapdf


## Media
cinst -y vlc
cinst -y spotify

## Comms
cinst -y skype


## Runtime
cinst -y jre8
cinst -y silverlight
cinst -y vcredist2010

# Dev tools
## Editors
cinst -y vim
cinst -y visualstudiocode

## Package managers
cinst -y maven
cinst -y yarn
cinst -y nuget.commandline


## Build tools
cinst -y cmake
cinst -y nsis

## IDEs

## Terminal emulators
cinst -y cmder
cinst -y conemu

## CLI
cinst -y git
cinst -y curl
cinst -y openssh
cinst -y awscli
cinst -y jq

## Utils
cinst -y putty
cinst -y lockhunter
cinst -y cpu-z
cinst -y crystaldiskinfo

## Graphics
cinst -y inkscape
cinst -y greenshot
cinst -y imagemagick

## Virtualisation
cinst -y virtualbox
cinst -y vagrant
cinst -y docker-for-windows

## Networking
cinst -y wireshark

## Programming languages
cinst -y autohotkey.portable
cinst -y nodejs
cinst -y jdk7
cinst -y dotnet4.5
cinst -y ruby
cinst -y python2
cinst -y python
cinst -y golang

## Powershell
cinst -y poshgit
cinst -y pester
cinst -y pscxG

## System management
cinst -y nssm
cinst -y procman
cinst -y sysinternals
cinst -y procexp

## Remove crap bundled with windows

@("Microsoft.3DBuilder", "Microsoft.WindowsAlarms", "Microsoft.BingFinance", "Microsoft.BingNews", 
  "Microsoft.BingSports", "Microsoft.BingWeather", "*BubbleWitch*", "kong.com.CandyCrush*", 
  "Microsoft.CommsPhone", "*Facebook*", "Microsoft.WindowsFeedbackHub", "Microsoft.Getstarted",
  "Microsoft.WindowsMaps", "*disney*", "Microsoft.Messaging", "MicrosoftOfficeHub", 
  "Microsoft.OneConnect", "Microsoft.People", "Microsoft.SkypeApp", "*Solitaire*", 
  "Microsoft.Office.Sway", "Microsoft.ZuneMusic", "Microsoft.ZuneVideo", "Microsoft.XboxApp",
  "Microsoft.XboxIdentityProvider") |
  ForEach { Get-AppxPackage $_ | Remove-AppxPackage }

## Privacy

### Start Menu: Disable Bing Search Results
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name BingSearchEnabled -Type DWord -Value 0
### WiFi Sense: Shared HotSpot Auto-Connect: Disable
Set-ItemProperty -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots -Name value -Type DWord -Value 0
### Disable app usage of advertising ID
If (-Not (Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo")) {
    New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo | Out-Null
}
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo -Name Enabled -Type DWord -Value 0
# WiFi Sense: HotSpot Sharing: Disable
If (-Not (Test-Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting")) {
    New-Item -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting | Out-Null
}
Set-ItemProperty -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting -Name value -Type DWord -Value 0

## Use UTC time to avoid time discrepancy between linux and windows
If (-Not (Test-Path "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation\TimeIsUniversal")) {
    New-Item -Path HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation\TimeIsUniversal | Out-Null
}
Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation\TimeIsUniversal -Name value -Type QWord -Value 1

## Install linux subsystem for windows
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

## Perform windows update
Install-WindowsUpdate -acceptEula

