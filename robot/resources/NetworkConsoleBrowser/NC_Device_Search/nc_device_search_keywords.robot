*** Settings ***
Resource            page/nc_device_search_helper.robot
Library  String

*** Variables ***


*** Keywords ***
Network Console Device Search
    [Documentation]    Network Console Device Search
    Open Device Search from Network Console
    Input Devce Macid in TextBox on NC
    Click on Search Button to open Device Console from NC
