@echo off
chcp 1251 >nul

echo Сбрасываю настройки прокси...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoDetect /t REG_DWORD /d 1 /f

net stop WinHttpAutoProxySvc >nul 2>&1
net start WinHttpAutoProxySvc >nul 2>&1

ipconfig /flushdns >nul

echo Готово. Закройте окно нажав на "Крестик" !
pause
