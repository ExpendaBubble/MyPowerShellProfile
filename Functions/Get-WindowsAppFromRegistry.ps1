function Get-WindowsAppFromRegistry {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$AppName
    )
    $ErrorActionPreference = 'SilentlyContinue'  # Required in case of corrupt registry keys
    'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall', 'HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall' | ForEach-Object {
        Get-ChildItem -Path $_ | ForEach-Object {
            Get-ItemProperty -Path $_.PSPath | Where-Object DisplayName -Match $AppName | ForEach-Object {
                $_ |
                    Select-Object -Property `
                        DisplayVersion, `
                        DisplayName, `
                        Installdate, `
                        InstallLocation, `
                        ModifyPath, `
                        Publisher, `
                        UninstallString |
                    Sort-Object
            }
        }
    }
}