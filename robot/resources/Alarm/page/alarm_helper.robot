*** Settings ***
Library             String
Variables           robot\resources\dashboard\page\device_dashboard_ui_controls.py
Variables           alarm_ui_controls.py
*** Variables ***

*** Keywords ***
Dashboard Device Alarm page Status
    [Documentation]  Check the Device Alarm page
    Log  Check Device Alarm page content
    Click DMS Element   ${XPATH_ALARM_MENU}
    BuiltIn.Sleep  2s
    Wait Until Page Contains Element  ${ID_DASHBOARD_ALARM_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${ID_DASHBOARD_ALARM_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s