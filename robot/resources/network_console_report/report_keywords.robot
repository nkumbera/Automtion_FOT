*** Settings ***
Resource            page/Report_helper.robot
Library  String

*** Variables ***
${HOST}                ${SERVER_IP}
${USERNAME}            ${SERVER_USERNAME}
${PASSWORD}            ${SERVER_PASSWORD}


*** Keywords ***
OneCell BC Report Download File
    [Documentation]    Download the Report file in History Page
    [Arguments]     ${Export_report_filter_name}     ${Report_Filter_Name_for_Download}
    Open Reports Page
    OneCell BC Master Report    ${Export_report_filter_name}
    Apply Filter
    Click CheckBox
    Export Report
    BuiltIn.Sleep  60s
    Operational History Navigate
    Operational History Apply Filter Master device config    ${Report_Filter_Name_for_Download}
    ${File_name_BC_Master}=    Operational History Download BC Master Report File
    Copy File To Location    ${File_name_BC_Master}
    [Return]    ${File_name_BC_Master}

OneCell BC Device Status Download File
    [Documentation]    Download the Report file in History Page
    Open Reports Page
    #Enable toggle button
    OneCell BC Device Status
    Apply Filter
    Click CheckBox
    Export Report
    BuiltIn.Sleep  60s
    Operational History Navigate
    Operational History Apply Filter Master device status
    Operational History Download BC Device Status Report File
    Copy File To Location

OneCell Device License Download File
    [Documentation]    Download the Report file in History Page
    Open Reports Page
    #Enable toggle button
    OneCell Device License
    Apply Filter
    Click CheckBox
    Export Report
    BuiltIn.Sleep  60s
    Operational History Navigate
    Operational History Apply Filter Device License
    Operational History Download LicenseInUse Report File
    Copy File To Location

OneCell RP5100 Device Status Download File
    [Documentation]    Download the Report file in History Page
    Open Reports Page
    #Enable toggle button
    OneCell RP5100 Device Status
    Apply Filter
    Click CheckBox
    Export Report
    BuiltIn.Sleep  60s
    Operational History Navigate
    Operational History Apply Filter RP5100 Device Status
    Operational History Download RP5100 Device Status Report File
    Copy File To Location

OneCell RP Device Status Download File
    [Documentation]    Download the Report file in History Page
    Open Reports Page
    #Enable toggle button
    OneCell RP Device Status
    Apply Filter
    Click CheckBox
    Export Report
    BuiltIn.Sleep  60s
    Operational History Navigate
    Operational History Apply Filter RP Device Status
    Operational History Download RP Device Status Report File
    Copy File To Location


OneCell BC Delta Device Config Status Download File
    [Documentation]    Download the Report file in History Page
    Open Reports Page
    #Enable toggle button
    OneCell BC Delta Device Config
    Apply Filter
    Click CheckBox
    Export Report
    BuiltIn.Sleep  60s
    Operational History Navigate
    Operational History Apply Filter BC Delta Device Config
    Operational History Download BC Delta Device Report File
    Copy File To Location

OneCell RP Delta Device Config Status Download File
    [Documentation]    Download the Report file in History Page
    Open Reports Page
    #Enable toggle button
    OneCell RP Delta Device Config
    Apply Filter
    Click CheckBox
    Export Report
    BuiltIn.Sleep  60s
    Operational History Navigate
    Operational History Apply Filter RP Delta Device Config
    Operational History Download RP Delta Device Report File
    Copy File To Location

OneCell RP Master Device Config Status Download File
    [Documentation]    Download the Report file in History Page
    Open Reports Page
    #Enable toggle button
    OneCell RP Master Device Config
    Apply Filter
    Click CheckBox
    Export Report
    BuiltIn.Sleep  60s
    Operational History Navigate
    Operational History Apply Filter RP Master Device Config
    Operational History Download RP Master Device Report File
    Copy File To Location

OneCell GoldStandard Compliance Status Download File
    [Documentation]    Download the Report file in History Page
    Open Reports Page
    #Enable toggle button
    OneCell GoldStandard Compliance
    Apply Filter
    Click CheckBox
    Export Report
    BuiltIn.Sleep  60s
    Operational History Navigate
    Operational History Apply Filter GoldStandard Compliance
    Operational History Download GoldStandard Compliance Report File
    #Copy File To Location

OneCell RP5100 Delta Device Config Download File
    [Documentation]    Download the Report file in History Page
    Open Reports Page
    #Enable toggle button
    OneCell RP5100 Delta Device Config
    Apply Filter
    Click CheckBox
    Export Report
    BuiltIn.Sleep  60s
    Operational History Navigate
    Operational History Apply Filter RP5100 Delta Device Config
    Operational History Download RP5100 Delta Device Config Report File
    Copy File To Location

OneCell RP5100 Master Device Config Download File
    [Documentation]    Download the Report file in History Page
    Open Reports Page
    #Enable toggle button
    OneCell RP5100 Master Device Config
    Apply Filter
    Click CheckBox
    Export Report
    BuiltIn.Sleep  60s
    Operational History Navigate
    Operational History Apply Filter RP5100 Master Device Config
    Operational History Download RP5100 Master Device Config Report File
    Copy File To Location


Radio Point Blacklist
    Open Device List
    Radio Point Blacklist filter Select

Verify Blacklisted Radio Point
    BuiltIn.Sleep  180s
    Open Operation History tab
    Verify Blacklist

Remove Blacklisted Radio Point
    Open Device List
    Remove RP from blacklist
    BuiltIn.Sleep  180s
    Open Operation History tab
    Verify Blacklist Removal

Remove Blacklisting
    Open Device List
    Remove RP from blacklist
    BuiltIn.Sleep  120s


ONECELL5G CUCP Device Config Download File
    [Documentation]    Download the Report file in History Page
    Open Reports Page
    #Enable toggle button
    ONECELL5G CUCP Device Config
    Apply Filter
    Click CheckBox
    Export Report
    BuiltIn.Sleep  50s
    Operational History Navigate
    Operational History Apply Filter ONECELL5G CUCP Device Config
    Operational History Download ONECELL5G CUCP Device Config Report File
    #Copy File To Location

ONECELL5G CUCP Device Status Download File
    [Documentation]    Download the Report file in History Page
    Open Reports Page
    #Enable toggle button
    ONECELL5G CUCP Device Status
    Apply Filter
    Click CheckBox
    Export Report
    BuiltIn.Sleep  50s
    Operational History Navigate
    Operational History Apply Filter ONECELL5G Device Status    CUCP-Status
    Operational History Download ONECELL5G CUCP Device Report File    Download completed for CUCP-Status    Success
    #Copy File To Location

ONECELL5G CUUP Device Config Download File
    [Documentation]    Download the Report file in History Page
    Open Reports Page
    #Enable toggle button
    ONECELL5G CUUP Device Config
    Apply Filter
    Click CheckBox
    Export Report
    BuiltIn.Sleep  60s
    Operational History Navigate
    Operational History Apply Filter ONECELL5G CUUP Device Config
    Operational History Download ONECELL5G CUUP Device Config Report File
    #Copy File To Location

ONECELL5G CUUP Device Status Download File
    [Documentation]    Download the Report file in History Page
    Open Reports Page
    #Enable toggle button
    ONECELL5G CUUP Device Status
    Apply Filter
    Click CheckBox
    Export Report
    BuiltIn.Sleep  50s
    Operational History Navigate
    Operational History Apply Filter ONECELL5G Device Status    CUUP-Status
    Operational History Download ONECELL5G CUCP Device Report File    Download completed for CUUP-Status    Success
    #Copy File To Location

ONECELL5G DU Device Config Download File
    [Documentation]    Download the Report file in History Page
    Open Reports Page
    #Enable toggle button
    ONECELL5G DU Device Config
    Apply Filter
    Click CheckBox
    Export Report
    BuiltIn.Sleep  60s
    Operational History Navigate
    Operational History Apply Filter ONECELL5G DU Device Config
    Operational History Download ONECELL5G DU Device Config Report File
    #Copy File To Location

ONECELL5G DU Device Status Download File
    [Documentation]    Download the Report file in History Page
    Open Reports Page
    #Enable toggle button
    ONECELL5G DU Device Status
    Apply Filter
    Click CheckBox
    Export Report
    BuiltIn.Sleep  50s
    Operational History Navigate
    Operational History Apply Filter ONECELL5G Device Status    DU-Status
    Operational History Download ONECELL5G CUCP Device Report File    Download completed for DU-Status    Success
    #Copy File To Location


ONECELL RP5200 Device Status Download File
    [Documentation]    Download the Report file in History Page
    Open Reports Page
    #Enable toggle button
    ONECELL RP5200 Device Status
    Apply Filter
    Click CheckBox
    Export Report
    BuiltIn.Sleep  50s
    Operational History Navigate
    Operational History Apply Filter ONECELL5G Device Status    0005B9-CS_ONECELL_RU52_RFModule
    Operational History Download ONECELL5G CUCP Device Report File    Download completed for 0005B9-CS_ONECELL_RU52_RFModule    Success
    #Copy File To Location

ONECELL5G CUCP Device Config Edit Report
    [Documentation]    Edit the Report file Timing in Reports Page
    Open Reports Page
    #ONECELL5G CUCP Device Config
    ONECELL5G Device Config    ONECELL5G CUCP Device Config
    Apply Filter
    Click CheckBox
    Edit ONECELL5G VNF Device Config Report    ONECELL5G CUCP Device Config

ONECELL5G CUUP Device Config Edit Report
    [Documentation]    Edit the Report file Timing in Reports Page
    Open Reports Page
    #ONECELL5G CUCP Device Config
    ONECELL5G Device Config    ONECELL5G CUUP Device Config
    Apply Filter
    Click CheckBox
    Edit ONECELL5G VNF Device Config Report    ONECELL5G CUUP Device Config

ONECELL5G DU Device Config Edit Report
    [Documentation]    Edit the Report file Timing in Reports Page
    Open Reports Page
    #ONECELL5G CUCP Device Config
    ONECELL5G Device Config    ONECELL5G DU Device Config
    Apply Filter
    Click CheckBox
    Edit ONECELL5G VNF Device Config Report    ONECELL5G DU Device Config


ONECELL5G CUCP Device Status Edit Report
    [Documentation]    Edit the Report file Timing in Reports Page
    Open Reports Page
    #ONECELL5G CUCP Device Config
    ONECELL5G Device Config    ONECELL5G CUCP Device Status
    Apply Filter
    Click CheckBox
    Edit ONECELL5G VNF Device Config Report    ONECELL5G CUCP Device Status

ONECELL5G CUUP Device Status Edit Report
    [Documentation]    Edit the Report file Timing in Reports Page
    Open Reports Page
    #ONECELL5G CUCP Device Config
    ONECELL5G Device Config    ONECELL5G CUUP Device Status
    Apply Filter
    Click CheckBox
    Edit ONECELL5G VNF Device Config Report    ONECELL5G CUUP Device Status

ONECELL5G DU Device Status Edit Report
    [Documentation]    Edit the Report file Timing in Reports Page
    Open Reports Page
    #ONECELL5G CUCP Device Config
    ONECELL5G Device Config    ONECELL5G DU Device Status
    Apply Filter
    Click CheckBox
    Edit ONECELL5G VNF Device Config Report    ONECELL5G DU Device Status

OneCell 5G GoldStandard Compliance Status Download File
    [Documentation]    Download the Report file in History Page
    Open Reports Page
    #Enable toggle button
    OneCell 5G GoldStandard Compliance
    Apply Filter
    Click CheckBox
    Export Report
    BuiltIn.Sleep  60s
    Operational History Navigate
    Operational History Apply Filter GoldStandard Compliance
    Operational History Download GoldStandard Compliance Report File
    #Copy File To Location

