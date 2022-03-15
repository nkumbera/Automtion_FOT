*** Settings ***
Resource            page/device_history_helper.robot

*** Variables ***


*** Keywords ***
Export Device History
    [Documentation]  Export device operation history
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open Device History Page
    Open Device History Page
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Click on Export Button

Validate response in Device History
    [Documentation]  Validate policy response in Device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}   ${Policy_name}
    Open Device History Page
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Validate the response in event    ${Policy_name}

Validate RP Reboot response in Device History
    [Documentation]  Validate policy response in Device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page    ${DEVICE_HISTORY_PARAMETER_DU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Validate the RP Reboot notification response

Notification Verification on Device History
    [Documentation]  Validate policy response in Device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page    ${DEVICE_HISTORY_PARAMETER_DU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Validate the notification response


Verify certificate downloaded success message in History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page    ${DEVICE_HISTORY_PARAMETER_DU_RealDevice}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    validate the provisioning value for Certificate

Verify Resync in History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page    ${DEVICE_HISTORY_PARAMETER_DU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    validate History Resync All message

Verify whitelist Delete
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page    ${DEVICE_HISTORY_PARAMETER_DU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    validate delete whitelist

Validate Policy response in Device History
    [Documentation]  Validate policy response in Device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}   ${Policy_name}    ${history_url}
    Open gNB Device History Page    ${history_url}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Validate the response in event    ${Policy_name}

Verify RP5200 RP Reboot in History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page    ${DEVICE_HISTORY_PARAMETER_DU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    validate History RP5200 RP Reboot

Verify RP5200 RP Reset in History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page    ${DEVICE_HISTORY_PARAMETER_DU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    validate History RP5200 RP Reset


RP5200 Notifications Verification in device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page    ${DEVICE_HISTORY_PARAMETER_DU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    validate History RP5200 Notifications

Verify Device History for Reboot
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}   ${history_url}
    Open gNB Device History Page    ${history_url}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Validate Reboot Messages

Verify Device History for Delta
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}   ${history_url}
    Open gNB Device History Page    ${history_url}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Validate Delta Messages

Verify Device History for nonexist of Delta entry
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}   ${history_url}
    Open gNB Device History Page    ${history_url}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Validate Delta Messages nonexitence

Verify Device History for Value Change
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open Device History Page
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Verify Software Upgarde Value Change