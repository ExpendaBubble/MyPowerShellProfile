function Find-WinEvent ($KeyWord, [int]$MaxEvents = '100') {
    Get-WinEvent -ListLog * -EA SilentlyContinue |
        Where-Object { $_.recordcount -AND $_.lastwritetime -gt [datetime]::today } |
        ForEach-Object { Get-WinEvent -LogName $_.logname -MaxEvents $MaxEvents | Where-Object Message -Match $KeyWord } |
        Format-Table TimeCreated, ID, ProviderName, LevelDisplayName, Message -AutoSize -Wrap
}