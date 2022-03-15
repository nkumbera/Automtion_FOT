*** Settings ***
Resource        ../resources/common/ui_common.robot
Resource        ../resources/dashboard/dashboard_keywords.robot
Resource        ../resources/DeviceConsoleBrowser/Dashboard/device_dashboard_keywords.robot
Resource        ../resources/DeviceConsoleBrowser/TimingSource/timingsource_keywords.robot
Resource        ../resources/DeviceConsoleBrowser/Alarms/device_alarms_keywords.robot
Resource        ../resources/DeviceConsoleBrowser/DMS_Overridden/dms_overridden_keywords.robot
Resource        ../resources/DeviceConsoleBrowser/Other_Overridden/other_overridden_keywords.robot
Resource        ../resources/DeviceConsoleBrowser/Operational_Params/operational_params_keywords.robot
Resource        ../resources/DeviceConsoleBrowser/Provisioning/provisioning_keywords.robot
Resource        ../resources/DeviceConsoleBrowser/Map_Details/map_details_keywords.robot
Resource        ../resources/DeviceConsoleBrowser/Device_History/device_history_keywords.robot
Resource        ../resources/DeviceConsoleBrowser/Device_PnP/device_pnp_keywords.robot
Resource        ../resources/DeviceConsoleBrowser/RP_Mapping/rp_mapping_keywords.robot
Resource        ../resources/DeviceConsoleBrowser/Device_KPI/device_kpi_keywords.robot
Resource        ../resources/DeviceConsoleBrowser/License/license_keywords.robot
Resource        ../resources/DeviceConsoleBrowser/Device_Policy/device_policy_keywords.robot
Resource        ../resources/DeviceConsoleBrowser/Communication_Logs/communication_logs_keywords.robot
Resource        ../resources/DeviceConsoleBrowser/DC_About/dc_about_keywords.robot
Resource        ../resources/DeviceConsoleBrowser/DC_Notification/dc_notification_keywords.robot
Resource        ../resources/DeviceConsoleBrowser/DC_Operationl_History/dc_operational_keywords.robot
Resource        ../resources/DeviceConsoleBrowser/DC_Help/dc_help_keywords.robot
Resource        ../resources/DeviceConsoleBrowser/Backup_Restore/backup_restore_keywords.robot
Resource        ../resources/DeviceConsoleBrowser/DC_Device_Search/dc_device_search_keywords.robot



*** Variables ***


*** Test Cases ***

Verify Device Dashboard page Navigation
    [Documentation]  DC Dashboard
    [Tags]  DC_Dashboard_Navigation   DC_Browser   Browser     regression    working
    Device Console Dashboard
    DMS UI Logout


Verify Device Timing Source page Navigation
    [Documentation]  DC Timing Source
    [Tags]  DC_Timing_Navigation   DC_Browser   Browser     regression    working
    Device Console Dashboard
    Device Console Timing Source
    DMS UI Logout

Verify Device Alarm page Navigation
    [Documentation]  DC Device Alarms
    [Tags]  DC_Alarms_Navigation   DC_Browser   Browser     regression    working
    Device Console Dashboard
    Device Console Alarms
    DMS UI Logout

Verify Device DMS Overridden Parameters page Navigation
    [Documentation]  DC Configuration
    [Tags]  DC_DMS_Overridden_Navigation   DC_Browser   Browser     regression    working
    Device Console Dashboard
    Device Console DMS Overridden Params
    DMS UI Logout

Verify Device Other Overridden Parameters page Navigation
    [Documentation]  DC other overridden
    [Tags]  DC_Other_Overridden_Navigation   DC_Browser   Browser     regression    working
    Device Console Dashboard
    Device Console Other Overridden Parameters Page
    DMS UI Logout

Verify Device Operational Parameters page Navigation
    [Documentation]  DC operational
    [Tags]  DC_Operational_Navigation   DC_Browser   Browser     regression    working
    Device Console Dashboard
    Device Console Opeartional Params
    DMS UI Logout

Verify Device Provisioning page Navigation
    [Documentation]  DC Provisioning
    [Tags]  DC_Provisioning_Navigation   DC_Browser   Browser     regression    working
    Device Console Dashboard
    Device Console Provisioning Page
    DMS UI Logout

Verify Device Map Details page Navigation
    [Documentation]  DC Map Details
    [Tags]  DC_Map_Navigation   DC_Browser   Browser     regression    working
    Device Console Dashboard
    Device Console Map Details
    DMS UI Logout

Verify Device History page Navigation
    [Documentation]  DC history
    [Tags]  DC_History_Navigation   DC_Browser   Browser     regression    working
    Device Console Dashboard
    Device Console History
    DMS UI Logout

Verify Device PnP page Navigation
    [Documentation]  DC PnP
    [Tags]  DC_PnP_Navigation   DC_Browser   Browser     regression    working
    Device Console Dashboard
    Device Console PnP Status
    DMS UI Logout

Verify Device RP Mapping page Navigation
    [Documentation]  DC RP Mapping
    [Tags]  DC_RP_Navigation   DC_Browser   Browser    regression    working
    Device Console Dashboard
    Device Console RP Mapping
    DMS UI Logout

Verify Device KPI page Navigation
    [Documentation]  DC Device KPI
    [Tags]  DC_KPI_Navigation   DC_Browser   Browser     regression    working
    Device Console Dashboard
    Device Console KPI
    DMS UI Logout

Verify Device License page Navigation
    [Documentation]  DC Device License
    [Tags]  DC_License_Navigation   DC_Browser   Browser     regression    working
    Device Console Dashboard
    Device Console License
    DMS UI Logout

Verify Device Policy page Navigation
    [Documentation]  DC Device Policy
    [Tags]  DC_Policy_Navigation   DC_Browser   Browser     regression    working
    Device Console Dashboard
    Device Console Policy
    DMS UI Logout

Verify Device Communication Logs page Navigation
    [Documentation]  DC Device Communication Logs
    [Tags]  DC_Comm_Logs_Navigation   DC_Browser   Browser    regression    working
    Device Console Dashboard
    Device Console Communication Logs
    DMS UI Logout

Verify Device Console About page Navigation
    [Documentation]  DC About
    [Tags]  DC_About_Navigation   DC_Browser   Browser     regression    working
    Device Console Dashboard
    Device Console About Information
    DMS UI Logout

Verify Device Console Notification page Navigation
    [Documentation]  DC Notification
    [Tags]  DC_Notification_Navigation   DC_Browser   Browser     regression    working
    Device Console Dashboard
    Device Console Notifications
    DMS UI Logout

Verify Device Console Operational History page Navigation
    [Documentation]  DC Operational History
    [Tags]  DC_Op_History_Navigation   DC_Browser   Browser     regression    working
    Device Console Dashboard
    Device Console Operational History
    DMS UI Logout

Verify Device Console Online Help page Navigation
    [Documentation]  DC Online help
    [Tags]  DC_Help_Navigation   DC_Browser   Browser     regression    working
    Device Console Dashboard
    Device Console Online Help
    DMS UI Logout

Verify Device Console Backup Restore Navigation
    [Documentation]  DC Backup Restore
    [Tags]  DC_Restore_Navigation   DC_Browser   Browser     regression    working
    Device Console Dashboard
    Device Console Backup Restore Action
    DMS UI Logout

Verify Device Console Device Search Navigation
    [Documentation]  DC Device Search
    [Tags]  DC_Search_Navigation   DC_Browser   Browser    regression    working
    Device Console Dashboard
    Device Console Device Search
    DMS UI Logout