*** Settings ***
Resource            page/provisioning_helper.robot
Library  String

*** Variables ***


*** Keywords ***

Device Console Provisioning Page
    [Documentation]    Device provisioning page
    Open Provisioning Page
    Open Provisioned Data Page
    Open Provisioning Status Page