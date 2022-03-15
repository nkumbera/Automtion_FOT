*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           device_alarm_ui_controls.py

*** Variables ***


*** Keywords ***
Device Alarm Page Navigation
    [Documentation]  Open Alarms page
    go to  ${DMS_Network_Console_Device_Alarm_URL}
    BuiltIn.Sleep  15s


Input Filter Text_Proable_Cause
    [Documentation]  input proable cause
    BuiltIn.Sleep  2s
    Scroll Element Into View  ${proable_cause_device}
    BuiltIn.Sleep  2s
    Input Text    ${proable_cause_device}  S1 connection
    BuiltIn.Sleep  5s

Input Filter Text_Source1
    [Documentation]  input source1
    BuiltIn.Sleep  2s
    Scroll Element Into View  ${source}
    BuiltIn.Sleep  2s
    Input Text    ${source}  0005B9A501
    BuiltIn.Sleep  5s


Input Filter Text_Source2
    [Documentation]  input source2
    BuiltIn.Sleep  2s
    Scroll Element Into View  ${source}
    BuiltIn.Sleep  2s
    Input Text    ${source}  0005B9A502
    BuiltIn.Sleep  5s


Apply Device Alarm Filter
    [Documentation]  click apply
    BuiltIn.Sleep  2s
    Scroll Element Into View  ${ID_APPLY_FILTER}
    BuiltIn.Sleep  2s
    Click DMS Element  ${ID_APPLY_FILTER}
    BuiltIn.Sleep  5s


Click on Header Checkbox on Device Alarm
    [Documentation]  header checkbox
    BuiltIn.Sleep  2s
    Scroll Element Into View  ${Header_Checkbox}
    BuiltIn.Sleep  2s
    Click DMS Element  ${Header_Checkbox}
    BuiltIn.Sleep  5s


Click on Comment Button Device Alarm
    [Documentation]  comment button
    BuiltIn.Sleep  2s
    Scroll Element Into View  ${Device_alarm_comment_button}
    BuiltIn.Sleep  2s
    Click DMS Element  ${Device_alarm_comment_button}
    BuiltIn.Sleep  5s


Comment Content Input Device Alarm
    [Documentation]  comment content
    Input Text    ${Device_alarm_comment_commentbox}  S1 Connection Alarm Noticed
    BuiltIn.Sleep  5s


Comment Content save Device Alarm
    [Documentation]  comment button
    Click DMS Element  ${Device_alarm_comment_confirm}
    BuiltIn.Sleep  5s


Device Alarm Ackno
    [Documentation]  alarm Ackno
    Click DMS Element  ${Device_Alarm_ACK}
    BuiltIn.Sleep  5s
    Input Text    ${Device_Alarm_ACK_Comment}  S1 Alarm Ack
    BuiltIn.Sleep  5s
    Click DMS Element  ${Device_Alarm_ACK_Confirm}


Device Alarm UnAckno
    [Documentation]  alarm UnAckno
    Click DMS Element  ${Device_Alarm_UnACK}
    BuiltIn.Sleep  5s
    Input Text    ${Device_Alarm_UnACK_Comment}  S1 Alarm UnAck
    BuiltIn.Sleep  5s
    Click DMS Element  ${Device_Alarm_UnACK_Confirm}



Device Alarm Clear
    [Documentation]  alarm clear
    Click DMS Element  ${Device_Alarm_Clear}
    BuiltIn.Sleep  5s
    Input Text    ${Device_Alarm_Clear_Comment}  S1 Alarm Clear
    BuiltIn.Sleep  5s
    Click DMS Element  ${Device_Alarm_Clear_Confirm}



Device Alarm Delete
    [Documentation]  alarm delete
    Click DMS Element  ${Device_Alarm_Delete}
    BuiltIn.Sleep  5s
    Click DMS Element  ${Device_Alarm_Delete_Confirm}