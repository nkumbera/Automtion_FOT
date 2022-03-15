*** Settings ***
Library            SSHLibrary
#Suite Setup         Suite Setup Keyword
#Suite Teardown     DMS UI Logout
Resource            ../resources/common/ui_common.robot
Resource            ../resources/dashboard/dashboard_keywords.robot
Library             String
#Resource           ../resources/network_console_report/report_keywords.robot
Resource           ../resources/device_history/device_history_page_keywords.robot
Resource           ../resources/Import/Import_keywords.robot
Resource           ../resources/Venue/Venue_keywords.robot
Resource           ../resources/SO_Tool/SO_Tool_keywords.robot
Resource           ../resources/Search_Page/Search_Device.robot
Test Teardown       DMS Network Console UI Logout
Resource            ../resources/dashboard_6.0/dashboard_keywords.robot



*** Variables ***
${HOST}                ${SERVER_IP}
${USERNAME}            ${SERVER_USERNAME}
${PASSWORD}            ${SERVER_PASSWORD}


*** Test Cases ***
DMS files import from SO Tool Single-Click
    [Documentation]  Verify Sotool single-click will import all the required files to configured dms
    [Tags]    single_click    import    venue    regression    so-tool    regression_6.0
    Sotool Dashboard UI Login
    Perform Single Click operation to deploy DMS config
    Sotool DMS Network Console UI Login
    Verify Operation History for Netconf Mount file import  Netconf Mount     ReqID:
    Verify Operation History for Entity Mapping file import  Entity Mapping    ReqID:
    Verify Operation History for Service Setting import from SO_Tool  SERVICE_SETTINGS    ReqID:
    Verify Operation History for Service Setting import from SO_Tool  SERVICE_SETTINGS    ReqID:
    Verify Operation History for Service Setting import from SO_Tool  SERVICE_SETTINGS    ReqID:
    Verify Operation History for venue import  Venue     Venue