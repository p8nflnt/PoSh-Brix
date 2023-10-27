$package = "<PACKAGE NAME>"

Function InstallPackage {
    param (
        $name
    )
    $check = Get-Package -Name $name
    If (!($check)){
        Install-Package -Name $name -SkipDependencies # dependency loop detected
    } Else {
        Write-Host "$name package is currently installed."
    }
}

InstallPackage -Name $package
