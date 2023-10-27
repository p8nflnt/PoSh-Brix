$module = "<MODULE NAME>"

Function InstallModule {
    param (
        $name
    )
    $check = Get-Module -Name $name
    If (!($check)){
        Install-Module -Name $name
    } Else {
        Write-Host "$name module is currently installed."
    }
}

InstallModule -Name $module
