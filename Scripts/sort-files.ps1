$sourceFolder = "C:\Users\Sabah\OneDrive\Desktop\cplProject\testFolder_Copy"
if (!(Test-Path -Path $sourceFolder)) {
    Write-Host "Source folder does not exist. Please create it first." -ForegroundColor Red
    exit
}
Write-Host "How would you like to organize the files?"
Write-Host "1. By Type"
Write-Host "2. By Date"
$choice = Read-Host "Enter your choice (1 or 2)"
switch ($choice) {
    1 {
        Get-ChildItem -Path $sourceFolder -File | ForEach-Object {
            $fileType = $_.Extension.TrimStart(".")
            $destinationFolder = Join-Path -Path $sourceFolder -ChildPath $fileType

            if (!(Test-Path -Path $destinationFolder)) {
                New-Item -ItemType Directory -Path $destinationFolder | Out-Null
            }

            Move-Item -Path $_.FullName -Destination $destinationFolder
            Write-Host "Moved: $($_.Name) to $destinationFolder" -ForegroundColor Cyan
        }
        Write-Host "Files organized by type successfully!" -ForegroundColor Green
    }
    2 {
        Get-ChildItem -Path $sourceFolder -File | ForEach-Object {
            $modificationDate = $_.LastWriteTime.ToString("yyyy-MM-dd")
            $destinationFolder = Join-Path -Path $sourceFolder -ChildPath $modificationDate

            if (!(Test-Path -Path $destinationFolder)) {
                New-Item -ItemType Directory -Path $destinationFolder | Out-Null
            }

            Move-Item -Path $_.FullName -Destination $destinationFolder
            Write-Host "Moved: $($_.Name) to $destinationFolder" -ForegroundColor Cyan
        }
        Write-Host "Files organized by date successfully!" -ForegroundColor Green
    }
    default {
        Write-Host "Invalid choice. Please run the script again and choose 1 or 2." -ForegroundColor Red
    }
}
