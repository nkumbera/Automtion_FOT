*** Settings ***
Library             pyautogui
Resource            ../common/ui_common.robot
Resource            page/alarm_helper.robot
Resource            ../dashboard/page/dashboard_page_helper.robot

*** Variables ***

*** Keywords ***
Verify Alarm page Navigation
    Dashboard Device Alarm page Status