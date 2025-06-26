@echo off
TITLE Android Logcat Assistant

ECHO Welcome to the Android Logcat Assistant!
ECHO.

REM --- Ask for the package name ---
REM The /p switch prompts the user and sets the variable 'packageName'.
set /p packageName="Enter package name (or just press Enter for com.fadcam): "

REM --- Use a default value if the user didn't enter anything ---
REM If 'packageName' was not defined by the user input, set it to the default.
if not defined packageName set packageName=com.fadcam

ECHO.
ECHO ===============================================================
ECHO  Starting Logcat for package: %packageName%
ECHO ===============================================================
ECHO.

REM --- Run the Python script using its full, absolute path ---
REM The path is in quotes to handle any potential spaces.
python "C:\Python311\Tools\pidcat\pidcat.py" -c %packageName%

ECHO.
ECHO ===============================================================
ECHO  The script has finished or was stopped by the user.
ECHO ===============================================================

REM The 'pause' command waits for a key press before closing the window.
pause