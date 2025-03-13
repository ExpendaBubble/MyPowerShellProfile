function Uninstall-PreviousModuleVersions {
    [array]$modules = Get-InstalledModule
    [int]$allProgress = 0
    foreach ($module in $modules) {
        $allProgress ++
        Write-Progress -Activity 'Uninstalling old PowerShell modules' -Status 'Processing module' -Id 0 -PercentComplete ($allProgress/$modules.Count * 100) -CurrentOperation "$($module.Name)"
        $currentVersion = $module.Version
        [array]$toRemove = Get-InstalledModule -Name $module.Name -AllVersions | Where-Object -Property Version -LT -Value $currentVersion
        [int]$toRemoveProgress = 0
        foreach ($version in $toRemove) {
            $toRemoveProgress ++
            Write-Progress -Activity "Uninstalling $($module.Name)" -Status 'Uninstalling' -Id 1 -ParentId 0 -PercentComplete ($toRemoveProgress/$toRemove.Count * 100) -CurrentOperation "$($version.Version)"
            $version | Uninstall-Module
        }
    }
}