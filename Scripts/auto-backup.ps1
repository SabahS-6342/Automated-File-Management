$taskName = "AutomatedFileBackup"  
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File C:\Users\Sabah\OneDrive\Desktop\cplProject\BackupScript.ps1"  
$trigger = New-ScheduledTaskTrigger -Daily -At "2:00AM"  
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries  
try {  
    Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Settings $settings  
    Write-Host "Scheduled backup task created successfully!" -ForegroundColor Green  
} catch {  
    Write-Host "Error creating scheduled task: $($_.Exception.Message)" -ForegroundColor Red  
}