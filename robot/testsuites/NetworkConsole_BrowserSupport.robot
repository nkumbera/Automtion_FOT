*** Settings ***
#Suite Setup       DMS Network Console UI Login   # Login DMS UI with AdminUser
Suite Teardown    DMS UI Logout   # Logging off
Resource        ../resources/common/ui_common.robot
Resource        ../resources/dashboard/dashboard_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/Dashboard/network_dashboard_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/Device_List/Device_List_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/Imports/Import_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/Alarms/Alarm_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/Reports/Report_Page_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/Configurations/Configuration_Page_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/Proactive_Job/Proactive_Job_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/Bulk_Configuration/Bulk_Page_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/Firmware_Upgrade/Firmware_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/Operator_Data/Operator_Data_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/Service_Package/Service_Package_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/Network_KPI/Network_KPI_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/Clusters/Cluster_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/Provisioning_Status/Provisioning_Status_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/System_Properties/System_Properties_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/DMS_Health/DMS_Health_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/DMS_Device_License/DMS_Device_License_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/Enterprise_View/Enterprise_View_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/License_Features/License_Features_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/License_Usages/License_Usages_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/NC_Device_Search/nc_device_search_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/NC_About/nc_about_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/Map_Usages/map_usages_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/NC_Online_Help/nc_online_help_keywords.robot
Resource        ../resources/NetworkConsoleBrowser/NC_Operational_History/nc_operational_history_keywords.robot
Test Teardown    DMS Network Console UI Logout




*** Variables ***


*** Test Cases ***

Verify Network Console Dashboard Page Navigation
    [Documentation]  NC Dashboard
    [Tags]  NC_Dashboard_Navigation   Browser     regression    NC_Browser     logout_verify    working
    #Network Console Dashboard Page Navigation
    DMS Network Console UI Login
    DMS Network console Logout
    #DMS Network Console UI Logout


Verify Network Console Device List Page Navigation
    [Documentation]  NC Device List
    [Tags]  NC_Device_List_Navigation   NC_Browser   Browser     regression     logout_verify    working
    DMS Network Console UI Login
    #Network Console Dashboard Page Navigation
    Network Console Device List Page Navigation
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s


Verify Network Import Page Navigation
    [Documentation]  NC Import
    [Tags]  NC_Imports_Navigation   NC_Browser   Browser     regression    working
    DMS Network Console UI Login
    #Network Console Dashboard Page Navigation
    Network Console Import Page Navigation
    Schedule Import Page Navigation
    File Import Page Navigation
    Inprogress Import Page Navigation
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s


Verify Network Alarm Page Navigation
    [Documentation]  NC Alarm
    [Tags]  NC_Alarms_Navigation   NC_Browser   Browser     regression    working
    DMS Network Console UI Login
    #Network Console Dashboard Page Navigation
    Network Console Alarm Page Navigation
    System Alarm Page Navigation
    Device Alarm Page Navigation
    Alarm Correlation Page Navigation
    Alarm Logging Rule Page Navigation
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s

Verify Network Report Page Navigation
    [Documentation]  NC Report
    [Tags]  NC_Reports_Navigation   NC_Browser   Browser     regression    working
    DMS Network Console UI Login
    #Network Console Dashboard Page Navigation
    Network Console Report Page Navigation
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s


Verify Network Configuration Page Navigation
    [Documentation]  NC Configuration
    [Tags]  NC_Configuration_Navigation   NC_Browser   Browser     regression    working
    DMS Network Console UI Login
    #Network Console Dashboard Page Navigation
    Network Console Configuration Page Navigation
    Product SKU Page Navigation
    SNMP Page Navigation
    SMTP Page Navigation
    EMAIL Page Navigation
    SMS Page Navigation
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s

Verify Network Proactive_Job Page Navigation
    [Documentation]  NC Proactive_job
    [Tags]  NC_Proactive_Navigation   NC_Browser   Browser     regression    working
    DMS Network Console UI Login
    #Network Console Dashboard Page Navigation
    Network Console Proactive_Page Page Navigation
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s

Verify Network Bulk Configuration Page Navigation
    [Documentation]  NC Bulk Configuration
    [Tags]  NC_Bulk_Navigation   NC_Browser   Browser     regression    working
    DMS Network Console UI Login
    #Network Console Dashboard Page Navigation
    Network Console Bulk Configuration Page Navigation
    Bulk Device Configuration Page Navigation
    Bulk Network Policy Page Navigation
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s

Verify Network Firmware Upgrade Page Navigation
    [Documentation]  NC Firmware Upgrade
    [Tags]  NC_Firmware_Navigation   NC_Browser   Browser1     regression    working
    DMS Network Console UI Login
    #Network Console Dashboard Page Navigation
    Network Console Firmware Upgrade Page Navigation
    Manage Upgrade Page Navigation
    #Firmware Image Page Navigation
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s

Verify Network Operator Data Page Navigation
    [Documentation]  NC Operator Data Upgrade
    [Tags]  NC_Operator_Data_Navigation   NC_Browser   Browser1     regression    working
    DMS Network Console UI Login
    #Network Console Dashboard Page Navigation
    Network Console Operator Data Page Navigation
    OP_Service_Setting Page Navigation
    OP_TAC_POOL Page Navigation
    OP_ZIP Page Navigation
    OP_CDMA_LCIB Page Navigation
    #OP_LTE_LCIB Page Navigation
    #OP_PN Page Navigation
    #OP_MSCID Page Navigation
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s

Verify Network Service Package Page Navigation
    [Documentation]  NC Service package page
    [Tags]  NC_Service_Package_Navigation   NC_Browser   Browser     regression    working
    DMS Network Console UI Login
    Network Console Service_Package Page Navigation
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s

Verify Network Console Network KPI Page Navigation
    [Documentation]  NC Network KPI page
    [Tags]  NC_Network_KPI_Navigation   NC_Browser   Browser     regression    working
    DMS Network Console UI Login
    Network Console Network KPI Page Navigation
    Network Console Manage KPI Page Navigation
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s

Verify Network Clusters Page Navigation
    [Documentation]  NC Clusters page
    [Tags]  NC_Clusters_Navigation   NC_Browser   Browser     regression    working
    DMS Network Console UI Login
    Network Console Clusters Page Navigation
    Network Console Cluster Management Page Navigation
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s

Verify Network Provisioning Status Page Navigation
    [Documentation]  NC provisioning status page
    [Tags]  NC_Provisioning_Status_Navigation   NC_Browser   Browser     regression    working
    DMS Network Console UI Login
    Network Console Provisioning Status Page Navigation
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s

Verify Network System Properties Page Navigation
    [Documentation]  NC System Properties page
    [Tags]  NC_System_Properties_Navigation   NC_Browser   Browser     regression    working
    DMS Network Console UI Login
    Network Console System Properties Page Navigation
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s

Verify Network DMS Health Page Navigation
    [Documentation]  NC DMS Health page
    [Tags]  NC_DMS_Health_Navigation   NC_Browser   Browser     regression    working
    DMS Network Console UI Login
    Network Console DMS Health Page Navigation
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s

Verify Network DMS Device License Page Navigation
    [Documentation]  NC DMS Device License page
    [Tags]  NC_DMS_Device_License_Navigation   NC_Browser   Browser     regression    working
    DMS Network Console UI Login
    Network Console DMS Device License Page Navigation
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s

Verify Network Enterprise View Page Navigation
    [Documentation]  NC Enterprise View page
    [Tags]  NC_Enterprise_View_Navigation   NC_Browser   Browser     regression    working
    DMS Network Console UI Login
    Network Console Enterprise View Page Navigation
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s

Verify Network Licensed Features Page Navigation
    [Documentation]  NC Licensed Features page
    [Tags]  NC_Licensed_Features_Navigation   NC_Browser   Browser     regression    working
    DMS Network Console UI Login
    Network Console Licensed Features Page
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s

Verify Network License Usages Report Navigation
    [Documentation]  NC License Usages Report export
    [Tags]  NC_License_Usages_Navigation   NC_Browser   Browser     regression    working
    DMS Network Console UI Login
    Network Console License Usages Report
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s

Verify Network Map Usages Count Navigation
    [Documentation]  NC Map Usages Count
    [Tags]  NC_Map_Count_Navigation   NC_Browser   Browser     regression    working
    DMS Network Console UI Login
    Network Console Map Count Page
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s

Verify Network Operational History Navigation
    [Documentation]  NC Operational History
    [Tags]  NC_Operational_History_Navigation   NC_Browser   Browser     regression    working
    DMS Network Console UI Login
    Network Console Opeartional History
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s


Verify Network Console Online Help Navigation
    [Documentation]  NC Online Help
    [Tags]  NC_Online_Help_Navigation   NC_Browser   Browser     regression    working
    DMS Network Console UI Login
    Network Console Online Help
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s

Verify Network Console Device Search Navigation
    [Documentation]  NC Device Search
    [Tags]  NC_Search_Navigation   NC_Browser   Browser     regression    working
    DMS Network Console UI Login
    Network Console Device Search
    Network Console Home
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s

Verify Network Console About Navigation
    [Documentation]  NC About
    [Tags]  NC_About_Navigation   NC_Browser   Browser    regression    working
    DMS Network Console UI Login
    Network Console About Page
    DMS Network console Logout
    #DMS Network Console UI Logout
    BuiltIn.Sleep  30s






