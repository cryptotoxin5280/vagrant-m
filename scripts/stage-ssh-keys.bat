@ECHO OFF
IF NOT EXIST C:\Users\%UserName%\.ssh\id_rsa ssh-keygen
ECHO.
ECHO COPYING SSH KEYS TO VAGRANT STAGING AREA...
ECHO.
copy C:\Users\%UserName%\Vagrant\.ssh\id_rsa* C:\Users\%UserName%\Vagrant\.ssh2\.
ECHO.