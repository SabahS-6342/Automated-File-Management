$backupFolder = "C:\Users\Sabah\OneDrive\Desktop\cplProject\backupFolder"
$restoreFolder = "C:\Users\Sabah\OneDrive\Desktop\cplProject\restoreFolder"
if (!(Test-Path -Path $backupFolder)) {
    Write-Host "Backup folder does not exist. Please check the path and try again." -ForegroundColor Red
    return
}
if (!(Test-Path -Path $restoreFolder)) {
    New-Item -ItemType Directory -Path $restoreFolder | Out-Null
}
Get-ChildItem -Path $backupFolder -Recurse | ForEach-Object {
    $destinationPath = Join-Path -Path $restoreFolder -ChildPath $_.FullName.Substring($backupFolder.Length + 1)
    if ($_.PSIsContainer) {
        if (!(Test-Path -Path $destinationPath)) {
            New-Item -ItemType Directory -Path $destinationPath | Out-Null
        }
    } else {
        Copy-Item -Path $_.FullName -Destination $destinationPath -Force
        Write-Host "Restored: $($_.Name) to $destinationPath" -ForegroundColor Green
    }
}
Write-Host "Restore process completed successfully!" -ForegroundColor Cyan

