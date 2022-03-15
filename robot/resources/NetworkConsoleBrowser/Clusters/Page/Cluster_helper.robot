*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           Cluster_ui_controls.py

*** Variables ***


*** Keywords ***
Click On Clusters Menu Item
    BuiltIn.Sleep  10s
    [Documentation]  click on clusters page
    Scroll Element Into View  ${Clusters_Menu}
    BuiltIn.Sleep  2s
    Click DMS Element  ${Clusters_Menu}
    BuiltIn.Sleep  15s

Click On Cluster Management Menu Item
    BuiltIn.Sleep  10s
    [Documentation]  click on cluster management page
    Scroll Element Into View  ${Cluster_Management}
    BuiltIn.Sleep  2s
    Click DMS Element  ${Cluster_Management}
    BuiltIn.Sleep  15s