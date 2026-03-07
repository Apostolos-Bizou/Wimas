@echo off
chcp 65001 >nul
title WIMA ERP — GitHub Deploy

echo.
echo  ╔══════════════════════════════════════╗
echo  ║       WIMA ERP — GitHub Deploy       ║
echo  ╚══════════════════════════════════════╝
echo.

:: Get current date/time for commit message
for /f "tokens=1-3 delims=/ " %%a in ('date /t') do set mydate=%%a/%%b/%%c
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set mytime=%%a:%%b

:: Go to the correct folder
cd /d "%~dp0"

echo  [1/4] Checking for changes...
git status --short
echo.

:: Add all files
echo  [2/4] Staging files...
git add .
echo  Done.
echo.

:: Commit with timestamp
echo  [3/4] Committing...
git commit -m "update: WIMA-ERP %mydate% %mytime%"
echo.

:: Push
echo  [4/4] Pushing to GitHub...
git push
echo.

echo  ╔══════════════════════════════════════╗
echo  ║   ✅  Successfully deployed!          ║
echo  ║   github.com/Apostolos-Bizou/Wimas   ║
echo  ╚══════════════════════════════════════╝
echo.
pause
