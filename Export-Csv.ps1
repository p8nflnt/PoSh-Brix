# Export-Csv - will output all properties of an object
$Objects `
| Sort-Object -Property Name `
| Export-Csv -Path "$scriptPath\Output.csv" -Force -NoTypeInformation

# Out-File - will output value in rows directly
| Out-File "$scriptPath\Output.csv" -Force
