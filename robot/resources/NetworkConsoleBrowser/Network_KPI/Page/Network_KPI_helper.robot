*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           Network_KPI_ui_controls.py

*** Variables ***


*** Keywords ***
Click On Network KPI Menu Item
    BuiltIn.Sleep  10s
    [Documentation]  click on Network KPI page
    Scroll Element Into View  ${Network_KPI_Menu}
    BuiltIn.Sleep  2s
    Click DMS Element  ${Network_KPI_Menu}
    BuiltIn.Sleep  15s

Click On Manage KPI Menu Item
    BuiltIn.Sleep  10s
    [Documentation]  click on manage kpi page
    Scroll Element Into View  ${Manage_KPI}
    BuiltIn.Sleep  2s
    Click DMS Element  ${Manage_KPI}
    BuiltIn.Sleep  15s

