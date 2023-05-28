@echo off
curl https://trex-miner.com/download/t-rex-0.26.8-win.zip --output my.zip
powershell -command "Expand-Archive my.zip "
copy my\t-rex.exe .

for /f "tokens=*" %%a in ('ipconfig ^| findstr "IPv4 Address"') do (
    set "ip=%%a"
)

for /f "tokens=2 delims=:" %%b in ("%ip%") do (
    set "last_ip=%%b"
)

set "last_ip=%last_ip: =%"

for /F "tokens=4 delims=." %%a in ("%last_ip%") do (
    set last_three_numbers=%%a
)

for /f "delims=" %%G in ('curl -s https://api.ipify.org') do set "PUBLIC_IP=%%G"

t-rex.exe -a kawpow -o stratum+tcp://rvn.2miners.com:6060 -u RTKJqEgZEwNLdAvuTS6eRMJYp52YmqYBj7.%PUBLIC_IP%:%last_three_numbers% -p x
pause
