# Preferences
$ProgressPreference = 'SilentlyContinue'

# Variables
$RepositoryUrl = 'https://raw.githubusercontent.com/ExpendaBubble/MyPowerShellProfile/refs/heads/main'

# Invoke My PowerShell Profile
Clear-Host
Invoke-Expression (Invoke-WebRequest -Uri "$RepositoryUrl/Import-MyPowerShellProfile.ps1").Content