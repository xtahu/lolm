@echo off

setlocal enableDelayedExpansion

Rem #################################
Rem ## Begin of user-editable part ##
Rem #################################

set "POOL=eu1.ethermine.org:4444"
set "WALLET=0x15f6ec5285bc0e33b61ec21117fdff4dd38ff5aa.rig0"										

Rem #################################
Rem ##  End of user-editable part  ##
Rem #################################

:loop
lolMiner.exe --algo ETHASH --pool !POOL! --user !WALLET! --watchdog exit
if %ERRORLEVEL% == 42 (
	timeout 10
	goto loop
)

pause

