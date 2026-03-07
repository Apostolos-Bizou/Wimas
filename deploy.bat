@echo off
chcp 65001 >nul
echo ========================================
echo   WIMA ERP - GitHub Deploy
echo ========================================
echo.

echo [1/3] Staging all files...
git add -A
echo Done.
echo.

echo [2/3] Committing...
git commit -m "update: WIMA-ERP"
echo.

echo [3/3] Pushing to GitHub...
git push origin main
echo.

echo ========================================
echo   SUCCESS - Deployed!
echo   apostolos-bizou.github.io/Wimas
echo ========================================
echo.
pause
