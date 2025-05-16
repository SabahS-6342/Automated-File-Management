$targetFolder = "C:\Users\Sabah\OneDrive\Desktop\cplProject\testFolder_Copy"
if (!(Test-Path -Path $targetFolder)) {
    Write-Host "Target folder does not exist. Please check the path." -ForegroundColor Red
    return
}
$confirmDeletion = Read-Host "Are you sure you want to delete all files in $targetFolder? (yes/no)"
if ($confirmDeletion -ne "yes") {
    Write-Host "Deletion canceled." -ForegroundColor Yellow
    return
}
Get-ChildItem -Path $targetFolder -Recurse | ForEach-Object {
    try {
        if ($_.PSIsContainer) {
            Remove-Item -Path $_.FullName -Recurse -Force
        } else {
            Remove-Item -Path $_.FullName -Force
        }
        Write-Host "Deleted: $($_.FullName)" -ForegroundColor Green
    } catch {
        Write-Host "Error deleting $($_.FullName): $($_.Exception.Message)" -ForegroundColor Red
    }
}
Write-Host "Deletion process completed successfully!" -ForegroundColor Cyan
