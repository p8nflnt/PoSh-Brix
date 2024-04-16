# display WiFi profiles
netsh wlan show profile 

# display WiFi profile info & plaintext creds
netsh wlan show profile name= "<INSERT SSID>" key=clear

# display all SSID/key pairs, minified
(netsh wlan show profiles) | Select-String "\s+:\s+(.+)" | ForEach-Object {
    $key, $ssid = $null
    $ssid = $_.Matches.Groups[1].Value
    $key = (netsh wlan show profile name="$ssid" key=clear | Select-String "nt\s+:\s+(.+)").Matches.Groups[1].Value
    "SSID: $ssid`nKey: $key`n-------------------------"
} 2>$null
