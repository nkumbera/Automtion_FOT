*** Settings ***
Resource            page/device_alarm_opertions_helper.robot
Library  String

*** Variables ***


*** Keywords ***

Device Alarm Comment
    [Documentation]    Device alarm page
    Device Alarm Page Navigation
    Input Filter Text_Proable_Cause
    Input Filter Text_Source1
    Apply Device Alarm Filter
    Click on Header Checkbox on Device Alarm
    Click on Comment Button Device Alarm
    Comment Content Input Device Alarm
    Comment Content save Device Alarm

Device Alarm Acknoledgment
    Device Alarm Page Navigation
    Input Filter Text_Proable_Cause
    Input Filter Text_Source1
    Apply Device Alarm Filter
    Click on Header Checkbox on Device Alarm
    Device Alarm Ackno

Device Alarm UnAcknoledgment
    Device Alarm Page Navigation
    Input Filter Text_Proable_Cause
    Input Filter Text_Source1
    Apply Device Alarm Filter
    Click on Header Checkbox on Device Alarm
    Device Alarm UnAckno


Device Alarm Clear_operation
    Device Alarm Page Navigation
    Input Filter Text_Proable_Cause
    Input Filter Text_Source1
    Apply Device Alarm Filter
    Click on Header Checkbox on Device Alarm
    Device Alarm Clear


Device Alarm Delete_operation
    Device Alarm Page Navigation
    Input Filter Text_Proable_Cause
    Input Filter Text_Source2
    Apply Device Alarm Filter
    Click on Header Checkbox on Device Alarm
    Device Alarm Delete


Click element on dashboard overlap tab
    Dashborad element click