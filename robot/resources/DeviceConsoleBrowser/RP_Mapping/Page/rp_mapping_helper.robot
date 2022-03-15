*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../dashboard/dashboard_keywords.robot
#Resource            robot/resources/DeviceConsoleBrowser/Dashboard/Page/device_dashboard_helper.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           rp_mapping_ui_controls.py

*** Variables ***
${value_to_set}

*** Keywords ***

Open RP Mapping Main Menu Page
    [Documentation]  click on rp mapping menu
    BuiltIn.Sleep  5s
    #Click DMS Element  ${ID_Valdin_License}
    #BuiltIn.Sleep  3s
    Click DMS Element  ${RP_Mapping_Menu}
    BuiltIn.Sleep  5s

Open RP Mapping Dashboard Page
    [Documentation]  click on rp dashboard menu
    BuiltIn.Sleep  5s
    #Scroll Element Into View  ${Device_Comm_Logs_Menu}
    #BuiltIn.Sleep  3s
    Click DMS Element  ${RP_Mapping_Dashboard}
    #go to    ${RP_Mapping_Dashboard_URL}
    BuiltIn.Sleep  5s

Open RP Mapping Operational Page
    [Documentation]  click on rp operational menu
    BuiltIn.Sleep  5s
    #Scroll Element Into View  ${Device_Comm_Logs_Menu}
    #BuiltIn.Sleep  3s
    Click DMS Element  ${RP_Mapping_Operational}
    #go to    ${RP_Mapping_Operational_URL}
    BuiltIn.Sleep  5s

Open RP Mapping Provisioned Page
    [Documentation]  click on rp provisioned menu
    BuiltIn.Sleep  5s
    #Scroll Element Into View  ${Device_Comm_Logs_Menu}
    #BuiltIn.Sleep  3s
    Click DMS Element  ${RP_Mapping_Provisioned}
    #go to    ${RP_Mapping_Provisioned_URL}
    BuiltIn.Sleep  5s

Open RP Mapping DMS Overridden Page
    [Documentation]  click on rp dms overridden menu
    BuiltIn.Sleep  5s
    #Scroll Element Into View  ${Device_Comm_Logs_Menu}
    #BuiltIn.Sleep  3s
    Click DMS Element  ${RP_Mapping_DMS_Params}
    #go to    ${RP_Mapping_DMS_Params_URL}
    BuiltIn.Sleep  5s

Open RP Mapping WebGUI Overridden Page
    [Documentation]  click on rp webgui overridden menu
    BuiltIn.Sleep  5s
    #Scroll Element Into View  ${Device_Comm_Logs_Menu}
    #BuiltIn.Sleep  3s
    Click DMS Element  ${RP_Mapping_WebGUI_Params}
    #go to    ${RP_Mapping_WebGUI_Params_URL}
    BuiltIn.Sleep  5s
