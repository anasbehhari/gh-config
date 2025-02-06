@echo off
setlocal enabledelayedexpansion

:: Set the profile storage path
set "PROFILE_PATH=%USERPROFILE%\.gh-config"

:: Ensure the directory exists
if not exist "%PROFILE_PATH%" mkdir "%PROFILE_PATH%"

:: Check command
if "%1"=="create" (
  call :createProfile
  exit /b
)

if "%1"=="use" (
  call :useProfile %2
  exit /b
)

:: Added 'list' command
if "%1"=="list" (
  call :listProfiles
  exit /b
)

:: Show help if no valid command is given
echo Usage:
echo gh-config create ^| Creates a new Git profile
echo gh-config use [profile] ^| Switches to the given Git profile
echo gh-config list ^| Lists all available Git profiles
exit /b

:: Function to create a profile
:createProfile
set /p profileName=Enter profile name:
set /p userEmail=Enter email:
set /p userName=Enter username:

:: Save the profile to a file
echo [user] > "%PROFILE_PATH%\%profileName%.gitconfig"
echo name = %userName% >> "%PROFILE_PATH%\%profileName%.gitconfig"
echo email = %userEmail% >> "%PROFILE_PATH%\%profileName%.gitconfig"

echo %profileName% is saved successfully!
exit /b

:: Function to use a profile
:useProfile
if "%1"=="" (
  echo Please specify a profile name.
  exit /b
)

set "CONFIG_FILE=%PROFILE_PATH%\%1.gitconfig"
if not exist "%CONFIG_FILE%" (
  echo Profile "%1" does not exist.
  exit /b
)

:: Update global .gitconfig
echo Using profile "%1"...
copy /Y "%CONFIG_FILE%" "%USERPROFILE%\.gitconfig" > nul
echo Git config updated successfully!
exit /b

:: Function to list profiles
:listProfiles
echo Available profiles:
for %%a in ("%PROFILE_PATH%\*.gitconfig") do (
  echo %%~na
)
exit /b
