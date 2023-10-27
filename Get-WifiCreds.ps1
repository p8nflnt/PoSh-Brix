# display WiFi profiles
netsh wlan show profile 

# display WiFi profile info & plaintext creds
netsh wlan show profile name= "<INSERT SSID>" key=clear

# display all SSID/key pairs, minified
(netsh wlan show profiles) | Select-String "All User Profile\s+:\s+(.+)" | ForEach-Object {$ssid = $_.Matches.Groups[1].Value
$key = (netsh wlan show profile name="$ssid" key=clear | Select-String "Key Content\s+:\s+(.+)").Matches.Groups[1].Value
"SSID: $ssid`nKey:  $key`n-------------------------"}
