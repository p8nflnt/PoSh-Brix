# identify location of script
$scriptPath = Split-Path ($MyInvocation.MyCommand.Path) -Parent

$fileName = "<FILENAME>"

# Build UNC path
$filePath = '\\' + $env:COMPUTERNAME + '\' + $scriptPath.Replace(':', '$') + '\' + $fileName
