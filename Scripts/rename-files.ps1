$targetFolder = "C:\Users\Sabah\OneDrive\Desktop\cplProject\testFolder_Copy"
if (!(Test-Path -Path $targetFolder)) {
    Write-Host "Target folder does not exist. Please create it first." -ForegroundColor Red
    exit
}
Get-ChildItem -Path $targetFolder -File | ForEach-Object {
    Write-Host "Current file: $($_.Name)" -ForegroundColor Yellow
    $newBaseName = Read-Host "Enter the new base name for this file (do not include extension)"
    if ([string]::IsNullOrWhiteSpace($newBaseName)) {
        Write-Host "No new name entered. Skipping renaming for $($_.Name)." -ForegroundColor Red
        return
    }
    $newName = "{0}{1}" -f $newBaseName, $_.Extension
    $newFullPath = Join-Path -Path $targetFolder -ChildPath $newName
    if (Test-Path -Path $newFullPath) {
        Write-Host "A file named $newName already exists. Skipping renaming for $($_.Name)." -ForegroundColor Red
        return
    }
    try {
        Rename-Item -Path $_.FullName -NewName $newName
        Write-Host "Renamed: $($_.Name) to $newName" -ForegroundColor Green
    } catch {
        Write-Host "Error renaming $($_.Name): $($_.Exception.Message)" -ForegroundColor Red
    }
}
Write-Host "Renaming process completed!" -ForegroundColor Green
