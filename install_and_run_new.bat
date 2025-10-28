@echo off
chcp 65001 >nul
echo ========================================
echo Установка и запуск Android Contacts
echo ========================================
echo.

REM Устанавливаем ANDROID_HOME, если он не определен
if not defined ANDROID_HOME (
    echo Установка ANDROID_HOME...
    set ANDROID_HOME=C:\Users\User\AppData\Local\Android\Sdk
)

echo [1/5] Проверка окружения...
echo ANDROID_HOME: %ANDROID_HOME%
echo.

REM Проверка наличия adb
if not exist "%ANDROID_HOME%\platform-tools\adb.exe" (
    echo [ОШИБКА] ADB не найден в %ANDROID_HOME%\platform-tools\
    echo Установите Android SDK Platform-Tools через Android Studio
    pause
    exit /b 1
)

echo [2/5] Проверка эмулятора...
"%ANDROID_HOME%\platform-tools\adb.exe" devices
echo.

REM Подсчет количества устройств
set DEVICE_FOUND=
for /f "skip=1 tokens=1" %%i in ('"%ANDROID_HOME%\platform-tools\adb.exe" devices') do (
    if "%%i"=="emulator-5554" set DEVICE_FOUND=1
    if "%%i"=="device" set DEVICE_FOUND=1
)

if not defined DEVICE_FOUND (
    echo [ВНИМАНИЕ] Эмулятор не запущен!
    echo.
    echo Запускаю список доступных эмуляторов...
    if exist "%ANDROID_HOME%\emulator\emulator.exe" (
        "%ANDROID_HOME%\emulator\emulator.exe" -list-avds
        echo.
        echo Для запуска эмулятора используйте команду:
        echo emulator -avd [имя_эмулятора]
        echo.
        echo Или запустите эмулятор вручную через Android Studio
        echo После запуска эмулятора повторите запуск этого скрипта
    ) else (
        echo [ОШИБКА] Эмулятор не найден в %ANDROID_HOME%\emulator\
        echo Установите Android Emulator через Android Studio SDK Manager
    )
    pause
    exit /b 1
)

echo [3/5] Очистка предыдущей сборки...
call gradlew.bat clean
if errorlevel 1 (
    echo [ОШИБКА] Не удалось выполнить очистку проекта
    pause
    exit /b 1
)
echo.

echo [4/5] Сборка и установка приложения...
echo Это может занять несколько минут при первом запуске...
call gradlew.bat installDebug
if errorlevel 1 (
    echo [ОШИБКА] Не удалось собрать и установить приложение
    echo Проверьте логи выше для деталей
    pause
    exit /b 1
)
echo.

echo [5/5] Запуск приложения на эмуляторе...
"%ANDROID_HOME%\platform-tools\adb.exe" shell am start -n ru.yandex.practicum.contacts/.presentation.main.MainActivity
if errorlevel 1 (
    echo [ОШИБКА] Не удалось запустить приложение
    pause
    exit /b 1
)

echo.
echo ========================================
echo УСПЕХ! Приложение установлено и запущено
echo ========================================
echo.
pause