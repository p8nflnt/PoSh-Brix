# Return uptime of Windows machine
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object LastBootUpTime
