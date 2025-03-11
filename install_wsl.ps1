# Check if running as administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "This script requires administrator privileges. Attempting to restart as administrator..."
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

Write-Host "Starting WSL installation..." -ForegroundColor Green

# Install WSL
Write-Host "Running: wsl --install" -ForegroundColor Yellow
wsl --install

Write-Host "`nWSL installation process started!" -ForegroundColor Green
Write-Host "After your computer restarts, you'll need to:" -ForegroundColor Yellow
Write-Host "1. Install Ubuntu from Microsoft Store" -ForegroundColor Yellow
Write-Host "2. Launch Ubuntu and set up your username/password" -ForegroundColor Yellow
Write-Host "3. Copy the Polaris script to your WSL environment" -ForegroundColor Yellow
Write-Host "`nPress any key to exit. Your computer will need to restart to complete the WSL installation." -ForegroundColor Cyan

$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
