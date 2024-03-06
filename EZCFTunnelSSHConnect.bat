@echo off

:: Set your host configuration and username here
SET host_config="aaa.aaa.aa"
SET user_name="YOUR_USERNAME_HERE"

SET cloudflared_path="%ProgramFiles(x86)%\cloudflared\cloudflared.exe"
SET ssh_config_path="%UserProfile%\.ssh\config"
SET ssh_host=%user_name%@%host_config%

:: Check if cloudflared.exe exists
IF EXIST %cloudflared_path% (
    ECHO cloudflared.exe found.
) ELSE (
    ECHO cloudflared.exe not found, installing...
    winget install --id Cloudflare.cloudflared --accept-package-agreements --accept-source-agreements
)

:: Check if .ssh\config exists and write the config
IF NOT EXIST %ssh_config_path% (
    ECHO Creating SSH config...
    IF NOT EXIST "%UserProfile%\.ssh" MKDIR "%UserProfile%\.ssh"
    ECHO Host %host_config%> %ssh_config_path%
    ECHO   ProxyCommand %cloudflared_path% access ssh --hostname %%h>> %ssh_config_path%
)

:: Attempt to connect to SSH
ECHO Attempting to connect to SSH...
ssh %ssh_host%
