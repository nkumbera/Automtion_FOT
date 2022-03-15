*** Settings ***
Library  ../user_keywords/window_operations.py
Resource  ../common/ui_common.robot
Resource  page/slamd_helper.robot


*** Variables ***


*** Keywords ***
Enable Pending SLAMD Job
    [Documentation]  Move pending job to enable state
    [Arguments]   ${job_name}
    Switch browser  ${SIM_Window}
    Click SLAMD Element   ${XPATH_VIEW_PANDING_JOBS}
    Click SLAMD Element   ${XPATH_CHECKBOX}
    Click SLAMD Element   ${XPATH_ENABLE_BUTTON}
    Click SLAMD Element   ${XPATH_SUBMIT_BOTTON}
    Switch browser   ${DMS_Window}


Create And Update Software Version
    [Documentation]  Clone , stop and update software version and create the job
    [Arguments]  ${job_name}  ${software_version}
    Open Browser    ${SMALD_SIMULATOR}  Chrome  alias=${SIM_Window}
    Maximize Browser Window
    Switch browser  ${SIM_Window}
    Log  Create And Update Software Version
    Clone Slamd Running Job  ${job_name}
    Stop Slamd Running Job  ${job_name}
    Update Slamd Pending Job Software Version  ${job_name}  ${software_version}
    Move Slamd Pending Job To Running  ${job_name}
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

Get Slamd RU Discovery Serial Number
    [Documentation]  Get Serial Number
    Switch browser  ${SIM_Window}
    Open Slamd Running Job Detail
    ${variable_xpath} =  Format String  ${XPATH_SLAMD_GET_VARIABLE_VALUE}  value=RU Disovery Serial Number
    ${serial_number} =  Get Text  ${variable_xpath}
    ${variable_xpath} =  Format String  ${XPATH_SLAMD_GET_VARIABLE_VALUE}  value=sectorMode
    ${sector_mode} =  Get Text  ${variable_xpath}
    ${rp_identifier}=   Set Variable  ${serial_number}${sector_mode}
    Log  ${rp_identifier}
    Switch browser   ${DMS_Window}
    [return]  ${rp_identifier}

Get SLAMD Sector WhiteList
    [Documentation]  Get Device Sector List
    [Return]  ${SECTOR_WHITE_LIST}