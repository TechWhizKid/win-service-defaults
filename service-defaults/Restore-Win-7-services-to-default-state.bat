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

sc config AeLookupSvc start= demand
sc config ALG start= demand
sc config AppIDSvc start= demand
sc config Appinfo start= demand
sc config AppMgmt start= demand
sc config AudioEndpointBuilder start= Auto
sc config AudioSrv start= Auto
sc config AxInstSV start= demand
sc config BDESVC start= demand
sc config BFE start= Auto
sc config BITS start= Auto
sc config Browser start= demand
sc config bthserv start= demand
sc config CertPropSvc start= demand
sc config clr_optimization_v2.0.50727_32 start= Auto
sc config clr_optimization_v2.0.50727_64 start= Auto
sc config COMSysApp start= demand
sc config CryptSvc start= Auto
sc config CscService start= Auto
sc config DcomLaunch start= Auto
sc config defragsvc start= demand
sc config Dhcp start= Auto
sc config Dnscache start= Auto
sc config dot3svc start= demand
sc config DPS start= Auto
sc config EapHost start= demand
sc config EFS start= demand
sc config ehRecvr start= Auto
sc config ehSched start= Auto
sc config eventlog start= Auto
sc config EventSystem start= Auto
sc config Fax start= demand
sc config fdPHost start= demand
sc config FDResPub start= Auto
sc config FontCache start= Auto
sc config FontCache3.0.0.0 start= demand
sc config gpsvc start= Auto
sc config hidserv start= demand
sc config hkmsvc start= demand
sc config HomeGroupListener start= Auto
sc config HomeGroupProvider start= Auto
sc config idsvc start= demand
sc config IKEEXT start= Auto
sc config IPBusEnum start= demand
sc config iphlpsvc start= Auto
sc config KeyIso start= demand
sc config KtmRm start= demand
sc config LanmanServer start= Auto
sc config LanmanWorkstation start= Auto
sc config lltdsvc start= demand
sc config lmhosts start= Auto
sc config Mcx2Svc start= Disabled
sc config MMCSS start= Auto
sc config MpsSvc start= Auto
sc config MSDTC start= demand
sc config MSiSCSI start= demand
sc config msiserver start= demand
sc config napagent start= demand
sc config Netlogon start= Auto
sc config Netman start= demand
sc config netprofm start= demand
sc config NetTcpPortSharing start= Disabled
sc config NlaSvc start= Auto
sc config nsi start= Auto
sc config p2pimsvc start= demand
sc config p2psvc start= demand
sc config PcaSvc start= Auto
sc config PeerDistSvc start= demand
sc config PerfHost start= demand
sc config pla start= demand
sc config PlugPlay start= Auto
sc config PNRPAutoReg start= demand
sc config PNRPsvc start= demand
sc config PolicyAgent start= demand
sc config Power start= Auto
sc config ProfSvc start= Auto
sc config ProtectedStorage start= demand
sc config QWAVE start= demand
sc config RasAuto start= demand
sc config RasMan start= demand
sc config RemoteAccess start= Disabled
sc config RemoteRegistry start= demand
sc config RpcEptMapper start= Auto
sc config RpcLocator start= demand
sc config RpcSs start= Auto
sc config SamSs start= Auto
sc config SCardSvr start= demand
sc config Schedule start= Auto
sc config SCPolicySvc start= demand
sc config SDRSVC start= demand
sc config seclogon start= demand
sc config SENS start= Auto
sc config SensrSvc start= demand
sc config SessionEnv start= demand
sc config SharedAccess start= Disabled
sc config ShellHWDetection start= Auto
sc config SNMPTRAP start= demand
sc config Spooler start= Auto
sc config sppsvc start= Auto
sc config sppuinotify start= demand
sc config SSDPSRV start= demand
sc config SstpSvc start= demand
sc config stisvc start= Auto
sc config swprv start= demand
sc config SysMain start= Auto
sc config TabletInputService start= demand
sc config TapiSrv start= demand
sc config TBS start= demand
sc config TermService start= Auto
sc config Themes start= Auto
sc config THREADORDER start= demand
sc config TrkWks start= Auto
sc config TrustedInstaller start= demand
sc config UI0Detect start= demand
sc config UmRdpService start= demand
sc config upnphost start= demand
sc config UxSms start= Auto
sc config VaultSvc start= demand
sc config vds start= demand
sc config VSS start= demand
sc config W32Time start= Auto
sc config wbengine start= demand
sc config WbioSrvc start= demand
sc config wcncsvc start= demand
sc config WcsPlugInService start= demand
sc config WdiServiceHost start= demand
sc config WdiSystemHost start= demand
sc config WebClient start= demand
sc config Wecsvc start= demand
sc config wercplsupport start= demand
sc config WerSvc start= demand
sc config WinDefend start= Auto
sc config WinHttpAutoProxySvc start= demand
sc config Winmgmt start= Auto
sc config WinRM start= demand
sc config Wlansvc start= Auto
sc config wmiApSrv start= demand
sc config WMPNetworkSvc start= Auto
sc config WPCSvc start= demand
sc config WPDBusEnum start= demand
sc config wscsvc start= Auto
sc config WSearch start= Auto
sc config wuauserv start= Auto
sc config wudfsvc start= demand
sc config WwanSvc start= Auto

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
