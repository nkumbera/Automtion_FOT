*** Settings ***
Resource  ../../common/ui_common.robot
Library  SeleniumLibrary
Variables   provisioning_ui_controls.py
Library             String
Variables           robot\resources\dashboard\page\device_dashboard_ui_controls.py
Variables           provisioning_ui_controls.py

*** Variables ***
${HOST}                ${SERVER_IP}
${USERNAME}            ${SERVER_USERNAME}
${PASSWORD}            ${SERVER_PASSWORD}


*** Keywords ***
Open Provisioning Status
    [Documentation]  Open Provisioning Status Window
    ${provisioning_status}=   Format String   ${DEVICE_PROVISIONING_STATUS}   dms_device_console=${DMS_UI_URL}    device_macid=${DEVICE_MACID}
    Go To  ${provisioning_status}
    Wait Until Page Contains Element  ${ID_PROVISIONING_STATUS_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${ID_PROVISIONING_STATUS_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}

Verify Name AND Value
    [Arguments]  ${name}   ${value}
    ${verify_text} =  Format String  ${XPATH_PROVISION_TEXT_VERIFY_TEMPLATE}  ${name}
    Wait Until Page Contains Element  ${verify_text}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    ${count}=  Get Element Count   ${verify_text}
    Should Be True  ${count} > 0
    ${verify_text} =  Format String  ${XPATH_PROVISION_TEXT_VERIFY_TEMPLATE}  ${value}
    Wait Until Page Contains Element  ${verify_text}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    ${count}=  Get Element Count   ${verify_text}
    Should Be True  ${count} > 0

Verify Generation Of Delta
    [Documentation]  Verify if delta has been generated
    ${delta_count}=  Get DMS Element Text  ${XPATH_PROVISIONING_DELTA_LINK}
    Should Be True  ${delta_count} > 0


Dashboard Device Provisioning page Summary Status
    [Documentation]  Check the Device Provisioning page Summary
    Log  Check Dashboard Device Provisioning page Summary content
    Click DMS Element   ${XPATH_PROVISIONED_MENU}
    BuiltIn.Sleep  5s
    Wait Until Page Contains Element  ${ID_DASHBOARD_PROVISIONED_DATA_SUMMARY}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${ID_DASHBOARD_PROVISIONED_DATA_SUMMARY}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s
    Wait Until Page Contains Element  ${XPATH_PROVISIONED_DATA_GNBCONFIG}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${XPATH_PROVISIONED_DATA_GNBCONFIG}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_PROVISIONED_MENU}
    BuiltIn.Sleep  5s
    Click DMS Element   ${XPATH_PROVISIONING_STATUS}
    BuiltIn.Sleep  2s
    Wait Until Page Contains Element  ${ID_DASHBOARD_PROVISIONING_STATUS_SUMMARY}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${ID_DASHBOARD_PROVISIONING_STATUS_SUMMARY}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s

    Wait Until Page Contains Element  ${XPATH_PROVISIONING_STATUS_TABLE}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${XPATH_PROVISIONING_STATUS_TABLE}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s

Click Provisioning PnP page box
    [Documentation]  Click for PnP box
    Log  Check Click for PnP box
    [ARGUMENTS]  ${XPATH_PNP_BOX_CLICK}
    BuiltIn.Sleep  2s
    Scroll Element Into View  ${XPATH_PNP_BOX_CLICK}
    BuiltIn.Sleep  2s
    click dms element   ${XPATH_PNP_BOX_CLICK}

Verify Provisioning PnP page box status
    [Documentation]  Verification Status for PnP box
    Log  Verify status for PnP box
    [ARGUMENTS]    ${XPATH_PNP_BOX_STATUS}
    BuiltIn.Sleep  2s
    Scroll Element Into View  ${XPATH_PNP_BOX_STATUS}
    BuiltIn.Sleep  2s
    ${Operation_status}  Get DMS Element Text    ${XPATH_PNP_BOX_STATUS}
    Log     ${Operation_status}
    Should Contain    ${Operation_status}      Success

Verify Min Mandatory Provisioning PnP page box status
    Log  Verify status for PnP box
    [ARGUMENTS]    ${XPATH_PNP_BOX_STATUS}
    BuiltIn.Sleep  2s
    Scroll Element Into View  ${XPATH_MIn_BOX_Status}
    BuiltIn.Sleep  2s
    ${Operation_status}  Get DMS Element Text    ${XPATH_MIn_BOX_Status}
    Log     ${Operation_status}
    Should Contain    ${Operation_status}      ${XPATH_PNP_BOX_STATUS}


Open gNB Provisioning Status
    [Documentation]  Open Provisioning Status Window
    [arguments]     ${DEVICE_gNB_PROVISIONING_STATUS}
    ${provisioning_status}=   Format String   ${DEVICE_gNB_PROVISIONING_STATUS}   dms_device_console=${DMS_UI_URL}    device_macid=${DEVICE_MACID}
    Go To  ${provisioning_status}
    Wait Until Page Contains Element  ${ID_PROVISIONING_STATUS_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${ID_PROVISIONING_STATUS_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}

Open gNB Provisioning Data
    [Documentation]  Open Provisioning Status Window
    [arguments]     ${DEVICE_gNB_PROVISIONING_DATA}
    ${provisioning_data}=   Format String   ${DEVICE_gNB_PROVISIONING_DATA}   dms_device_console=${DMS_UI_URL}    device_macid=${DEVICE_MACID}
    Go To  ${provisioning_data}
    Wait Until Page Contains Element  ${ID_DASHBOARD_PROVISIONED_DATA_SUMMARY}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${ID_DASHBOARD_PROVISIONED_DATA_SUMMARY}  timeout=${BROWSER_ELEMENT_TIMEOUT}

verify delta provisioning text
    Scroll Element Into View  ${XPATH_PNP_TEXT}
    ${pnp_text_value}    get Text     ${XPATH_PNP_TEXT}
    Log     ${pnp_text_value}

Verify provisioned value
    ${Table_value}    GET Text   ${XAPTH_VES_PROVISIONED_DATA}
    Log     ${Table_value}
    should contain    ${Table_value}    ${VES_URL_pro}
    should contain    ${Table_value}    ${VES_Username_pro}
    should contain    ${Table_value}    ${VES_Password_pro}
    should contain    ${Table_value}    DMS GUI

Verify provisioned WhiteList value
    ${whiteList_Table_value}    GET Text   ${XPATH_WHITELIST_TABLE}
    Log     ${whiteList_Table_value}
    should contain    ${whiteList_Table_value}    ${WhiteList_Cell1}
    should contain    ${whiteList_Table_value}    ${WhiteList_Cell2}
    should contain    ${whiteList_Table_value}    ${WhiteList_Cell3}
    should contain    ${whiteList_Table_value}    DMS GUI Override Profile

Delete the configured whitelist
     BuiltIn.Sleep  5s
     Run Keyword And Ignore Error    Click DMS Element     ${XPATH_WHITELIST_DELETE_BUTTON}
     BuiltIn.Sleep  5s

Verify no Delta Generation
    [Documentation]  Verify no delta has been generated
    #${delta_count}=  Get DMS Element Text  ${XPATH_PROVISIONING_DELTA_LINK}
    ${no_delta_value}     get text      ${XPATH_DELTA_PROVISION_STATUS}
    should contain     ${no_delta_value}       No Data found

Verify PnP statue page for successful computation
    Click DMS Element   ${XPATH_PNP_MIN_MANDATORY_BOX}
    BuiltIn.Sleep  4s
    Wait Until Element Is Visible  ${XPATH_STATUS_PNP}
    ${value}        Get Text     ${XPATH_STATUS_PNP}
    Log             ${value}
    Should Contain    ${value}    Success