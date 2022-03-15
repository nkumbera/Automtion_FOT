*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../dashboard/dashboard_keywords.robot
#Resource            robot/resources/DeviceConsoleBrowser/Dashboard/Page/device_dashboard_helper.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           dc_device_search_ui_controls.py

*** Variables ***
${value_to_set}

*** Keywords ***

Open Device Search from Device Console
    [Documentation]  click on device search icon
    BuiltIn.Sleep  5s
    Click DMS Element  ${Device_Search_Menu}
    BuiltIn.Sleep  5s

Input Devce Macid in TextBox
    [Documentation]  enter input text
    BuiltIn.Sleep  5s
    Input Text    ${Enter_Macid_Text}  ${DEVICE_ALARM_Delete_MACID}
    BuiltIn.Sleep  5s

Click on Search Button to open Device Console
    [Documentation]  click on search
    BuiltIn.Sleep  5s
    Click DMS Element  ${Click_Search_Button}
    BuiltIn.Sleep  5s

