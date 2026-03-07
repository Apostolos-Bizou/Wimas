@echo off
title WIMA ERP - GitHub Deploy

echo.
echo =====================================
echo   WIMA ERP - GitHub Deploy
echo =====================================
echo.

cd /d "%~dp0"

echo [1/3] Staging all files...
git add .
echo Done.
echo.

echo [2/3] Committing...
git commit -m "update: WIMA-ERP %date% %time%"
echo.

echo [3/3] Pushing to GitHub...
git push
echo.

echo =====================================
echo   SUCCESS - Deployed to GitHub!
echo   apostolos-bizou.github.io/Wimas
echo =====================================
echo.
pause
