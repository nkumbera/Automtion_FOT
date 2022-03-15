*** Settings ***
Library             pyautogui
Resource            ../common/ui_common.robot
Resource            page/communication_logs_helper.robot
Resource            ../dashboard/page/dashboard_page_helper.robot

*** Variables ***

*** Keywords ***
Verify Communication logs page Navigation
    Device Communication logs Summary Status

Enable Communication logs
    Verify Communication logs is Enabled

Verify download url from Communication logs
    [Arguments]     ${excepted_url}
    Verify Communication logs url content   ${excepted_url}