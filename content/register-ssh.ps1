$action = New-ScheduledTaskAction -Execute "$(pwd)\autostart.vbs"
$trigger = New-ScheduledTaskTrigger -AtLogOn -User $(whoami)
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "ssh" -Description "Run WSL ssh server on startup"
pause