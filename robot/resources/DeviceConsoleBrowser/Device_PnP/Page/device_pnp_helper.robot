*** Settings ***
Resource            ../../common/ui_common.robot
Resource            ../../dashboard/dashboard_keywords.robot
#Resource            robot/resources/DeviceConsoleBrowser/Dashboard/Page/device_dashboard_helper.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           device_pnp_ui_controls.py

*** Variables ***
${value_to_set}

*** Keywords ***

Open DC Device PnP Page
    [Documentation]  click on PnP menu
    BuiltIn.Sleep  5s
    Click DMS Element  ${PnP_Menu}
    BuiltIn.Sleep  5s
