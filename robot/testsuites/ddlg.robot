*** Settings ***
Documentation       ddlg
Resource            ../resources/common/ui_common.robot
Resource            ../resources/ddlg/ddlg_keywords.robot
Library             String


*** Test Cases ***
Start ddlg running job
    [Documentation]  start ddl
    [Tags]   ddlg
    Stop and start ves pool
