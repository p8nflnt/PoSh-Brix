# Clear variables for repeatability
Get-Variable -Exclude PWD,*Preference | Remove-Variable -EA 0

<# Update-EnvironmentVariables Function 
(can be used to nullify environment variables) #>
Function Update-EnvironmentVariables {
    # Clear nullified environment variables
    $machineValues = [Environment]::GetEnvironmentVariables('Machine')
    $userValues    = [Environment]::GetEnvironmentVariables('User')
    $processValues = [Environment]::GetEnvironmentVariables('Process')
    # Identify the entire list of environment variable names first
    $envVarNames = ($machineValues.Keys + $userValues.Keys + 'PSModulePath') | Sort-Object | Select-Object -Unique
    # Lastly remove the environment variables that no longer exist
    ForEach ($envVarName in $processValues.Keys | Where-Object {$envVarNames -like $null}) {
    Remove-Item -LiteralPath "env:${envVarName}" -Force
    }
    # Update variables
    foreach($level in "Machine","User","Process") {
    [Environment]::GetEnvironmentVariables($level)
    }
} # End of Update-EnvironmentVariables Function

# Nullify environment variables
Set-EnvironmentVariable -Name "<ENV_VARIABLE>" -Value "$null"
