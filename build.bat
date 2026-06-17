@echo off
setlocal enabledelayedexpansion

if not exist colors.bat (
    echo error, could not load colors file
)

echo What submodule you want to build?
call colors.bat red "CallScreen: 1"
call colors.bat blue "GPhotos: 2"
call colors.bat yellow "InstallAPK: 3"
call colors.bat green "PixelLauncher: 4"
call colors.bat purple "Systemazer: 5"
call colors.bat red "Bootanimation: 6"
call colors.bat blue "Gemini Bootaniamtion: 7"
echo All: press enter
echo.

set /p SELECTION="Enter your selection: "

if "%SELECTION%"=="1" (
    call colors.bat red "Building Call Screen"
    call gradlew :CallScreen:buildZip --no-configuration-cache
) else if "%SELECTION%"=="2" (
    call colors.bat blue "Building GPhotos"
    call gradlew :GPhotos:buildZip --no-configuration-cache
) else if "%SELECTION%"=="3" (
    call colors.bat yellow "Building InstallAPK"
    call gradlew :InstallAPK:buildZip --no-configuration-cache
) else if "%SELECTION%"=="4" (
    call colors.bat green "Building PixelLauncher"
    call gradlew :InstallPixelLauncher:buildZip --no-configuration-cache
) else if "%SELECTION%"=="5" (
    call colors.bat purple "Building Systemazer"
    call gradlew :Systemazer:buildZip --no-configuration-cache
) else if "%SELECTION%"=="6" (
    call colors.bat red "Building Bootanimation"
    call gradlew :Bootanimation:buildZip --no-configuration-cache
) else if "%SELECTION%"=="7" (
    call colors.bat blue "Building Gemini bootanimatiom"
    call gradlew :Gemini_bootanimation:buildZip --no-configuration-cache
) else (
    echo Building everything
    call gradlew buildAll --no-configuration-cache
    echo Cleaning
    call gradlew clean --no-configuration-cache
)
call colors.bat green "Done!"
pause
