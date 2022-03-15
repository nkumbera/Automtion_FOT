*** Settings ***
Resource            page/device_pnp_helper.robot
Library  String

*** Variables ***


*** Keywords ***

Device Console PnP Status
    [Documentation]    Device PnP page
    Open DC Device PnP Page