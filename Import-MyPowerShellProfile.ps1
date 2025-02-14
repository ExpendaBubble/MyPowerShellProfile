# Functions
function Get-MyPowerShellProfile {
    Clear-Host
    Write-Host "My PowerShell Cmdlets.." -ForegroundColor Magenta
    $MyPowerShellProfileFunctions | Sort-Object | ForEach-Object {
        Write-Host " $_" -ForegroundColor Magenta
    }
}

# Variables
$ApiReposUrl = 'https://api.github.com/repos'
$Owner = 'ExpendaBubble'
$Repository = 'MyPowerShellProfile'
$RawUrl = 'https://raw.githubusercontent.com/ExpendaBubble/MyPowerShellProfile/refs/heads/main'

Write-Host ""
Write-Host "⠀⠀⠀⠀⠀⠑⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" -ForegroundColor Magenta
Write-Host "⠀⠀⠀⠀⠀⠀⠀⠙⢷⣦⣀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" -ForegroundColor Magenta
Write-Host "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣷⣿⣾⣿⣧⣄⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" -ForegroundColor Magenta
Write-Host "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣇⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" -ForegroundColor Magenta
Write-Host "⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣥⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" -ForegroundColor Magenta
Write-Host "⠀⠀⠀⠀⠀⠀⠀⠸⣿⠟⠉⠉⢹⣿⣿⣿⣿⣿⣿⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀" -ForegroundColor Magenta
Write-Host "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" -ForegroundColor Magenta
Write-Host "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀" -ForegroundColor Magenta
Write-Host "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀" -ForegroundColor Magenta
Write-Host "⠀⠀⠀⢀⣠⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀" -ForegroundColor Magenta
Write-Host "⢀⣴⠿⠛⠉⢸⡏⠁⠉⠙⠛⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⡀⠀⠀⠀⠀⠀" -ForegroundColor Magenta
Write-Host "⠉⠉⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀" -ForegroundColor Magenta
Write-Host "⠀⠀⠀⠀⠀⠈⠿⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀" -ForegroundColor Magenta
Write-Host "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠻⢿⣿⣿⣿⣿⣿⣿⣧⡀⠀" -ForegroundColor Magenta
Write-Host "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⠟⢿⣷⡄" -ForegroundColor Magenta
Write-Host "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⡟⠀⢠⣾⣿⣿" -ForegroundColor Magenta
Write-Host "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣀⣾⣿⡿⠃" -ForegroundColor Magenta
Write-Host "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⠏⠀⠀" -ForegroundColor Magenta
Write-Host "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣿⣿⠻⣿⣿⡀⠀⠀" -ForegroundColor Magenta
Write-Host "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠋⣹⣿⠃⠀⠈⣿⣿⣴⠇" -ForegroundColor Magenta
Write-Host "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣾⠟⠀⠀⠀⠀⠘⠉⠛⠀" -ForegroundColor Magenta
Write-Host ""
Write-Host "LOADING MY FUNCTIONS.. " -ForegroundColor Magenta -NoNewline

# Invoking functions
$MyPowerShellProfileFunctions = @()
$request = Invoke-RestMethod "$ApiReposUrl/$Owner/$Repository/git/trees/main?recursive=true"
$request.tree | Where-Object { $_.type -eq 'blob' -and $_.path -ne 'Import-MyPowerShellProfile.ps1' } | ForEach-Object {
    Invoke-Expression (Invoke-WebRequest -Uri "$RawUrl/$($_.path)").Content
    $MyPowerShellProfileFunctions += (Split-Path -Path $_.path -Leaf) -replace '.ps1',''
}

Write-Host "COMPLETE" -BackgroundColor Magenta
Write-Host "-> Get-MyPowerShellProfile for available CmdLets" -ForegroundColor Magenta
