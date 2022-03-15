*** Settings ***
Resource  ../../common/ui_common.robot
Library  SeleniumLibrary
Variables   search_device_ui_controls.py
Variables   ../../dashboard/page/dms_ui_controls.py
*** Variables ***



*** Keywords ***
search using friendly name in homepage
    [Documentation]  search device using the friendly name
    Click DMS Element   ${XPATH_HOME_DEVICE_DROPDOWN}
    Click DMS Element   ${XPATH_HOME_DEVICE_CONTROLLER}
    Click DMS Element   ${XPATH_HOME_MAC_DETAILS_DROPDOWN}
    Click DMS Element   ${XPATH_HOME_FRIENDLYNAME}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_HOME_SEARCHBOX}   ${friendly_name}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_HOME_SEARCHBTN}
    Wait Until Page Contains Element  ${ID_DASHBOARD_HEADER_STRING}  timeout=${BROWSER_ELEMENT_TIMEOUT}

search using cell identity in homepage
    [Documentation]     search device using the cell Identity value
    Click DMS Element   ${XPATH_HOME_DEVICE_DROPDOWN}
    Click DMS Element   ${XPATH_HOME_DEVICE_CONTROLLER}
    Click DMS Element   ${XPATH_HOME_MAC_DETAILS_DROPDOWN}
    Click DMS Element   ${XPATH_HOME_CELLIDENTITY}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_HOME_SEARCHBOX}   ${cellId}
    Click DMS Element   ${XPATH_HOME_SEARCHBTN}
    Click DMS Element   ${XPATH_HOME_SEARCHBTN}
    Wait Until Page Contains Element  ${ID_DASHBOARD_HEADER_STRING}  timeout=${BROWSER_ELEMENT_TIMEOUT}

search using NGRP ID and validate summary with image
    [Documentation]     search device using the NGRP and validate the image and summary
    Click DMS Element   ${XPATH_HOME_DEVICE_DROPDOWN}
    Click DMS Element   ${XPATH_HOME_DEVICE_NGRADIO}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_HOME_SEARCHBOX}   ${ngrp_macId}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_HOME_SEARCHBTN}
    Wait Until Page Contains Element  ${ID_DASHBOARD_RP_SUMMARY}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${XPATH_DASHBOARD_RP_IMAGE}   timeout=${BROWSER_ELEMENT_TIMEOUT}

search using NGRP device in homepage
    [Documentation]     search device using the NGRP
    Click DMS Element   ${XPATH_HOME_DEVICE_DROPDOWN}
    Click DMS Element   ${XPATH_HOME_DEVICE_NGRADIO}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_HOME_SEARCHBOX}   ${ngrp_macId}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_HOME_SEARCHBTN}
    Wait Until Page Contains Element  ${ID_DASHBOARD_RPDASHBOARD_BUTTON}  timeout=${BROWSER_ELEMENT_TIMEOUT}

search using cu_up name in homepage
    [Documentation]  search device using the cu_up name
    [Arguments]  ${device_id}
    Click DMS Element   ${XPATH_HOME_DEVICE_DROPDOWN}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_HOME_DEVICE_CU_UP}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_HOME_SEARCHBOX}   ${device_id}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_HOME_SEARCHBTN}
    Wait Until Page Contains Element  ${ID_DASHBOARD_HEADER_STRING}  timeout=${BROWSER_ELEMENT_TIMEOUT}

search using cu_cp name in homepage
    [Documentation]  search device using the cu_cp name
    [Arguments]  ${device_id}
    Click DMS Element   ${XPATH_HOME_DEVICE_DROPDOWN}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_HOME_DEVICE_CU_CP}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_HOME_SEARCHBOX}   ${device_id}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_HOME_SEARCHBTN}
    Wait Until Page Contains Element  ${ID_DASHBOARD_HEADER_STRING}  timeout=${BROWSER_ELEMENT_TIMEOUT}

search using du name in homepage
    [Documentation]  search device using the cu_cp name
    [Arguments]  ${device_id}
    Click DMS Element   ${XPATH_HOME_DEVICE_DROPDOWN}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_HOME_DEVICE_DU}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_HOME_SEARCHBOX}   ${device_id}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_HOME_SEARCHBTN}
    Wait Until Page Contains Element  ${ID_DASHBOARD_HEADER_STRING}  timeout=${BROWSER_ELEMENT_TIMEOUT}

search using RP5100 device in homepage
    [Documentation]     search device using the NGRP
    Click DMS Element   ${XPATH_HOME_DEVICE_DROPDOWN}
    Click DMS Element   ${XPATH_HOME_DEVICE_RP5100}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_HOME_SEARCHBOX}   ${rp5100_macId}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_HOME_SEARCHBTN}
    Wait Until Page Contains Element  ${ID_DASHBOARD_RPDASHBOARD_BUTTON}  timeout=${BROWSER_ELEMENT_TIMEOUT}


Search gNB dashboard using gNBid
    [Arguments]  ${gNBid}
    [Documentation]  search gNB using gNBid
    Click DMS Element   ${XPATH_HOME_DEVICE_DROPDOWN}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_HOME_DEVICE_CU_CP}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_gNBID_DROPDOWN}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_gNBid}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_HOME_SEARCHBOX}   ${gNBid}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_HOME_SEARCHBTN}
    Wait Until Page Contains Element  ${ID_gNB_DASHBOARD_STRING}  timeout=${BROWSER_ELEMENT_TIMEOUT}


Search gNB dashboard using gNBName
    [Documentation]  search gNB using gNBName
    Click DMS Element   ${XPATH_HOME_DEVICE_DROPDOWN}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_HOME_DEVICE_CU_CP}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_gNBID_DROPDOWN}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_gNBName}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_HOME_SEARCHBOX}   ${gNBName}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_HOME_SEARCHBTN}
    Wait Until Page Contains Element  ${ID_gNB_DASHBOARD_STRING}  timeout=${BROWSER_ELEMENT_TIMEOUT}

Search gNB dashboard using gNBName with multiple cucp
    [Documentation]  search gNB using gNBName with multiple cucp
    Click DMS Element   ${XPATH_HOME_DEVICE_DROPDOWN}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_HOME_DEVICE_CU_CP}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_gNBID_DROPDOWN}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_gNBName}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_HOME_SEARCHBOX}   ${gNBName2}
    BuiltIn.Sleep  3s
    Click DMS Element   ${XPATH_HOME_SEARCHBTN}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_SELECT_gNBName2}
    #Select Frame  id=${XPATH_SELECT_gNBName}
    #Press Keys    ${XPATH_SELECT_gNBName2}    ENTER
    BuiltIn.Sleep  3s
    #Press Keys    ${XPATH_SELECT_gNBName}  CTRL+a+BACKSPACE
    BuiltIn.Sleep  5s
    Wait Until Page Contains Element  ${ID_gNB_DASHBOARD_STRING}

Verification of gNB dashboard
    [Documentation]  verify gNB dashboard
    BuiltIn.Sleep  2s
    #Click DMS Element   ${XPATH_GNBID_HYPERLINK}
    #BuiltIn.Sleep  5s
    Wait Until Page Contains Element  ${ID_gNB_DASHBOARD_STRING}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_COPY_GNBID}
    #Wait Until Element Is Visible  ${XPATH_COPIED_MSG}
    #${value}        Get Text     ${XPATH_COPIED_MSG}
    #Log             ${value}
    #Should Contain    ${value}     Copied Successfully
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_RP_HYPERLINK}
    BuiltIn.Sleep  2s
    Wait Until Page Contains Element  ${ID_RP_DASHBOARD_STRING}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_BREADCRUMB_GNBID}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_EXPAND}
    BuiltIn.Sleep  6s
    Wait Until Page Contains Element  ${ID_X2_STRING}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CP_VNF}
    BuiltIn.Sleep  6s
    Wait Until Page Contains Element  ${XPATH_BC_DASHBOARD}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_GNBID_HYPERLINK}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_EXPAND}
    BuiltIn.Sleep  6s
    #Wait Until Page Contains Element  ${XPATH_E1_STRING}
    #BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_UP_VNF}
    BuiltIn.Sleep  6s
    Wait Until Page Contains Element  ${XPATH_BC_DASHBOARD}
    BuiltIn.Sleep  4s
    Click DMS Element   ${XPATH_GNBID_UP_HYPERLINK}
    BuiltIn.Sleep  7s
    Click DMS Element  ${XPATH_EXPAND_E1}
    BuiltIn.Sleep  8s
    #Wait Until Page Contains Element  ${XPATH_E1_STRING}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_DU_VNF}
    BuiltIn.Sleep  6s
    Wait Until Page Contains Element  ${XPATH_BC_DASHBOARD}
    BuiltIn.Sleep  6s
    Click DMS Element   ${XPATH_GNBID_HYPERLINK}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_EXPAND_CELL}
    BuiltIn.Sleep  6s

gNB dashboard navigation
    #[Arguments]    ${XPATH_GNBID_HYPERLINK}
    [Documentation]  verify gNB dashboard navigation from CP DU
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_COPY_GNBID}
    Wait Until Element Is Visible  ${XPATH_COPIED_MSG}
    ${value}        Get Text     ${XPATH_COPIED_MSG}
    Log             ${value}
    Should Contain    ${value}     Copied Successfully
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_GNBID_HYPERLINK}
    BuiltIn.Sleep  5s
    Wait Until Page Contains Element  ${ID_gNB_DASHBOARD_STRING}

gNB dashboard navigation from UP
    [Documentation]  verify gNB dashboard navigation from UP
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_COPY_GNBID}
    Wait Until Element Is Visible  ${XPATH_COPIED_MSG}
    ${value}        Get Text     ${XPATH_COPIED_MSG}
    Log             ${value}
    Should Contain    ${value}     Copied Successfully
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_GNBID_UP_HYPERLINK}
    BuiltIn.Sleep  5s
    Wait Until Page Contains Element  ${ID_gNB_DASHBOARD_STRING}


gNB dashboard service status when DU cell up
    [Documentation]  verify gNB dashboard service status
    BuiltIn.Sleep  6s
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    search using du name    ${DEVICE_MACID}
    BuiltIn.Sleep  2s
    Wait Until Element Is Visible  ${XPATH_CELL_STATE}
    ${value}        Get Text     ${XPATH_CELL_STATE}
    Log             ${value}
    Should Contain any    ${value}     ACTIVE   NA
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_GNBID_HYPERLINK}
    BuiltIn.Sleep  5s
    Wait Until Page Contains Element  ${ID_gNB_DASHBOARD_STRING}
    BuiltIn.Sleep  2s
    Wait Until Element Is Visible  ${XPATH_gNB_SUMMARY}
    ${value1}        Get Text     ${XPATH_gNB_SUMMARY}
    Log             ${value1}
    Should Contain any   ${value1}     In Service   Unknown


search using RP5200 device in homepage
    [Documentation]     search device using the NGRP
    Click DMS Element   ${XPATH_HOME_DEVICE_DROPDOWN}
    Click DMS Element   ${XPATH_HOME_DEVICE_RP5200}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_HOME_SEARCHBOX}   ${rp5200_macId}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_HOME_SEARCHBTN}
    Wait Until Page Contains Element  ${ID_DASHBOARD_RPDASHBOARD_BUTTON}  timeout=${BROWSER_ELEMENT_TIMEOUT}

