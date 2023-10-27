# both options have nearly identical response times

# option 1 (ip only, tested 311ms response time)
(Invoke-WebRequest -Uri "https://api.ipify.org/").Content

# option 2 (more info, tested 316ms response time)
(Invoke-RestMethod -Uri (`https://ipinfo.io/'))
