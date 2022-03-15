*** Settings ***
Resource            page/dc_notification_helper.robot
Library  String

*** Variables ***


*** Keywords ***

Device Console Notifications
    [Documentation]    Device Console Notifications
    Open Notification Page
    Click on All Notification Button
    Close Notification Window
