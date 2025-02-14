$Search = 'OneDrive'

Get-WinEvent -ListLog * -EA SilentlyContinue |
Where-Object { $_.recordcount -AND $_.lastwritetime -gt [datetime]::today} |
ForEach-Object { Get-WinEvent -LogName $_.logname -MaxEvents 100 | Where-Object Message -Match $Search } |
Format-Table TimeCreated, ID, ProviderName, LevelDisplayName, Message -AutoSize –Wrap