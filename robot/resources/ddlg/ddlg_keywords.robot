*** Settings ***
#Library  ../user_keywords/window_operations.py
Resource  ../common/ui_common.robot
Resource  page/ddlg_helper.robot


*** Variables ***


*** Keywords ***
Stop and start ves pool
    [Documentation]  Restart VES job
    [Arguments]   ${job_name}
    Open ddlg
    Open DDLG Running Job Page
    Clone ddlg Running Job     ${job_name}
    Stop DDLG Job    ${job_name}
    Start DDLG Job    ${job_name}

Stop ves pool
    [Documentation]  Restart VES job
    [Arguments]   ${job_name}
    Open ddlg
    Open DDLG Running Job Page
    Clone ddlg Running Job     ${job_name}
    Stop DDLG Job    ${job_name}
    #Start DDLG Job    ${job_name}

Start ves pool
    [Documentation]  Start VES job
    [Arguments]   ${job_name}
    Open ddlg
    #Open DDLG Running Job Page
    #Clone ddlg Running Job     ${job_name}
    #Stop DDLG Job    ${job_name}
    Start DDLG Job    ${job_name}

Enable Pending DDLG job
    [Documentation]  Move pending job to enable state
    [Arguments]   ${job_name}
    Switch browser  ${SIM_Window}
    click DDLG Element   ${XPATH_VIEW_PANDING_JOBS}
    click DDLG Element   ${XPATH_CHECKBOX}
    click DDLG Element   ${XPATH_ENABLE_BUTTON}
    click DDLG Element   ${XPATH_SUBMIT_BOTTON}
    Switch browser   ${DMS_Window}
    
Enable Pending SLAMD Job
    [Documentation]  Move pending job to enable state
    [Arguments]   ${job_name}
    Switch browser  ${SIM_Window}
    Click SLAMD Element   ${XPATH_VIEW_PANDING_JOBS}
    Click SLAMD Element   ${XPATH_CHECKBOX}
    Click SLAMD Element   ${XPATH_ENABLE_BUTTON}
    Click SLAMD Element   ${XPATH_SUBMIT_BOTTON}
    Switch browser   ${DMS_Window}


Create And Update Software Version ddlg
    [Documentation]  Clone , stop and update software version and create the job
    [Arguments]  ${job_name}  ${software_version}
    #Open Browser    ${SMALD_SIMULATOR}  Chrome  alias=${SIM_Window}
    Open ddlg
    Maximize Browser Window
    #Switch browser  ${SIM_Window}
    Log  Create And Update Software Version ddlg
    Clone ddlg Running Job  ${job_name}
    Stop ddlg Job  ${job_name}
    Update ddlg Pending Job Software Version  ${job_name}  ${software_version}
    #Move Slamd Pending Job To Running  ${job_name}
    start ddlg job    ${job_name}
    #Switch browser   ${DMS_Window}

Create And Update Notification config file path ddlg
    [Documentation]  Clone , stop and update Notification config file path and create the job
    [Arguments]  ${job_name}  ${notification_config_file}
    #Open Browser    ${SMALD_SIMULATOR}  Chrome  alias=${SIM_Window}
    Open ddlg
    Maximize Browser Window
    #Switch browser  ${SIM_Window}
    Log  Create And Update Software Version ddlg
    Clone ddlg Running Job  ${job_name}
    Stop ddlg Job  ${job_name}
    Update ddlg Pending Job Notification config file path  ${job_name}  ${notification_config_file}
    #Move Slamd Pending Job To Running  ${job_name}
    start ddlg job    ${job_name}
    #Switch browser   ${DMS_Window}

Create And Update Params for NGRP VC file path ddlg
    [Documentation]  Clone , stop and update Notification config file path and create the job
    [Arguments]  ${job_name}  ${notification_config_file}
    #Open Browser    ${SMALD_SIMULATOR}  Chrome  alias=${SIM_Window}
    Open ddlg
    Maximize Browser Window
    #Switch browser  ${SIM_Window}
    Log  Create And Update Notification config file path ddlg
    Clone ddlg Running Job  ${job_name}
    Stop ddlg Job  ${job_name}
    Update ddlg Pending Job Params for NGRP VC path  ${job_name}  ${notification_config_file}
    #Move Slamd Pending Job To Running  ${job_name}
    start ddlg job    ${job_name}
    #Switch browser   ${DMS_Window}

Set Slamd RU VC
    [Documentation]  Set RU VC type and restart If not set
    [Arguments]  ${pr_type}
    Open Browser    ${SMALD_SIMULATOR}  Chrome  alias=${SIM_Window}
    Maximize Browser Window
    Switch browser  ${SIM_Window}
    @{value_to_check} =   Get From Dictionary	${PARAM_MAPPING}  ${pr_type}
    ${flag} =   Check Slam Param From Running Jobs  @{value_to_check}[0]   @{value_to_check}[1]
    Log  Flag ${flag}
    Should Be True  ${flag} == True
    #Run Keyword If  ${flag} == False   Set Param And Start Running Job Text  ${DEVICE_MACID}  ${XPATH_PARAM_REM_VC_INPUT}   ${value_to_check}
    Switch browser   ${DMS_Window}

Update Slamd Job Status
    [Documentation]  Update job to periodic and start
    [Arguments]  ${inform_status}
    Switch browser  ${SIM_Window}
    Clone Slamd Running Job  ${DEVICE_MACID}
    Stop Slamd Running Job  ${DEVICE_MACID}
    ${old_inform_type}=  Update Slamd Pending INFORM   ${DEVICE_MACID}   ${inform_status}
    Move Slamd Pending Job To Running  ${DEVICE_MACID}
    #Switch browser   ${DMS_Window}
    [Return]  ${old_inform_type}

Update ddlg Job Status
    [Documentation]  Update job to periodic and start
    [Arguments]  ${inform_status}
    #Switch browser  ${SIM_Window}
    Clone ddlg Running Job  ${DEVICE_MACID}
    Stop DDLG Job  ${DEVICE_MACID}
    ${old_inform_type}=  Update ddlg Pending INFORM   ${DEVICE_MACID}   ${inform_status}
    BuiltIn.Sleep  5s
    Move ddlg Pending Job To Running  ${DEVICE_MACID}
    #Switch browser   ${DMS_Window}
    [Return]  ${old_inform_type}

Get Slamd RU Discovery Serial Number
    [Documentation]  Get Serial Number
    #Switch browser  ${SIM_Window}
    Open ddlg Running Job Detail
    ${variable_xpath} =  Format String  ${XPATH_SLAMD_GET_VARIABLE_VALUE}  value=RU Disovery Serial Number
    ${serial_number} =  Get Text  ${variable_xpath}
    #${variable_xpath} =  Format String  ${XPATH_SLAMD_GET_VARIABLE_VALUE}  value=sectorMode
    ${variable_xpath} =  Format String  ${XPATH_SLAMD_GET_VARIABLE_VALUE}  value=Start index
    ${sector_mode} =  Get Text  ${variable_xpath}
    ${rp_identifier}=   Set Variable  ${serial_number}${sector_mode}
    Log  ${rp_identifier}
    Switch browser   ${DMS_Window}
    [return]  ${rp_identifier}

Get SLAMD Sector WhiteList
    [Documentation]  Get Device Sector List
    [Return]  ${SECTOR_WHITE_LIST}