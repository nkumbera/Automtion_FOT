*** Settings ***
Resource            page/backup_restore_helper.robot
Library  String

*** Variables ***


*** Keywords ***

Device Console Backup Restore Action
    [Documentation]    Device Console Restore
    Click on Restore Operation Button
