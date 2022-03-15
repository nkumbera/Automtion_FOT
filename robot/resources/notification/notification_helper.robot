*** Settings ***
Library         String
Resource        ../common/ui_common.robot
Variables       notification_ui_controls.py

*** Variables ***



*** Keywords ***
Verify Notificaton Status
    [Documentation]  Verify Notification Status
    [Arguments]   ${type_operation}  ${status}
    Log   Arguments: ${type_operation} ${status}
    Wait Until Keyword Succeeds  ${BROWSER_ELEMENT_TIMEOUT}  5s  Check Notification For Success Message  ${type_operation}  ${status}

Check Notification For Success Message
    [Documentation]     Check notification for device operation's success message
    [Arguments]   ${type_operation}  ${status}
    Click DMS Element  ${ID_NOTIFICATION_HEADER}
    Wait Until Element Is Visible  ${ID_NOTIFICATION_POPUP_CONTAINER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${ID_NOTIFICATION_POPUP_CONTAINER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    ${type_to_verify}=  Format String  ${XPATH_NOTIFICATION_STATUS_VERIFICATION_DEVICE}  verify_string=${type_operation}
    ${count}=  Get Element Count   ${type_to_verify}
    Should Be True  ${count} > 0
    Log  Number of element ${count}
    ${type_to_verify}=  Format String  ${XPATH_NOTIFICATION_STATUS_VERIFICATION_DEVICE}  verify_string=${status}
    ${count}=  Get Element Count  ${type_to_verify}
    Log  Number of element ${count}
    #Click DMS Element  //html
    Should Be True  ${count} > 0
    BuiltIn.Sleep  2s
