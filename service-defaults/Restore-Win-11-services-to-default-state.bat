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

sc config AJRouter start= demand
sc config ALG start= demand
sc config AppIDSvc start= demand
sc config tzautoupdate start= demand
sc config AppMgmt start= demand
sc config AppReadiness start= demand
sc config AppXSvc start= demand
sc config AppVClient start= disabled
sc config AssignedAccessManagerSvc= Auto
sc config autotimesvc start= demand
sc config AxInstSV start= demand
sc config BDESVC start= demand
sc config BFE start= Auto
sc config BITS start= demand
sc config BTAGService start= demand
sc config BrokerInfrastructure start= Auto
sc config BthAvctpSvc start= demand
sc config bthserv start= demand
sc config Browser start= demand
sc config CDPSvc start= delayed-auto
sc config CertPropSvc start= demand
sc config ClipSVC start= demand
sc config cloudidsvc start= demand
sc config COMSysApp start= demand
sc config CoreMessagingRegistrar start= Auto
sc config CryptSvc start= Auto
sc config CscService start= demand
sc config camsvc start= demand
sc config DcomLaunch start= Auto
sc config defragsvc start= demand
sc config DeviceAssociationService start= Auto
sc config DeviceInstall start= demand
sc config DevQueryBroker start= demand
sc config Dhcp start= Auto
sc config diagnosticshub.standardcollector.service start= demand
sc config DiagTrack start= Auto
sc config DialogBlockingService start= disabled
sc config DisplayEnhancementService start= demand
sc config DispBrokerDesktopSvc start= Auto
sc config DmEnrollmentSvc start= demand
sc config dmwappushservice start= Auto
sc config Dnscache start= Auto
sc config DoSvc start= demand
sc config dot3svc start= demand
sc config DPS start= Auto
sc config DsmSvc start= demand
sc config DsSvc start= demand
sc config Eaphost start= demand
sc config EFS start= demand
sc config embeddedmode start= demand
sc config EntAppSvc start= demand
sc config EventLog start= Auto
sc config EventSystem start= Auto
sc config Fax start= demand
sc config fdPHost start= demand
sc config FDResPub start= demand
sc config FileSyncHelper start= demand
sc config fhsvc start= demand
sc config FontCache start= Auto
sc config FontCache3.0.0.0 start= demand
sc config ftpsvc start= Auto
sc config GraphicsPerfSvc start= demand
sc config gpsvc start= Auto
sc config hidserv start= demand
sc config HNS start= demand
sc config HvHost start= demand
sc config icssvc start= demand
sc config InstallService start= demand
sc config lfsvc start= demand
sc config InventorySvc start= demand
sc config IEEtwCollectorService start= demand
sc config IISADMIN start= Auto
sc config IKEEXT start= demand
sc config iphlpsvc start= Auto
sc config iprip start= Auto
sc config IpxlatCfgSvc start= demand
sc config KeyIso start= demand
sc config KtmRm start= demand
sc config LanmanServer start= Auto
sc config LanmanWorkstation start= Auto
sc config lfsvc start= demand
sc config lltdsvc start= demand
sc config lmhosts start= demand
sc config LSM start= Auto
sc config MapsBroker start= delayed-auto
sc config McpManagementService start= demand
sc config MpsSvc start= Auto
sc config MSDTC start= demand
sc config MsKeyboardFilter start= disabled
sc config MSiSCSI start= demand
sc config msiserver start= demand
sc config NaturalAuthentication start= demand
sc config NcaSvc start= demand
sc config NcbService start= demand
sc config NcdAutoSetup start= demand
sc config Netlogon start= Auto
sc config Netman start= demand
sc config netprofm start= demand
sc config NetSetupSvc start= demand
sc config NetTcpPortSharing start= disabled
sc config NgcCtnrSvc start= demand
sc config NgcSvc start= demand
sc config NlaSvc start= Auto
sc config nsi start= Auto
sc config nvagent start= demand
sc config p2pimsvc start= demand
sc config p2psvc start= demand
sc config PcaSvc start= delayed-auto
sc config PeerDistSvc start= demand
sc config PerfHost start= demand
sc config pla start= demand
sc config PlugPlay start= demand
sc config PNRPAutoReg start= demand
sc config PNRPsvc start= demand
sc config PolicyAgent start= demand
sc config Power start= Auto
sc config PrintNotify start= demand
sc config ProfSvc start= Auto
sc config QWAVE start= demand
sc config RasAuto start= demand
sc config RasMan start= Auto
sc config RemoteAccess start= Disabled
sc config RemoteRegistry start= Disabled
sc config RetailDemo start= demand
sc config RmSvc start= demand
sc config RpcEptMapper start= Auto
sc config RpcLocator start= demand
sc config RpcSs start= Auto
sc config SamSs start= Auto
sc config SCardSvr start= demand
sc config ScDeviceEnum start= demand
sc config Schedule start= Auto
sc config SCPolicySvc start= demand
sc config SDRSVC start= demand
sc config seclogon start= demand
sc config SENS start= Auto
sc config SEMgrSvc start= demand
sc config SensorDataService start= demand
sc config SensorService start= demand
sc config SensrSvc start= demand
sc config SessionEnv start= demand
sc config SharedAccess start= demand
sc config ShellHWDetection start= Auto
sc config ssh-agent start= disabled
sc config smphost start= demand
sc config SmsRouter start= demand
sc config SNMPTRAP start= demand
sc config Spooler start= Auto
sc config sppsvc start= delayed-auto
sc config SSDPSRV start= demand
sc config SstpSvc start= demand
sc config StateRepository start= Auto
sc config stisvc start= Auto
sc config StorSvc start= delayed-auto
sc config svsvc start= demand
sc config swprv start= demand
sc config SysMain start= Auto
sc config SystemEventsBroker start= Auto
sc config TapiSrv start= demand
sc config TermService start= demand
sc config Themes start= Auto
sc config TrkWks start= Auto
sc config TrustedInstaller start= demand
sc config TroubleshootingSvc start= demand
sc config UmRdpService start= demand
sc config upnphost start= demand
sc config UserManager start= Auto
sc config UsoSvc start= delayed-auto
sc config VaultSvc start= demand
sc config vds start= demand
sc config vmcompute start= demand
sc config vmicguestinterface start= demand
sc config vmicheartbeat start= demand
sc config vmicrdv start= demand
sc config vmicshutdown start= demand
sc config vmictimesync start= demand
sc config vmicvmsession start= demand
sc config vmicvss start= demand
sc config VSS start= demand
sc config W32Time start= demand
sc config WalletService start= demand
sc config wbengine start= demand
sc config WbioSrvc start= demand
sc config Wcmsvc start= Auto
sc config wcncsvc start= demand
sc config WdiServiceHost start= demand
sc config WdiSystemHost start= demand
sc config WdNisSvc start= demand
sc config WebClient start= demand
sc config Wecsvc start= demand
sc config WEPHOSTSVC start= demand
sc config wercplsupport start= demand
sc config WerSvc start= demand
sc config WiaRpc start= demand
sc config WinDefend start= Auto
sc config WinHttpAutoProxySvc start= demand
sc config Winmgmt start= Auto
sc config WinRM start= demand
sc config WlanSvc start= Auto
sc config wlidsvc start= demand
sc config wlpasvc start= demand
sc config wmiApSrv start= demand
sc config WMPNetworkSvc start= Auto
sc config workfolderssvc start= demand
sc config WPDBusEnum start= demand
sc config WpcMonSvc start= demand
sc config WpnService start= Auto
sc config wscsvc start= delayed-auto
sc config WSearch start= delayed-auto
sc config wuauserv start= demand
sc config WwanSvc start= demand
sc config XblAuthManager start= demand
sc config XblGameSave start= demand
sc config XboxNetApiSvc start= demand

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
