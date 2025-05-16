$sourceFolder = "C:\Users\Sabah\OneDrive\Desktop\cplProject\testFolder"
$destinationFolder = "C:\Users\Sabah\OneDrive\Desktop\cplProject\testFolder_Copy"
if (!(Test-Path -Path $sourceFolder)) {
    Write-Host "Source folder does not exist. Please check the path and try again." -ForegroundColor Red
    exit
}
if (Test-Path -Path $destinationFolder) {
    Write-Host "Destination folder already exists. Please choose a different name or delete the existing folder." -ForegroundColor Yellow
    exit
}
Copy-Item -Path $sourceFolder -Destination $destinationFolder -Recurse -Force
Write-Host "Folder copied successfully from $sourceFolder to $destinationFolder" -ForegroundColor Green
