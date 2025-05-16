$logFile = "C:\Users\Sabah\OneDrive\Desktop\cplProject\log.txt"
try {
    $sourceFolder = "C:\Users\Sabah\OneDrive\Desktop\cplProject\testFolder"
    $destinationFolder = "C:\Users\Sabah\OneDrive\Desktop\cplProject\backupFolder"
    if (!(Test-Path -Path $sourceFolder)) {
        throw "Source folder does not exist."
    }
    if (!(Test-Path -Path $destinationFolder)) {
        New-Item -ItemType Directory -Path $destinationFolder | Out-Null
    }
    Copy-Item -Path $sourceFolder\* -Destination $destinationFolder -Recurse -Force
    Write-Output "$(Get-Date) - Files copied from $sourceFolder to $destinationFolder" | Out-File -Append $logFile
}
catch {
    Write-Output "$(Get-Date) - Error: $($_.Exception.Message)" | Out-File -Append $logFile
}
finally {
    Write-Output "$(Get-Date) - Script execution completed." | Out-File -Append $logFile
}
