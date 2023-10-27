# M/D/YYYY HH:MM PM
$(Get-Date -Format g)

# unix time
[DateTimeOffset]::Now.ToUnixTimeSeconds()

# YYYY-MM-DD_HHMM
Return (Get-Date -UFormat "%Y-%m-%d_%H%M").ToString()
