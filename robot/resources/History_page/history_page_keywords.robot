*** Settings ***
Library             pyautogui
Resource            ../common/ui_common.robot
Resource            page/history_page_helper.robot
Resource            ../dashboard/page/dashboard_page_helper.robot
Library             SeleniumLibrary
#Library             Selenium2Library
Library             Collections



*** Variables ***



*** Keywords ***
Verify History page Navigation
    Dashboard Device History Status

Open Device History Page
    [Documentation]  Open Device History Page
    ${device_history_url}=  Format String   ${DEVICE_HISTORY_PAGE}   dms_device_console=${DMS_UI_URL}    device_macid=${DEVICE_MACID}
    Go To  ${device_history_url}
    Wait Until Element Is Visible  ${ID_DEVICE_HISTORY_PAGE_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${ID_DEVICE_HISTORY_PAGE_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s
    Log  Device History Page Opened

Select Tabular Tab1
    [Documentation]  Select Tabular Tab in filter frame of Device History page
    [Arguments]  ${tab_type}
    ${tab_type_output}=  Format String   ${XPATH_DEVICEHISTORY_TBAULAR_TAB}   tab_type=${tab_type}
    Click DMS Element  ${tab_type_output}
    Log  ${tab_type} Tab is selected

Select Time Option1
    [Documentation]  Select time option from the given list in filter frame
    [Arguments]   ${time_option}
    Click DMS Element  ${XPATH_DEVICEHISTORY_TIMEOPTION_LIST_DISPLAYER}
    BuiltIn.Sleep  5s
    ${time_option_output}=  Format String   ${XPATH_DEVICEHISTORY_TIMEOPTION_LISTITEM}   time_option=${time_option}
    Click DMS Element  ${time_option_output}
    Log  ${time_option} option is selected

Select Event Category and Click on Show Button1
    [Documentation]  Select event category from the given list and click on show button in filter frame
    [Arguments]   ${event_type}
    BuiltIn.Sleep  5s
    ${event_type_output}=  Format String   ${XPATH_DEVICEHISTORY_TIMEOPTION_CHECKBOX}   event_type=${event_type}
    BuiltIn.Sleep  5s
    Click DMS Element  ${event_type_output}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_DEVICEHISTORY_SHOW_BUTTON}
    Log  ${event_type} event type is selected and respected result is shown

Click on Export Button
    [Documentation]  Click on Export button to extract device history of certain time period
    Wait Until Loading Icon Disappears
    BuiltIn.Sleep  5s
    Scroll Element Into View     ${ID_DEVICEHISTORY_EXPORT_BUTTON}
    BuiltIn.Sleep  5s
    Scroll Element Into View     ${ID_DEVICE_HISTORY_PAGE_HEADER}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_DEVICEHISTORY_EXPORT_BUTTON}
    Log  Device history file is extracted


Export Device History
    [Documentation]  Export device operation history
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open Device History Page
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Click on Export Button

Provisioning Verification on Device History
    [Documentation]  Provisioning Verification in  history
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open Device History Page
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}

Netconf Provisioning on Device History
    [Documentation]  Provisioning Verification in  history
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open Device History Page
    Open Device History Page
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Select view of Maxmium Items Per Page
    Check for Netconf Provisioning Item

	

