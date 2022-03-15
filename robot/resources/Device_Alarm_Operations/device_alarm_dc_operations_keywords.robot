*** Settings ***
Resource            page/device_alarm_dc_operations_helper.robot
Library  String

*** Variables ***


*** Keywords ***

Device Console Alarm Comment
    [Documentation]    Device alarm page
    Open Device Console Alarm Page
    Input Column Text_Proable_Cause
    Input Column Text_Source1
    Apply Filter on Columns
    Header Checkbox Click
    Device Alarm Comment Button Click
    Device Alarm Comment Content
    Device Alarm Comment Confirm

Device Console Alarm Acknowledgement
    [Documentation]    Device alarm page
    Open Device Console Alarm Page
    Input Column Text_Proable_Cause
    Input Column Text_Source1
    Apply Filter on Columns
    Header Checkbox Click
    Device Alarm Acknowledgement Button Click
    Device Alarm Acknowledgement Content
    Device Alarm Acknowledgement Confirm

Device Console Alarm UnAcknowledgement
    [Documentation]    Device alarm page
    Open Device Console Alarm Page
    Input Column Text_Proable_Cause
    Input Column Text_Source1
    Apply Filter on Columns
    Header Checkbox Click
    Device Alarm UnAcknowledgement Button Click
    Device Alarm UnAcknowledgement Content
    Device Alarm UnAcknowledgement Confirm


Device Console Alarm Clear
    [Documentation]    Device alarm page
    Open Device Console Alarm Page
    Input Column Text_Proable_Cause
    Input Column Text_Source1
    Apply Filter on Columns
    Header Checkbox Click
    Device Alarm Clear Button Click
    Device Alarm Clear Content
    Device Alarm Clear Confirm


Device Console Alarm Delete
    [Documentation]    Device alarm page
    Open Device Console Alarm Page for Delete
    Input Column Text_Proable_Cause
    Input Column Text_Source2
    Apply Filter on Columns
    Header Checkbox Click
    Device Alarm Delete Button Click
    Device Alarm Delete Confirm


S1 Connection Test Alarm Generation
    Open Device Console for Test Alarm
    Test Alarm Button
    Trigger Test Alarm Button
    Clear Alarm Button
    Trigger Test Alarm Button


Verify RPTxOff Raise Alarm in BC Device Console Alarm Page

    [Arguments]    ${DEVICE_MACID}
    BuiltIn.Sleep  50s
    Open Device Console Alarm Pagec for RPTxOff    ${DEVICE_MACID}
    BuiltIn.Sleep  30s
    Open Device Console Alarm Pagec for RPTxOff    ${DEVICE_MACID}
    Search BC Alarm in Alarm Page  Radio Point Service
    Verify RPTxOff BC Alarm Param Details in Alarm page

Verify RPTxOff Raise BC Alarm in Network Console Device Alarm Page
    Device Alarm Page Navigation
    Search BC Alarm in Network Device Alarm Page  Radio Point Service
    Verify RPTxOff BC Alarm Param Details in Network Device Alarm page


Verify RPTxOff Clear Alarm in BC Device Console Alarm Page
    [Arguments]    ${DEVICE_MACID}
    BuiltIn.Sleep  50s
    Open Device Console Alarm Pagec for RPTxOff    ${DEVICE_MACID}
    Navigate to All Alarm
    Search RPTxOff Alarm in All Alarm Page  Radio Point: 0005B9519AA1 in BC: 0005B9423AB2_1 is DOWN
    Verify RPTxOff Clear Alarm Param Details in Alarm page
Verify RPTxOff Clear BC Alarm in Network Console Device Alarm Page
    Device Alarm Page Navigation
    Navigate to All Alarm
    Search RPTxOff Alarm in Network Device Alarm Page    Radio Point: 0005B9519AA1 in BC: 0005B9423AB2_1 is DOWN
    Verify BC Clear Alarm Param Details in Network Device Alarm page
