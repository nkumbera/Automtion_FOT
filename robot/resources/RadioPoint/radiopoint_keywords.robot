*** Settings ***
Resource            ../common/ui_common.robot
Resource            page/radiopoint_helper.robot
Resource            ../device_history/device_history_page_keywords.robot
Resource            ../DeviceConsoleBrowser/DC_Notification/Page/dc_notification_helper.robot
Resource            ../notification/notification_helper.robot

*** Variables ***



*** Keywords ***
Open RP Params page and perform Reboot
    [Documentation]  Open the DU RP device and perform Reboot operation in RP dashboard
    Open RP Params Page
    Perform reboot operation
   Validate RP Reboot response in Device History    Tabular     1 hour       UIOPERATION

Pre-requisite to Set the RP value for certificate download
     open DMS RP Overridden Param
     Select RP from BC
     Change M-plane value    ${CERTIFICATE_OPTION_FALSE}
     save changes

Set the RP value for certificate download
     open DMS RP Overridden Param
     Select RP from BC
     Change M-plane value    ${CERTIFICATE_OPTION_TRUE}
     save changes

Download RP certificate
    Open RP Params Page for Real device
    Resync RP Page
    BuiltIn.Sleep  600s

Verify certificate downloaded
    Open RP Params Page for Real device
    Select Show More Columns
    Select RP from BC
    Verify certificate downloaded success message
    Verify certificate downloaded success message in History    Tabular  Last 1 hour  PROVISIONING

Login to NGRP Platform Console Dashboard
     Open RP Params Page for Real device
     Select RP from BC
     Enter RP Dashboard

Reset RP Platform View
    Select RP Reset
    BuiltIn.Sleep  120s

Reboot RP Platform View
    Select RP Reboot
    BuiltIn.Sleep  80s

Resync RP Platform View
    Select RP Resync
    BuiltIn.Sleep  80s

Resync All RP Platform View
    Select RP Resync All
    BuiltIn.Sleep  80s


Validate Resync
    Resync RP Platform View
    Resync All RP Platform View


Validate Reboot/Reset
    Reboot RP Platform View
    Reset RP Platform View


Operational Param Verification
    Open RP Params Page
    Get Table Content

RU Add Notification Verification in device History
    #Open RP Params Page
    Notification Verification on Device History   Tabular  Last 1 hour  NOTIFICATION

RP Dashboard Verification
   open RP Dashboard Page
   Verify RP Dashboard Table Content

DU Device History for RP5200 reboot
    [Documentation]  Validate RP5200 reboot response in Device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page    ${DEVICE_HISTORY_PARAMETER_DU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    BuiltIn.Sleep  2s

Open RP Params page and perform RP5200 Reboot
    [Documentation]  Open the DU RP device and perform Reboot operation in RP dashboard
    Open RP Params Page
    Perform reboot operation

Open RP Params page and perform Reset
    [Documentation]  Open the DU RP device and perform Reset operation
    Open RP Params Page
    Perform reset operation


DU Device History for RP5200 reset
    [Documentation]  Validate RP5200 reset response in Device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page    ${DEVICE_HISTORY_PARAMETER_DU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    BuiltIn.Sleep  2s

Perform ResyncAll on DU connected with RP5200
    [Documentation]  Open the DU evice and perform ResyncAll operation
    #Open RP Params Page
    Perform resyncall operation
    BuiltIn.Sleep  5s
    #Open RP Params Page

DU Device History for RP5200 resyncall
    [Documentation]  Validate RP5200 resyncall response in Device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page    ${DEVICE_HISTORY_PARAMETER_DU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    BuiltIn.Sleep  2s

RP5200 Dashboard Verification
   open RP Dashboard Page
   Verify RP5200 Dashboard Table Content

RP5200 Operational RP Params Verification
    Open RP Params Page
    Get RP5200 Operational RP Params Table Content

Verify RP5200 Reboot Notification
    Verify RP Reboot_Reset Notification    RP Reboot    success

Verify RP5200 Reset Notification
    Verify RP Reboot_Reset Notification    RP Reset    success

Verify RP5100 Reboot Notification
     Verify RP 5100 Reboot_Reset Notification   RP Reboot    success

Verify RP5100 Reset Notification
     Verify RP 5100 Reboot_Reset Notification   RP Reset    success