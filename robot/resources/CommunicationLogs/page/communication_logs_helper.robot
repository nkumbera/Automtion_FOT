*** Settings ***
Library             String
Variables           robot\resources\dashboard\page\device_dashboard_ui_controls.py
Variables           communication_logs_ui_controls.py
Resource            robot/resources/common/ui_common.robot
*** Variables ***

*** Keywords ***
Device Communication logs Summary Status
    [Documentation]  Check the Device Communication logs Summary
    Log  Check Device Communication logs page content
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_COMMUNICATION_LOGS_MENU}
    BuiltIn.Sleep  2s
    Wait Until Page Contains Element  ${ID_DASHBOARD_COMMUNICATION_LOGS_SUMMARY}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${ID_DASHBOARD_COMMUNICATION_LOGS_SUMMARY}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s

    Wait Until Page Contains Element  ${XPATH_COMMUNICATION_LOGS_COLLECTION_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${XPATH_COMMUNICATION_LOGS_COLLECTION_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s

Verify Communication logs is Enabled
    [Documentation]  Check the Device Communication logs is ON
    Log     Check the Device Communication logs is ON
    Click DMS Element   ${XPATH_COMMUNICATION_LOGS_FILTER_MESSAGETYPE}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_COMMUNICATION_LOGS_ENABLE}
    BuiltIn.Sleep  2s
    ${item_present}=  Run Keyword And Return Status  Element Should Be Visible  ${XPATH_COMMUNICATION_LOGS_SUCCESSFULL_LOG_ENABLE}
    BuiltIn.Sleep  3s
    IF  ${item_present}==True
    BuiltIn.Sleep  1s
    ELSE
    Click DMS Element  ${XPATH_COMMUNICATION_LOGS_ENABLE}
    BuiltIn.Sleep  2s
    Wait Until Element Is Visible  ${XPATH_COMMUNICATION_LOGS_SUCCESSFULL_LOG_ENABLE}
    END

Verify Communication logs url content
    [Documentation]  Verify Communication logs download url content
    [Arguments]     ${excepted_url}
    Click DMS Element   ${XPATH_COMMUNICATION_LOGS_FILTER_MESSAGETYPE}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_COMMUNICATION_LOGS_FILTER_MESSAGETYPE}   download
    BuiltIn.Sleep  2s
    Click DMS Element  ${ID_COMMUNICATION_LOGS_APPLY_FILTER}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_DOWNLOAD_RESPONSE}
    BuiltIn.Sleep  2s
    ${Response}=  Get Element Attribute  ${XPATH_VIEW_RESPONSE}    attribute=value
    Should Contain    ${Response}    ${excepted_url}

Navigate to Communication logs
    [Documentation]  Check the Device Communication logs Summary
    Log  Check Device Communication logs page content
    BuiltIn.Sleep  2s
    Scroll Element Into View     ${XPATH_COMMUNICATION_LOGS_MENU}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_COMMUNICATION_LOGS_MENU}
    BuiltIn.Sleep  10s
