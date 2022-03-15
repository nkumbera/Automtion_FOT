*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           system_alarm_ui_controls.py

*** Variables ***


*** Keywords ***
System Alarm Page Navigation
    [Documentation]  Open Alarms page
    go to  ${DMS_Network_Console_Alarm_URL}
    BuiltIn.Sleep  15s


Input Filter Text_MAC1
    [Documentation]  input specific problem
    Input Text    ${Specific_problem}  MAC:0005B97A03
    BuiltIn.Sleep  5s

Input Filter Text_MAC2
    [Documentation]  input specific problem
    Input Text    ${Specific_problem}  MAC:0005B97A04
    BuiltIn.Sleep  5s


Input Filter Text2
    [Documentation]  input proable cause
    Input Text    ${Proable_cause}  BOOTSTRAP
    BuiltIn.Sleep  5s


Apply Filter
    [Documentation]  click apply
    Click DMS Element  ${ID_APPLY_FILTER}
    BuiltIn.Sleep  5s


Click on Header Checkbox
    [Documentation]  header checkbox
    Click DMS Element  ${Header_Checkbox}
    BuiltIn.Sleep  5s


Click on Comment Button
    [Documentation]  comment button
    Click DMS Element  ${Comment_Button}
    BuiltIn.Sleep  5s


Comment Content Input
    [Documentation]  comment content
    Input Text    ${Comment_content}  BOOTSTRAP Alarm Noticed
    BuiltIn.Sleep  5s


Comment Content save
    [Documentation]  comment button
    Click DMS Element  ${comment_save}
    BuiltIn.Sleep  5s


Alarm Ackno
    [Documentation]  alarm Ackno
    Click DMS Element  ${Alarm_ACK}
    BuiltIn.Sleep  5s
    Input Text    ${Alarm_ACK_Comment}  BOOTSTRAP Alarm Ack
    BuiltIn.Sleep  5s
    Click DMS Element  ${Alarm_ACK_Confirm}


Alarm UnAckno
    [Documentation]  alarm UnAckno
    Click DMS Element  ${Alarm_UnACK}
    BuiltIn.Sleep  5s
    Input Text    ${Alarm_UnACK_Comment}  BOOTSTRAP Alarm UnAck
    BuiltIn.Sleep  5s
    Click DMS Element  ${Alarm_UnACK_Confirm}



Alarm Clear
    [Documentation]  alarm clear
    Click DMS Element  ${Alarm_Clear}
    BuiltIn.Sleep  5s
    Input Text    ${Alarm_Clear_Comment}  BOOTSTRAP Alarm Clear
    BuiltIn.Sleep  5s
    Click DMS Element  ${Alarm_Clear_Confirm}



Alarm Delete
    [Documentation]  alarm delete
    Click DMS Element  ${Alarm_Delete}
    BuiltIn.Sleep  5s
    Click DMS Element  ${Alarm_Delete_Confirm}





