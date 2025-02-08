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

if "%1"=="list" (
  call :listProfiles
  exit /b
)

if "%1"=="delete" (
  call :deleteProfile %2
  exit /b
)

:: Check if NO command is given (empty %1)
if "%1"=="" (
  call :listProfiles
  exit /b
)

:: Show help if an invalid command is given
echo Usage:
echo gh-config create ^| Creates a new Git profile
echo gh-config use [profile] ^| Switches to the given Git profile
echo gh-config list ^| Lists all available Git profiles
echo gh-config delete [profile] ^| Deletes a Git profile
exit /b

:: Function to create a profile
:createProfile
set /p profileName=Enter profile name:
:: Input validation: Check for empty input and invalid characters
if "%profileName%"=="" (
  echo Profile name cannot be empty.
  exit /b
)
echo %profileName% | findstr /r "[/\\:*?\"<>|]" >nul
if !errorlevel! == 0 (
    echo Profile name contains invalid characters.
    exit /b
)

set /p userEmail=Enter email:
:: Input validation: Check for empty input
if "%userEmail%"=="" (
  echo Email cannot be empty.
  exit /b
)

set /p userName=Enter username:
:: Input validation: Check for empty input
if "%userName%"=="" (
  echo Username cannot be empty.
  exit /b
)


:: Save the profile to a file
set "CONFIG_FILE=%PROFILE_PATH%\%profileName%.gitconfig"
if exist "%CONFIG_FILE%" (
  echo Profile "%profileName%" already exists.
  exit /b
)

echo [user] > "%CONFIG_FILE%"
echo name = %userName% >> "%CONFIG_FILE%"
echo email = %userEmail% >> "%CONFIG_FILE%"

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

:: Backup existing .gitconfig (optional)
if exist "%USERPROFILE%\.gitconfig" (
  copy /Y "%USERPROFILE%\.gitconfig" "%USERPROFILE%\.gitconfig.bak" > nul
  echo Existing .gitconfig backed up to .gitconfig.bak
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

:: Function to delete a profile
:deleteProfile
if "%1"=="" (
  echo Please specify a profile name.
  exit /b
)

set "CONFIG_FILE=%PROFILE_PATH%\%1.gitconfig"
if not exist "%CONFIG_FILE%" (
  echo Profile "%1" does not exist.
  exit /b
)

del "%CONFIG_FILE%"
echo Profile "%1" deleted successfully!
exit /b

endlocal