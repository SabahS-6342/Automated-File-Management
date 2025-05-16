$thresholdGB = 10
Get-PSDrive -PSProvider FileSystem | ForEach-Object {
    $freeSpaceGB = $_.Free / 1GB
    if ($freeSpaceGB -lt $thresholdGB) {
        Write-Host "WARNING: Drive $($_.Name) is low on space ($([math]::Round($freeSpaceGB, 2)) GB free)." -ForegroundColor Red
    } else {
        Write-Host "Drive $($_.Name) has sufficient space ($([math]::Round($freeSpaceGB, 2)) GB free)." -ForegroundColor Green
    }
}
Write-Host "Disk space check completed." -ForegroundColor Green
