$sourceFolder = "C:\Users\Sabah\OneDrive\Desktop\cplProject\testFolder_Copy"  
$backupFolder = "C:\Users\Sabah\OneDrive\Desktop\cplProject\Backup"  
$zipFileName = "Backup_$(Get-Date -Format 'yyyy-MM-dd_HHmmss').zip"  
$zipFilePath = Join-Path -Path $backupFolder -ChildPath $zipFileName  
if (!(Test-Path -Path $sourceFolder)) {  
    Write-Host "Source folder does not exist. Please check the path and try again." -ForegroundColor Red  
    exit  
}  
if (!(Test-Path -Path $backupFolder)) {  
    New-Item -ItemType Directory -Path $backupFolder | Out-Null  
}  
try {  
    Compress-Archive -Path $sourceFolder -DestinationPath $zipFilePath -Force  
    Write-Host "Backup successfully created at $zipFilePath" -ForegroundColor Green  
} catch {  
    Write-Host "Error creating backup: $($_.Exception.Message)" -ForegroundColor Red  
}  
