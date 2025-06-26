@echo off
REM Enable the "Delayed Expansion" feature, which is essential for handling
REM variables that are set and used inside IF/ELSE blocks.
SETLOCAL EnableDelayedExpansion

REM =================================================================
REM                  CONFIGURATION BLOCK
REM =================================================================
REM
REM --- IMPORTANT: The paths to python.exe and your script MUST be correct ---
REM
set "pythonPath=C:\Python311\python.exe"
set "pidcatPath=C:\Python311\Tools\pidcat\pidcat.py"
REM
REM --- This is the default package used when you just press Enter ---
REM
set "defaultPackage=com.fadcam"
REM
REM =================================================================


REM Set the main menu color scheme (Light Aqua text on Black)
COLOR 0B
TITLE Android Logcat Assistant

:main
REM Refresh the screen and set the main menu color
COLOR 0B
cls
ECHO.
ECHO   ============================================
REM Escaping the < and > characters
ECHO   ^<^<^<^<^<  Android Logcat Assistant ^>^>^>^>^>
ECHO   ============================================
ECHO.
ECHO   Instructions:
ECHO.
ECHO     * To filter for an app, type its package name.
ECHO     * To see the full device log, type 'all'.
ECHO     * To use the default (%defaultPackage%), just press ENTER.
ECHO.
ECHO.

set /p "userInput=Enter package name or command: "

REM --- Check if the user wants the full logcat ---
IF /I "%userInput%" == "all" (
    cls
    COLOR 0A
    ECHO.
    ECHO   ^>^>^>  Starting full logcat for ALL processes...  ^<^<^<
    ECHO   ^>^>^>  Press Ctrl+C in this window to stop.      ^<^<^<
    ECHO.
    "%pythonPath%" "%pidcatPath%" -c -a

) ELSE (
    REM --- Handle a specific package or the default ---
    
    REM Set the packageName variable based on the user's input.
    set "packageName=%userInput%"
    
    REM If the user just pressed Enter, userInput is empty, so we use the default.
    if "%userInput%" == "" set "packageName=%defaultPackage%"

    cls
    COLOR 0A
    ECHO.

    REM =================================================================
    REM --- THE CRITICAL FIX: Using !packageName! for delayed expansion ---
    REM =================================================================
    ECHO   ^>^>^>  Starting filtered logcat for package: !packageName!  ^<^<^<
    ECHO   ^>^>^>  Press Ctrl+C in this window to stop.              ^<^<^<
    ECHO.
    "%pythonPath%" "%pidcatPath%" -c "!packageName!"
    REM =================================================================
)


REM --- Return to menu color for the exit prompt ---
COLOR 0B
ECHO.
ECHO   ========================================
ECHO   ^|^|     Session Finished or Stopped    ^|^|
ECHO   ========================================
ECHO.

:ask_again
set /p "choice=Run another session? (y/n): "
if /i "%choice%"=="y" goto main
if /i "%choice%"=="n" goto end

REM --- Invalid choice handler ---
COLOR 4F
echo   Invalid choice. Please enter 'y' or 'n'.
timeout /t 1 /nobreak > nul
goto ask_again

:end
REM Restore the default CMD color before exiting
COLOR 07
exit