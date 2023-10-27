# exports to .json output file
$objects | ConvertTo-Json -depth 100 | Out-File "$outputPath" -Force

# corrects issue w/ ConverTo-Json that leaves trailing \r
($objects | ConvertTo-Json -depth 100).Replace('\r"','"') | Out-File "$outputPath" -Force
