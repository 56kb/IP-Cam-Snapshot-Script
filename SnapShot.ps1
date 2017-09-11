$day = Get-Date -Format 'yyyy-MM-dd'
$snapshots_dir = "C:\SnapShots\$day"

if (Test-Path $snapshots_dir) {
    Write-Host "$snapshots_dir exists, Saving SnapShots"
} else {
    Write-Host "$snapshots_dir doesn't exist, creating it"
    New-Item -ItemType Directory -Path $snapshots_dir
}

$timestamp = Get-Date -Format 'HH-mm-ss'

(New-Object System.Net.WebClient).DownloadFile('http://10.0.0.132/snap.jpeg',"$snapshots_dir\Camera_A$timestamp.jpeg")
(New-Object System.Net.WebClient).DownloadFile('http://10.0.0.132/snap.jpeg',"$snapshots_dir\Camera_B$timestamp.jpeg")
