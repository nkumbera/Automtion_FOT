*** Settings ***
Resource            page/system_alarm_operations_helper.robot
Library  String

*** Variables ***


*** Keywords ***

Alarm Comment
    [Documentation]    System alarm page
    System Alarm Page Navigation
    Input Filter Text_MAC1
    Input Filter Text2
    Apply Filter
    Click on Header Checkbox
    Click on Comment Button
    Comment Content Input
    Comment Content save

Alarm Acknoledgment
    System Alarm Page Navigation
    Input Filter Text_MAC1
    Input Filter Text2
    Apply Filter
    Click on Header Checkbox
    Alarm Ackno

Alarm UnAcknoledgment
    System Alarm Page Navigation
    Input Filter Text_MAC1
    Input Filter Text2
    Apply Filter
    Click on Header Checkbox
    Alarm UnAckno


Alarm Clear_operation
    System Alarm Page Navigation
    Input Filter Text_MAC1
    Input Filter Text2
    Apply Filter
    Click on Header Checkbox
    Alarm Clear


Alarm Delete_operation
    System Alarm Page Navigation
    Input Filter Text_MAC2
    Input Filter Text2
    Apply Filter
    Click on Header Checkbox
    Alarm Delete







