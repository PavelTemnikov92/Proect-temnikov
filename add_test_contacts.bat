@echo off
setlocal

echo ========================================
echo Adding Test Contacts
echo ========================================
echo.

REM Check that emulator is connected
echo Checking device connection...
"C:\Users\User\AppData\Local\Android\Sdk\platform-tools\adb.exe" devices
echo.

REM Define device ID
for /f "skip=1 tokens=1" %%i in ('"C:\Users\User\AppData\Local\Android\Sdk\platform-tools\adb.exe" devices') do (
    if "%%i"=="emulator-5554" (
        set DEVICE_ID=emulator-5554
    )
)

if not defined DEVICE_ID (
    echo Device not found. Make sure emulator is running.
    pause
    exit /b 1
)

echo Found device: %DEVICE_ID%
echo.

echo Adding 10 test contacts...
echo.

REM Add 10 test contacts to the Android device
echo Adding contact: John Smith
"C:\Users\User\AppData\Local\Android\Sdk\platform-tools\adb.exe" shell am start -a android.intent.action.INSERT -t vnd.android.cursor.dir/contact -e name "John Smith" -e phone "+79123456789" -e email "smith@example.com"
ping -n 3 127.0.0.1 > nul

echo Adding contact: Jane Doe
"C:\Users\User\AppData\Local\Android\Sdk\platform-tools\adb.exe" shell am start -a android.intent.action.INSERT -t vnd.android.cursor.dir/contact -e name "Jane Doe" -e phone "+79123456780" -e email "doe@example.com"
ping -n 3 127.0.0.1 > nul

echo Adding contact: Robert Johnson
"C:\Users\User\AppData\Local\Android\Sdk\platform-tools\adb.exe" shell am start -a android.intent.action.INSERT -t vnd.android.cursor.dir/contact -e name "Robert Johnson" -e phone "+79123456781" -e email "johnson@example.com"
ping -n 3 127.0.0.1 > nul

echo Adding contact: Emily Davis
"C:\Users\User\AppData\Local\Android\Sdk\platform-tools\adb.exe" shell am start -a android.intent.action.INSERT -t vnd.android.cursor.dir/contact -e name "Emily Davis" -e phone "+79123456782" -e email "davis@example.com"
ping -n 3 127.0.0.1 > nul

echo Adding contact: Michael Wilson
"C:\Users\User\AppData\Local\Android\Sdk\platform-tools\adb.exe" shell am start -a android.intent.action.INSERT -t vnd.android.cursor.dir/contact -e name "Michael Wilson" -e phone "+79123456783" -e email "wilson@example.com"
ping -n 3 127.0.0.1 > nul

echo Adding contact: Sarah Brown
"C:\Users\User\AppData\Local\Android\Sdk\platform-tools\adb.exe" shell am start -a android.intent.action.INSERT -t vnd.android.cursor.dir/contact -e name "Sarah Brown" -e phone "+79123456784" -e email "brown@example.com"
ping -n 3 127.0.0.1 > nul

echo Adding contact: David Taylor
"C:\Users\User\AppData\Local\Android\Sdk\platform-tools\adb.exe" shell am start -a android.intent.action.INSERT -t vnd.android.cursor.dir/contact -e name "David Taylor" -e phone "+79123456785" -e email "taylor@example.com"
ping -n 3 127.0.0.1 > nul

echo Adding contact: Lisa Anderson
"C:\Users\User\AppData\Local\Android\Sdk\platform-tools\adb.exe" shell am start -a android.intent.action.INSERT -t vnd.android.cursor.dir/contact -e name "Lisa Anderson" -e phone "+79123456786" -e email "anderson@example.com"
ping -n 3 127.0.0.1 > nul

echo Adding contact: James Thomas
"C:\Users\User\AppData\Local\Android\Sdk\platform-tools\adb.exe" shell am start -a android.intent.action.INSERT -t vnd.android.cursor.dir/contact -e name "James Thomas" -e phone "+79123456787" -e email "thomas@example.com"
ping -n 3 127.0.0.1 > nul

echo Adding contact: Jennifer Jackson
"C:\Users\User\AppData\Local\Android\Sdk\platform-tools\adb.exe" shell am start -a android.intent.action.INSERT -t vnd.android.cursor.dir/contact -e name "Jennifer Jackson" -e phone "+79123456788" -e email "jackson@example.com"
ping -n 3 127.0.0.1 > nul

echo.
echo ========================================
echo Test contacts successfully added!
echo ========================================
echo.
echo Restart the Android Contacts app to view the new contacts.
echo.
pause