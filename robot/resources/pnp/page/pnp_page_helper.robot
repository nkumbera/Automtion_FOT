*** Settings ***
Variables           pnp_ui_controls.py
Resource            ../common/ui_common.robot

*** Variables ***



*** Keywords ***
Open Device PNP Page
    [Documentation]  Open Pnp Page
    ${open_page}=  Format String   ${DEVICE_PNP_PAGE}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID}
    Go To   ${open_page}
    Wait Until Element Is Not Visible  ${XPATH_PNP_HEADER_CONTAINS}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    wait until element is visible  ${ID_PNP_PAGE_STATUS_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s

Open gNB Device PNP Page
    [Documentation]  Open Pnp Page
    ${open_page}=  Format String   ${DEVICE_PNP_PAGE_gNB}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID}
    Go To   ${open_page}
    Wait Until Element Is Not Visible  ${ID_DASHBOARD_PNPSTATUS_HEADER_gNB}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    wait until element is visible  ${ID_DASHBOARD_PNPSTATUS_HEADER_gNB}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s

Open VNF Device PnP Page
    [Documentation]  Open Pnp Page
    [arguments]    ${VNF_PNP_PAGE}
    ${open_page}=  Format String   ${DEVICE_PNP_PAGE_gNB}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID}
    Go To   ${open_page}
    Wait Until Element Is Not Visible  ${ID_DASHBOARD_PNPSTATUS_HEADER_gNB}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    wait until element is visible  ${ID_DASHBOARD_PNPSTATUS_HEADER_gNB}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s


PNP WorkFlow Success Status
    [Documentation]  Check the PNP Workflow Status
    Log  Check Device Workflow Success Status
    Page Should Not Contain Element  ${XPATH_WORKFLOW_STEP_FAILED}


Wait For Workflow To Finish
    [Documentation]  Wait for workflow finish
    BuiltIn.Sleep  5s
    Click DMS Button  ${XPATH_DASHBOARD_REFRESH_PLAY_PAUSE_BUTTON}
    BuiltIn.Sleep  160s
    Wait Until Page Contains Element  ${XPATH_PNP_WORKFLOW_FINISHED_ON_TEXT}   timeout=${REBOOT_WORKFLOW_TIMEOUT}
    Wait Until Element Is Visible  ${XPATH_PNP_WORKFLOW_FINISHED_ON_TEXT}   timeout=${REBOOT_WORKFLOW_TIMEOUT}
    Click DMS Button  ${XPATH_DASHBOARD_REFRESH_PLAY_PAUSE_BUTTON}
    Wait Until Element Is Not Visible  ${XPATH_PNP_LAST_REFRESHED}  timeout=${BROWSER_ELEMENT_TIMEOUT}


Device PnP Status Summary
    [Documentation]  Check the Device PnP Summary
    Log  Check Dashboard Device PnP Summary content
    Click DMS Element   ${XPATH_PNP_STATUS_MENU}
    BuiltIn.Sleep  2s
    Wait Until Page Contains Element  ${ID_DASHBOARD_PNPSTATUS_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${ID_DASHBOARD_PNPSTATUS_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s

    Wait Until Page Contains Element  ${XPATH_DASHBOARD_PNPWORKFLOW_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${XPATH_DASHBOARD_PNPWORKFLOW_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s


Open gNB Device PNP Page for delta provisioning
    [Documentation]  Open Pnp Page for delta
    [arguments]     ${DEVICE_PNP_PAGE_gNB}
    ${open_page}=  Format String   ${DEVICE_PNP_PAGE_gNB}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE_MACID}
    Go To   ${open_page}
    Wait Until Element Is Not Visible  ${ID_DASHBOARD_PNPSTATUS_HEADER_gNB}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    wait until element is visible  ${ID_DASHBOARD_PNPSTATUS_HEADER_gNB}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s