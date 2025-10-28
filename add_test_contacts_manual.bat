@echo off
setlocal

echo ========================================
echo Instructions for Adding Test Contacts
echo ========================================
echo.
echo The automated contact addition via ADB failed because:
echo 1. The Android contacts database is complex (multiple tables)
echo 2. The intent command was misinterpreted by the system
echo.
echo Please follow these manual steps to add test contacts:
echo.
echo 1. Open the "Contacts" app on your Android emulator
echo 2. Tap the "+" or "Add Contact" button
echo 3. Add these 10 test contacts one by one:
echo.
echo    Contact 1: 
echo      Name: John Smith
echo      Phone: +79123456789
echo      Email: smith@example.com
echo.
echo    Contact 2: 
echo      Name: Jane Doe
echo      Phone: +79123456780
echo      Email: doe@example.com
echo.
echo    Contact 3: 
echo      Name: Robert Johnson
echo      Phone: +79123456781
echo      Email: johnson@example.com
echo.
echo    Contact 4: 
echo      Name: Emily Davis
echo      Phone: +79123456782
echo      Email: davis@example.com
echo.
echo    Contact 5: 
echo      Name: Michael Wilson
echo      Phone: +79123456783
echo      Email: wilson@example.com
echo.
echo    Contact 6: 
echo      Name: Sarah Brown
echo      Phone: +79123456784
echo      Email: brown@example.com
echo.
echo    Contact 7: 
echo      Name: David Taylor
echo      Phone: +79123456785
echo      Email: taylor@example.com
echo.
echo    Contact 8: 
echo      Name: Lisa Anderson
echo      Phone: +79123456786
echo      Email: anderson@example.com
echo.
echo    Contact 9: 
echo      Name: James Thomas
echo      Phone: +79123456787
echo      Email: thomas@example.com
echo.
echo    Contact 10: 
echo      Name: Jennifer Jackson
echo      Phone: +79123456788
echo      Email: jackson@example.com
echo.
echo After adding the contacts, return to the Android Contacts app (ru.yandex.practicum.contacts)
echo to see the new contacts in the list.
echo.
echo If you need to restart the application, run:
echo    adb shell am force-stop ru.yandex.practicum.contacts
echo    adb shell am start -n ru.yandex.practicum.contacts/.presentation.main.MainActivity
echo.
pause