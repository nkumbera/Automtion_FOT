*** Settings ***
Resource            page/dc_device_search_helper.robot
Library  String

*** Variables ***


*** Keywords ***

Device Console Device Search
    [Documentation]    Device Console Device Search
    Open Device Search from Device Console
    Input Devce Macid in TextBox
    Click on Search Button to open Device Console
