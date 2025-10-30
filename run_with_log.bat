@echo off
set JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-17.0.16.8-hotspot
set ANDROID_HOME=C:\Users\shche\AppData\Local\Android\Sdk
set PATH=%JAVA_HOME%\bin;%ANDROID_HOME%\platform-tools;%ANDROID_HOME%\emulator;%PATH%

set LOGFILE=build_log.txt

echo =============================================== > %LOGFILE%
echo Build started at %date% %time% >> %LOGFILE%
echo =============================================== >> %LOGFILE%
echo. >> %LOGFILE%

echo Checking Java... >> %LOGFILE%
java -version 2>> %LOGFILE%
echo. >> %LOGFILE%

echo Checking connected devices... >> %LOGFILE%
adb devices >> %LOGFILE% 2>&1
echo. >> %LOGFILE%

echo Building project... >> %LOGFILE%
gradlew.bat assembleDebug >> %LOGFILE% 2>&1
if %errorlevel% neq 0 (
    echo BUILD FAILED! >> %LOGFILE%
    echo Build failed! Check build_log.txt
    pause
    exit /b 1
)

echo. >> %LOGFILE%
echo Installing APK... >> %LOGFILE%
adb install -r app\build\outputs\apk\debug\app-debug.apk >> %LOGFILE% 2>&1
if %errorlevel% neq 0 (
    echo INSTALL FAILED! >> %LOGFILE%
    echo Installation failed! Check build_log.txt
    pause
    exit /b 1
)

echo. >> %LOGFILE%
echo Starting app... >> %LOGFILE%
adb shell am start -n ru.yandex.practicum.contacts/.presentation.main.MainActivity >> %LOGFILE% 2>&1

echo =============================================== >> %LOGFILE%
echo Completed at %date% %time% >> %LOGFILE%
echo =============================================== >> %LOGFILE%

echo SUCCESS! App is running on emulator.
echo Check build_log.txt for details.
pause
