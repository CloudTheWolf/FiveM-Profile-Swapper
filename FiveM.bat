@echo off 
color 06
cls
:start

echo "    ______ _           __  __   _____            __ _ _         _____                                    
echo "   |  ____(_)         |  \/  | |  __ \          / _(_) |       / ____|                                   
echo "   | |__   ___   _____| \  / | | |__) | __ ___ | |_ _| | ___  | (_____      ____ _ _ __  _ __   ___ _ __ 
echo "   |  __| | \ \ / / _ \ |\/| | |  ___/ '__/ _ \|  _| | |/ _ \  \___ \ \ /\ / / _` | '_ \| '_ \ / _ \ '__|
echo "   | |    | |\ V /  __/ |  | | | |   | | | (_) | | | | |  __/  ____) \ V  V / (_| | |_) | |_) |  __/ |   
echo "   |_|    |_| \_/ \___|_|  |_| |_|   |_|  \___/|_| |_|_|\___| |_____/ \_/\_/ \__,_| .__/| .__/ \___|_|   
echo "                                                                                  | |   | |              
echo "                                                                                  |_|   |_|              
 
                                                                                                
echo Select an action
echo 1) Run FiveM (Profile 1)
echo 2) Run FiveM (Profile 2)
echo 3) Run FiveM (Profile 3)
echo 4) Clean FiveM Cache

SET /P M=Select an action:

IF %M%==1 goto runOne
IF %M%==2 goto runTwo
IF %M%==3 goto runThree
IF %M%==4 goto clean

exit

:runOne
rmdir /s /q %appdata%\CitizenFX
powershell -Command "Start-Process powershell \"-ExecutionPolicy Bypass -NoProfile -Command `\"cmd /c mklink /D %appdata%\CitizenFX %appdata%\CitizenFX_1"\" -Verb RunAs"
start %~dp0FiveM.exe
exit

:runTwo
rmdir /s /q %appdata%\CitizenFX
powershell -Command "Start-Process powershell \"-ExecutionPolicy Bypass -NoProfile -Command `\"cmd /c mklink /D %appdata%\CitizenFX %appdata%\CitizenFX_2"\" -Verb RunAs"
start %~dp0FiveM.exe
exit

:runThree
rmdir /s /q %appdata%\CitizenFX
powershell -Command "Start-Process powershell \"-ExecutionPolicy Bypass -NoProfile -Command `\"cmd /c mklink /D %appdata%\CitizenFX %appdata%\CitizenFX_3"\" -Verb RunAs"
start %~dp0FiveM.exe
exit 

:clean
cls
echo Clearing FiveM Cache
pushd
cd FiveM.app\data
rd /s/q cache
rd /s/q nui-storage
rd /s/q server-cache
rd /s/q server-cache-priv
popd
cls
echo FiveM Cache Cleared!
goto start
