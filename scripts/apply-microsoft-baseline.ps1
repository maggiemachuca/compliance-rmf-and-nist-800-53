# Check the path and ensure your folder names align
$lgpoPath = "C:\baselines\SCT\LGPO\LGPO_30\LGPO.exe"
$gposRoot = "C:\baselines\SCT\Windows Server 2022 Security Baseline\Windows Server-2022-Security-Baseline-FINAL\GPOs"

# Ensures nothing happens if both of these paths are not found
if (!(Test-Path $lgpoPath)) { Write-Error "LGPO.exe not found at $lgpoPath"; break }
if (!(Test-Path $gposRoot)) { Write-Error "GPOs folder not found at $gposRoot"; break }

Get-ChildItem $gposRoot -Directory | ForEach-Object { & $lgpoPath /g $_.FullName }

# Optional:
# gpupdate /force
# shutdown /r /t 0
