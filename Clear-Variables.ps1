# Clear session variables for repeatability
Get-Variable -Exclude PWD,*Preference | Remove-Variable -EA 0

<# Set-EnvironmentVariable Function
(can be used to nullify environment variables) #>
Function Set-EnvironmentVariable {
    param (
        $Name,
        $Value
    )
    [System.Environment]::SetEnvironmentVariable($Name,$Value,[System.EnvironmentVariableTarget]::Machine)
    [System.Environment]::SetEnvironmentVariable($Name,$Value,[System.EnvironmentVariableTarget]::User)
    [System.Environment]::SetEnvironmentVariable($Name,$Value,[System.EnvironmentVariableTarget]::Process)
} # End of Set-EnvironmentVariable Function

# Update-EnvironmentVariables Function 
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

# Nullify environment variable
Set-EnvironmentVariable -Name "<ENV_VARIABLE>" -Value "$null"

# Refresh environment variables
Update-EnvironmentVariables
