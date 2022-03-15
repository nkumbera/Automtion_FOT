*** Settings ***
Library            SSHLibrary
Suite Setup       DMS Network Console UI Login   # Login DMS UI with AdminUser
Suite Teardown    DMS Network Console UI Logout    # Logging off
Resource  ../resources/common/ui_common.robot
Resource  ../resources/network_console_report/report_keywords.robot
#Resource   ../resources/overwrridden_params/overwrridden_params.robot
Resource    testsuites/overridden_param.robot

*** Variables ***


*** Test Cases ***
Report TestCase (Export BC Master Report)
    [Documentation]  Exporting the BC Master report
    [Tags]  Reports   BC_Master     regression    working
    ${BC_Master_File_Name}=    OneCell BC Report Download File    OneCell BC Master    Master-device-config
    BuiltIn.Sleep  10s
    Verify BC Master Report Content    ${EXECDIR}\\robot\\report_files\\${BC_Master_File_Name}    Serial Number    0005B94238A0

Report TestCase (Export BC Device Status Report)
    [Documentation]  Exporting the BC Device Status
    [Tags]  Reports   BC_Device     regression    working
    ${BC_Device_Status_File_Name}=    OneCell BC Report Download File    BC Device Status     Master-device-status
    BuiltIn.Sleep  20s
    Verify BC Device Status Content    ${EXECDIR}\\robot\\report_files\\${BC_Device_Status_File_Name}     Serial_Number     0005B94238A0

Report TestCase (Export Device License Report)
    [Documentation]  Exporting the Device License Status
    [Tags]  Reports   License_Report    regression    working
    ${License_file_name}=    OneCell BC Report Download File    Device License      LicenseInUse
    BuiltIn.Sleep  10s
    Verify License File Content    ${EXECDIR}\\robot\\report_files\\${License_file_name}        license     0005B94238A0

Report TestCase (Export RP5100 Device Status Report)
    [Documentation]  Exporting the RP5100 Device Status
    [Tags]  Reports   RP5100_Device_Status    regression    working
    ${RP5100_Device_Status_file_name}=     OneCell BC Report Download File    RP5100 Device Status    ONECELL_RU51_RFModule_Master-device-status
    BuiltIn.Sleep  10s
    Verify RP5100 Device Status Content    ${EXECDIR}\\robot\\report_files\\${RP5100_Device_Status_file_name}        Site Location     Automation_Venue


Report TestCase (Export RP Device Status Report)
    [Documentation]  Exporting the RP Device Status
    [Tags]  Reports   RP_Device_Report      regression    working
    #OneCell RP Device Status Download File
    ${RP_Device_Status_file_name}=     OneCell BC Report Download File    RP Device Status    Radio_Master-device-status
    BuiltIn.Sleep  10s
    Verify RP Device Status Content    ${EXECDIR}\\robot\\report_files\\${RP_Device_Status_file_name}        RP Serial Number     DXE70257


Report TestCase (Export BC Delta Device Config Report)
    [Documentation]  Exporting the BC Delta Device Config
    [Tags]  Reports   BC_Delta_Device       regression    working
    #OneCell BC Delta Device Config Status Download File
    ${BC_Delta_Device_config_file_name}=     OneCell BC Report Download File    BC Delta Device Config    Cntrl_Delta-device-config
    BuiltIn.Sleep  10s
    Verify BC Delta Device Config Content    ${EXECDIR}\\robot\\report_files\\${BC_Delta_Device_config_file_name}        Serial Number     0005B925A04


Report TestCase (Export RP Delta Device Config Report)
    [Documentation]  Exporting the BC Device Status
    [Tags]  Reports   RP_Delta_Device       regression    working
    #OneCell RP Delta Device Config Status Download File
    ${RP_Delta_Device_config_Status_file_name}=     OneCell BC Report Download File    RP Delta Device Config    Radio_Delta-device-config
    BuiltIn.Sleep  10s
    Verify RP Delta Device Config Content    ${EXECDIR}\\robot\\report_files\\${RP_Delta_Device_config_Status_file_name}        RP Serial Number     0005B9ABB01


Report TestCase (Export RP Master Device Config Report)
    [Documentation]  Exporting the RP Master Device Config Status
    [Tags]  Reports   RP_Master_Device      regression    working
    #OneCell RP Master Device Config Status Download File
    ${RP_Master_Device_Config_file_name}=     OneCell BC Report Download File    RP Master Device Config   Radio_Master-device-config
    BuiltIn.Sleep  10s
    Verify RP Master Device Config Content    ${EXECDIR}\\robot\\report_files\\${RP_Master_Device_Config_file_name}        RP Serial Number     0005B9ABB01


Report TestCase (Export GoldStandard Compliance Report)
    [Documentation]  Exporting the GoldStandard Compliance Status
    [Tags]  Reports   GoldStandard_4g      regression    sustenance6.0
    OneCell GoldStandard Compliance Status Download File
    ${Gold_standard_file}    Copy 4g GoldStandard Compliance File Locally
    Verify 4g Gold GoldStandard Compliance Report content    ${EXECDIR}\\robot\\report_files\\${Gold_standard_file}    Gold Standard    Device


Report TestCase (Export RP5100 Delta Device Config Report)
    [Documentation]  Exporting the RP5100 Delta Device Config Status
    [Tags]  Reports   RP_5100_Delta_Device    regression    working
    #OneCell RP5100 Delta Device Config Download File
    #OneCell RP Master Device Config Status Download File
    ${RP5100_Delta_Device_Config_file_name}=     OneCell BC Report Download File    RP5100 Delta Device Config     ONECELL_RU51_RFModule_Delta-device-config
    BuiltIn.Sleep  10s
    Verify RP5100 Delta Device Config Content    ${EXECDIR}\\robot\\report_files\\${RP5100_Delta_Device_Config_file_name}        RP5100 Serial Number     Spare


Report TestCase (Export RP5100 Master Device Config Report)
    [Documentation]  Exporting the RP5100 Master Device Config Status
    [Tags]  Reports   RP_5100_Master_Device    regression    working
    #OneCell RP5100 Master Device Config Download File
    ${RP5100_Master_Device_Config_file_name}=     OneCell BC Report Download File    RP5100 Master Device Config     ONECELL_RU51_RFModule_Master-device-config
    BuiltIn.Sleep  10s
    Verify RP5100 Master Device Config Content    ${EXECDIR}\\robot\\report_files\\${RP5100_Master_Device_Config_file_name}        RP5100 Serial Number     Spare


Blacklisting Radio Point
    [Documentation]  Blacklisting Radio Point
    [Tags]  Blacklist      Phase2    regression    working
    #Remove Blacklisting
    Radio Point Blacklist
    Verify Blacklisted Radio Point
    Remove Blacklisted Radio Point

Report TestCase (Export ONECELL5G CUCP Device Config)
    [Documentation]  Exporting the ONECELL5G CUCP Device Config
    [Tags]  Reports   ONECELL5G_CUCP_Device_Config    5GReports    regression    regression_6.0
    ONECELL5G CUCP Device Config Download File


Report TestCase (Export ONECELL5G CUUP Device Config)
    [Documentation]  Exporting the ONECELL5G CUUP Device Config
    [Tags]  Reports   ONECELL5G_CUUP_Device_Config    5GReports    regression    regression_6.0
    ONECELL5G CUUP Device Config Download File

Report TestCase (Export ONECELL5G DU Device Config)
    [Documentation]  Exporting the ONECELL5G DU Device Config
    [Tags]  Reports   ONECELL5G_DU_Device_Config    5GReports    regression    regression_6.0
    ONECELL5G DU Device Config Download File

Export ONECELL5G CUCP Device status
    [Documentation]  Exporting the ONECELL5G CUCP Device status
    [Tags]  Reports   ONECELL5G_CUCP_Device_status    5GReports    regression    regression_6.0
    ONECELL5G CUCP Device Status Download File

Export ONECELL5G CUUP Device status
    [Documentation]  Exporting the ONECELL5G CUUP Device status
    [Tags]  Reports   ONECELL5G_CUUP_Device_status    5GReports    regression    regression_6.0
    ONECELL5G CUUP Device Status Download File

Export ONECELL5G DU Device status
    [Documentation]  Exporting the ONECELL5G DU Device status
    [Tags]  Reports   ONECELL5G_DU_Device_status    5GReports    regression    regression_6.0
    ONECELL5G DU Device Status Download File

Export ONECELL RP5200 Device Status
    [Documentation]  Exporting the ONECELL RP5200 Device Status
    [Tags]  Reports   ONECELL5G_RP5200_Device_status    5GReports    regression    regression_6.0
    ONECELL RP5200 Device Status Download File



Verify Edit of OneCell5G CUCP Device Config Report
    [Documentation]  Edit of OneCell5G CUCP Device Config report
    [Tags]  Reports   ONECELL5G_CUCP_Device_Config    5GReports    regression    regression_6.0
    ONECELL5G CUCP Device Config Edit Report

Verify Edit of OneCell5G CUUP Device Config Report
    [Documentation]  Edit of OneCell5G CUUP Device Config report
    [Tags]  Reports   ONECELL5G_CUUP_Device_Config    5GReports    regression    regression_6.0
    ONECELL5G CUUP Device Config Edit Report

Verify Edit of OneCell5G DU Device Config Report
    [Documentation]  Edit of OneCell5G DU Device Config report
    [Tags]  Reports   ONECELL5G_DU_Device_Config    5GReports    regression    regression_6.0
    ONECELL5G DU Device Config Edit Report



Verify Edit of OneCell5G CUCP Device Status Report
    [Documentation]  Edit of OneCell5G CUCP Device Status report
    [Tags]  Reports   ONECELL5G_CUCP_Device_Status    5GReports    regression    regression_6.0
    ONECELL5G CUCP Device Status Edit Report

Verify Edit of OneCell5G CUUP Device Status Report
    [Documentation]  Edit of OneCell5G CUUP Device Status report
    [Tags]  Reports   ONECELL5G_CUUP_Device_Status    5GReports    regression    regression_6.0
    ONECELL5G CUUP Device Status Edit Report

Verify Edit of OneCell5G DU Device Status Report
    [Documentation]  Edit of OneCell5G DU Device Status report
    [Tags]  Reports   ONECELL5G_DU_Device_Status    5GReports    regression    regression_6.0
    ONECELL5G DU Device Status Edit Report


Report TestCase (Export GoldStandard Compliance Report for 5G VNFs)
    [Documentation]  Exporting the GoldStandard Compliance Status Report for 5G VNFs
    [Tags]  Reports   GoldStandard_5g    GoldStandard      regression    regression_6.0    sustenance6.0
    OneCell 5G GoldStandard Compliance Status Download File
    ${Gold_standard_5g_file}    Copy 5g GoldStandard Compliance File Locally
    Verify 5g Gold GoldStandard Compliance Report content    ${EXECDIR}\\robot\\report_files\\${Gold_standard_5g_file}    Site Location    Automation_Venue
