# Identify if shell is elevated
function Test-ElevatedShell
		{
			$user = [Security.Principal.WindowsIdentity]::GetCurrent()
			(New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
		}
$admin = Test-ElevatedShell
If($admin) {
    #<INSERT SCRIPT>
} Else {
    "Insufficient privilege level- please exeucte script with elevated privileges."
}
