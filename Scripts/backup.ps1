$sourceFolder = "C:\Users\Sabah\OneDrive\Desktop\cplProject\testFolder_Copy"  
$backupDirectory = "C:\Users\Sabah\OneDrive\Desktop\cplProject\Backups"  
if (!(Test-Path -Path $sourceFolder)) {  
    Write-Host "Source folder does not exist. Please check the path and try again." -ForegroundColor Red  
    exit  
}  
if (!(Test-Path -Path $backupDirectory)) {  
    New-Item -ItemType Directory -Path $backupDirectory | Out-Null  
}  
try {  
    Copy-Item -Path $sourceFolder -Destination $backupDirectory -Recurse -Force  
    Write-Host "Files successfully backed up to $backupDirectory" -ForegroundColor Green  
} catch {  
    Write-Host "Error during backup: $($_.Exception.Message)" -ForegroundColor Red  
}  
