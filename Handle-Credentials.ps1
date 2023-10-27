# specify user in domain\user format
$Credential = Get-Credential

# get username
$userName = $Credential.UserName

# get password as secure string
$securePass = $Credential.GetNetworkCredential().SecurePassword
