# FiveM Profile Swapper
A simple batch file to allow multiple FiveM Profiles and Clear your FiveM Cache.

## Getting Started
To get started, navigate to `%appdata%` and rename `CitizenFX`. For this example we will name it `CitizenFX_1` and copy it 2 times to create `CitizenFX_2` and `CitizenFX_3` so we have 3 profiles. 

Next, open FiveM.bat in Notepad (Or your preferred Text editor).

Find `:runOne` and place `CitizenFX_1` with your first profile name. 
Repeat this for all profiles. 

If you have more than 3 Profiles, add the following above `:clean`  (Replacing `:runX` with something unique, eg `:runFour` and `CitizenFX_X` with the directory name for your profile.)

    :runX
    rmdir /s /q %appdata%\CitizenFX
    powershell -Command "Start-Process powershell \"-ExecutionPolicy Bypass -NoProfile -Command `\"cmd /c mklink /D %appdata%\CitizenFX %appdata%\CitizenFX_X"\" -Verb RunAs"
    start %~dp0FiveM.exe
    exit

Next  find the menu starting on line 17 and add any new menu items.
Eg to add a 4th profile, you would add `echo 4) Run FiveM (Profile 4)`

You can also remove Profile 3 if you only have 2 profiles.

Then change `echo 4) Clean FiveM Cache` so that it is the last option in the menu (Eg if if you have 4 profiles this should be `echo 5) Clean FiveM Cache`

Optionally you can re-name the Profiles so they have a real name instead of just Profile X (Eg `echo 1) Run FiveM (LegacyRP - John Doe)`)

Now find `IF  %M%==1  goto runOne` and add/remove/update the options to match the menu above. 

Eg if if you added a 4th profile it should look like this 

	IF %M%==1 goto runOne
	IF %M%==2 goto runTwo
	IF %M%==3 goto runThree
	IF %M%==4 goto runFour
	IF %M%==5 goto clean

Finally, save the file and copy it to the same Directory as FiveM.exe 

Now when you run the Batch file you should see something like this:
![enter image description here](https://i.imgur.com/qvVHEp8.png)

When you select a profile, you will get a UAC Prompt, say Yes and it will create a Symbolic Link so that `%appdata%\CitizenFX` will link to the directory of your profile (Eg if I select option1 `%appdata%\CitizenFX` will SymLink to `%appdata%\CitizenFX_1`)

Finally, the clear Cache option will remove the following directories from your FiveM Application Data:

	data\cache
	data\nui-storage
	data\server-cache
	data\server-cache-priv
