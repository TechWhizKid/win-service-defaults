@echo off
cls

reg query "HKU\S-1-5-19\Environment"

if %errorlevel% NEQ 0 (
    echo Running Admin shell, Please wait...
    goto :UACPrompt
) else (
    goto :gotAdmin
)

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = "%*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /b

:gotAdmin
    Reg query "HKU\S-1-5-19\Environment"

    if not %ERRORLEVEL% EQU 0 (
        cls & mode con  lines=5 cols=48 & color 0C
        echo You must have administrator rights to continue.
        pause >Nul
        exit /b
    )

:restore

sc config Alerter start= Disabled
sc config ALG start= demand
sc config AppMgmt start= demand
sc config AudioSrv start= Auto
sc config BITS start= demand
sc config Browser start= Auto
sc config CiSvc start= demand
sc config ClipSrv start= Disabled
sc config COMSysApp start= demand
sc config CryptSvc start= Auto
sc config DcomLaunch start= Auto
sc config Dhcp start= Auto
sc config dmadmin start= demand
sc config dmserver start= Auto
sc config Dnscache start= Auto
sc config Dot3svc start= demand
sc config EapHost start= demand
sc config ERSvc start= Auto
sc config Eventlog start= Auto
sc config EventSystem start= demand
sc config FastUserSwitchingCompatibility start= demand
sc config helpsvc start= Auto
sc config HidServ start= Disabled
sc config hkmsvc start= demand
sc config HTTPFilter start= demand
sc config ImapiService start= demand
sc config LanmanServer start= Auto
sc config lanmanworkstation start= Auto
sc config LmHosts start= Auto
sc config Messenger start= Disabled
sc config mnmsrvc start= demand
sc config MSDTC start= demand
sc config MSIServer start= demand
sc config napagent start= demand
sc config NetDDE start= Disabled
sc config NetDDEdsdm start= Disabled
sc config Netlogon start= Auto
sc config Netman start= demand
sc config Nla start= demand
sc config NtLmSsp start= demand
sc config NtmsSvc start= demand
sc config PlugPlay start= Auto
sc config PolicyAgent start= Auto
sc config ProtectedStorage start= Auto
sc config RasAuto start= demand
sc config RasMan start= demand
sc config RDSessMgr start= demand
sc config RemoteAccess start= Disabled
sc config RemoteRegistry start= Auto
sc config RpcLocator start= demand
sc config RpcSs start= Auto
sc config RSVP start= demand
sc config SamSs start= Auto
sc config SCardSvr start= demand
sc config Schedule start= Auto
sc config seclogon start= Auto
sc config SENS start= Auto
sc config SharedAccess start= Auto
sc config ShellHWDetection start= Auto
sc config Spooler start= Auto
sc config srservice start= Auto
sc config SSDPSRV start= demand
sc config stisvc start= Auto
sc config SwPrv start= demand
sc config SysmonLog start= demand
sc config TapiSrv start= demand
sc config TermService start= Auto
sc config Themes start= Auto
sc config TlntSvr start= Disabled
sc config TrkWks start= Auto
sc config upnphost start= demand
sc config UPS start= demand
sc config VSS start= demand
sc config W32Time start= Auto
sc config WebClient start= Auto
sc config winmgmt start= Auto
sc config WmdmPmSN start= demand
sc config Wmi start= demand
sc config WmiApSrv start= demand
sc config wscsvc start= Auto
sc config wuauserv start= Auto
sc config WZCSVC start= Auto
sc config xmlprov start= demand

cls & mode con  lines=5 cols=40 & color 0B
echo Windows Services Restored.
Ping  -n  5  localhost > Nul

cls & mode con  lines=5 cols=40 & color 0E
echo This system will reboot...
echo Please save all work in progress.
echo.
echo Press 'ENTER' key to reboot system.
pause >nul
shutdown /r /t 5 /c "Rebooting the system..."
exit /b
