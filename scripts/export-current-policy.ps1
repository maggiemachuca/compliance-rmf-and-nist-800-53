# export-current-policy.ps1
# Collects local security posture data from Windows Server

$ts = Get-Date -Format "yyyyMMdd-HHmm"
$base = "C:\evidence"
New-Item -ItemType Directory -Force -Path $base | Out-Null

systeminfo > "$base\systeminfo-$ts.txt"
gpresult /h "$base\gpresult-$ts.html"
secedit /export /cfg "$base\secpol-$ts.inf"
