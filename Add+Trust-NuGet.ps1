Function Add-NuGet {
    $package = Get-PackageSource -Name 'Nuget' -ErrorAction SilentlyContinue

    if ($package.IsTrusted -eq $False) {
        Write-Host "NuGet is installed, but is not trusted."
        Write-Host "Setting NuGet as trusted source."
        Set-PackageSource -Name 'Nuget' -Trusted -Force
    } elseif ($package -eq $null) {
        Write-Host "NuGet is not currently a registered source."
        Write-Host "Registering NuGet as trusted source."
        Register-PackageSource -Name Nuget -Location "https://www.nuget.org/api/v2" –ProviderName Nuget -Trusted -Force
    } else {
        Write-Host "NuGet is currently registered as a trusted source."
    }
}

Add-NuGet
