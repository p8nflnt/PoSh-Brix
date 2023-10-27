Function Add-TrustedRepo {
    param (
    [string]$name
    )

    do {
        $repos= $(Get-PsRepository).Name

        if ($repos -notcontains $name) {
            Write-Host "$name repository is not currently registered."
            Write-Host "Registering $name repository now."
            Register-PSRepository -Default -InstallationPolicy Trusted | Out-Null
        } else {
            $installationPolicy = $(Get-PsRepository | Where-Object {$_.Name -eq $name}).InstallationPolicy

            if ($installationPolicy -eq 'Untrusted') {
                 Write-Host "$name repository is currently installed."
                 Write-Host "$name repository is not currently trusted."
                 Write-Host "Setting $name to trusted repository."
                 Set-PSRepository -Name $name -InstallationPolicy Trusted
            }

            Write-Host "$name repository is currently installed."
            Write-Host "$name repository is currently trusted."
        }
        $i++
    } until ($repos -contains $name -or $i -eq 2)
}
# install if needed/trust PSGallery as trusted
Add-TrustedRepo -Name "PSGallery"
