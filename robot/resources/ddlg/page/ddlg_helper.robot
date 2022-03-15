*** Settings ***
Resource  ../../common/ui_common.robot
Variables   ddlg_ui_controls.py


*** Variables ***



*** Keywords ***
Open ddlg
    Device console Login
    [Documentation]    Log into ddlg
    Prepare Selenium Driver
    Close All Browsers
    BuiltIn.Sleep  10s
    Open Browser    ${DDLG_SIMULATOR}    Chrome  alias=${DMS_Window}
    Maximize Browser Window
    Input Text    ${DDLG_USERNAME}    ${DDLG_UI_USER}
    Input Password    ${DDLG_PASSWORD}    ${DDLG_UI_PASSWORD}
    Click Button    ${DDLG_LOGIN_SIGNIN}

Click DDLG Element
    [Documentation]  Check DDLG Element and Click Action
    [Arguments]   ${CONTROL}
    Wait Until Page Contains Element  ${CONTROL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Click Element  ${CONTROL}

Open DDLG Running Job Page
    [Documentation]  Open ddlg Running Job
    log  Open ddlg Running Job
    #Switch browser  ${SIM_Window}
    ${running_jobs} =  Format String  ${DDLG_RUNNING_JOB}  ddlg_url=${ddlg_url}
    Go To  ${running_jobs}

Open Slamd Running Job Detail
    [Documentation]  Open Slamd running Job
    Open Slamd Running Job Page
    BuiltIn.Sleep  2s
    ${job_to_select} =   Format String  ${XPATH_LINK_OF_RUNNING_JOB}  job_name=${DEVICE_MACID}
    BuiltIn.Sleep  2s
    Log  ${job_to_select}
    BuiltIn.Sleep  2s
    Click DMS Element  ${job_to_select}
    BuiltIn.Sleep  2s

Open DDLG Pending Job Page
    [Documentation]  Open ddlg Pending Job
    Log  Open ddlg Pending Job
    ${pending_jobs} =  Format String  ${DDLG_PENDING_JOB}  ddlg_url=${ddlg_url}
    Go To  ${pending_jobs}


Move Slamd Pending Job To Running
    [Documentation]  Move the pending to running job
    [Arguments]  ${job_name}
    Log  Move Pending Job To Running
    Open Slamd Pending Job Page
    ${job_to_select}=  Format String  ${XPATH_PENDING_JOB_CHECKBOX}   job_name=${job_name}
    Click DMS Element  ${job_to_select}
    Click DDLG Element   ${XPATH_ENABLE_BUTTON}
    Click DDLG Element   ${XPATH_SUBMIT_BOTTON}
    Verify Running Job Present  ${job_name}

Move ddlg Pending Job To Running
    [Documentation]  Move the pending to running job
    [Arguments]  ${job_name}
    Log  Move Pending Job To Running
    Open ddlg Pending Job Page
    ${job_to_select}=  Format String  ${XPATH_PENDING_JOB_CHECKBOX}   job_name=${job_name}
    Click DMS Element  ${job_to_select}
    Click DDLG Element   ${XPATH_ENABLE_BUTTON}
    Click DDLG Element   ${XPATH_SUBMIT_BOTTON}
    BuiltIn.Sleep  10s
    Verify ddlg Running Job Present  ${job_name}


Open Slamd Pending Job
    [Documentation]  Open Slamd Pending Job
    Log  Open Slamd Pending Job

Clone ddlg Running Job
    [Documentation]  Clone running job
    [Arguments]   ${job_name}
    Log  Clone Running Job
    Open DDLG Running Job Page
    BuiltIn.Sleep  2s
    ${job_to_select} =   Format String  ${XPATH_RUNNING_SELECT_JOB}  job_name=${job_name}
    BuiltIn.Sleep  2s
    Click DMS Element  ${job_to_select}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_RUNNING_CLONE_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CLONE_YES_BUTTON}
    BuiltIn.Sleep  2s
    #Verify Pending Job Present  ${job_name}


Stop DDLG Job
    [Documentation]  Stop the job
    [Arguments]    ${job_name}
    Open DDLG Running Job Page
    BuiltIn.Sleep  5s
    ${job_to_select} =   Format String   ${XPATH_RUNNING_SELECT_JOB}  job_name=${job_name}
    Click DMS Element  ${job_to_select}
    Click DMS Element  ${XPATH_CANCLE_RUNNING_JOB_BUTTON}
    Click DMS Element  ${XPATH_CLONE_YES_BUTTON}
    BuiltIn.Sleep  5s
    Open DDLG Running Job Page

Start DDLG Job
    [Documentation]  Start the job
    [Arguments]    ${job_name}
    #Open DDLG Running Job Page
    Open DDLG Pending Job Page
    BuiltIn.Sleep  5s
    ${job_to_select} =   Format String   ${XPATH_RUNNING_SELECT_JOB}  job_name=${job_name}
    BuiltIn.Sleep  5s
    Click DMS Element  ${job_to_select}
    #Click DMS Element  ${XPATH_PENDING_JOB_CHECKBOX}
    Click DMS Element  ${XPATH_ENABLE_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_CLONE_YES_BUTTON}
    BuiltIn.Sleep  2s
    Open DDLG Running Job Page
    #Open Slamd Running Job Page

Stop Slamd Running Job
    [Documentation]  Stop Running Job
    [Arguments]  ${job_name}
    Log  Stop Running Job
    Open Slamd Running Job Page
    Stop Slamd Job  ${job_name}
    ${job_to_select} =   Format String  ${XPATH_RUNNING_SELECT_JOB}  job_name=${job_name}
    ${result} =  Get Element Count   ${job_to_select}
    Log  ${result}
    Run Keyword If   ${result} > 0   Stop Slamd Job  ${job_name}
    Wait Until Element Is Not Visible   ${job_to_select}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    ${result} =  Get Element Count   ${job_to_select}
    Run Keyword If   ${result} == 0   Log  Success in stoping the job
    # Need to faild the Run Keyword Unless  ${result} == 0



Update Slamd Pending Job Software Version
    [Documentation]   Update Pending Job Software Version
    [Arguments]  ${job_name}   ${software_version}
    Log  Update Pending Job Software Version
    Open Slamd Pending Job Page
    ${job_to_select}=  Format String  ${XPATH_SELECT_JOB_TO_EDIT}   job_name=${job_name}
    Click DMS Element  ${job_to_select}
    Click DMS Element  ${XPATH_EDIT_PENDING_JOB_BUTTON}
    Wait Until Element Is Visible  ${ID_NAME_SOFTWARE_VERSION_EDIT_TEXT}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Clear Element Text  ${ID_NAME_SOFTWARE_VERSION_EDIT_TEXT}
    Press Keys  ${ID_NAME_SOFTWARE_VERSION_EDIT_TEXT}   ${software_version}
    Click DDLG Element   ${XPATH_UPDATE_PENDING_JOB}

Update ddlg Pending Job Software Version
    [Documentation]   Update Pending Job Software Version
    [Arguments]  ${job_name}   ${software_version}
    Log  Update Pending Job Software Version
    Open DDLG Pending Job Page
    ${job_to_select}=  Format String  ${XPATH_SELECT_JOB_TO_EDIT_ddlg}   job_name=${job_name}
    Click DMS Element  ${job_to_select}
    Click DMS Element  ${XPATH_EDIT_PENDING_JOB_BUTTON}
    Wait Until Element Is Visible  ${ID_NAME_SOFTWARE_VERSION_EDIT_TEXT}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Clear Element Text  ${ID_NAME_SOFTWARE_VERSION_EDIT_TEXT}
    Press Keys  ${ID_NAME_SOFTWARE_VERSION_EDIT_TEXT}   ${software_version}
    Click DDLG Element   ${XPATH_UPDATE_PENDING_JOB}

Update ddlg Pending Job Notification config file path
    [Documentation]   Update Pending Job Software Version
    [Arguments]  ${job_name}   ${notification_config_file}
    Log  Update Pending Job Software Version
    Open DDLG Pending Job Page
    BuiltIn.Sleep  2s
    ${job_to_select}=  Format String  ${XPATH_SELECT_JOB_TO_EDIT_ddlg}   job_name=${job_name}
    Click DMS Element  ${job_to_select}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_EDIT_PENDING_JOB_BUTTON}
    Wait Until Element Is Visible  ${ID_NAME_NOTIFICATION_CONFIG_EDIT_TEXT}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Clear Element Text  ${ID_NAME_NOTIFICATION_CONFIG_EDIT_TEXT}
    BuiltIn.Sleep  1s
    Press Keys  ${ID_NAME_NOTIFICATION_CONFIG_EDIT_TEXT}   ${notification_config_file}
    Click DDLG Element   ${XPATH_UPDATE_PENDING_JOB}

Update ddlg Pending Job Params for NGRP VC path
    [Documentation]   Update Pending Job Params for NGRP VC
    [Arguments]  ${job_name}   ${notification_config_file}
    Log  Update Pending Job Params for NGRP VC
    Open DDLG Pending Job Page
    BuiltIn.Sleep  2s
    ${job_to_select}=  Format String  ${XPATH_SELECT_JOB_TO_EDIT_ddlg}   job_name=${job_name}
    Click DMS Element  ${job_to_select}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_EDIT_PENDING_JOB_BUTTON}
    Wait Until Element Is Visible  ${ID_NAME_Params_for_NGRP_VC_EDIT_TEXT}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Clear Element Text  ${ID_NAME_Params_for_NGRP_VC_EDIT_TEXT}
    BuiltIn.Sleep  1s
    Press Keys  ${ID_NAME_Params_for_NGRP_VC_EDIT_TEXT}   ${notification_config_file}
    Click DDLG Element   ${XPATH_UPDATE_PENDING_JOB}


Verify Pending Job Present
    [Documentation]  Verify the job in the pending state
    [Arguments]  ${job_name}
    Open Slamd Pending Job Page
    ${job_to_select}=  Format String  ${XPATH_SELECT_JOB_TO_EDIT}   job_name=${job_name}
    Wait Until Page Contains Element  ${job_to_select}  timeout=${BROWSER_ELEMENT_TIMEOUT}

Verify ddlg Running Job Present
    [Documentation]  Verify the jobs in the running state
    [Arguments]   ${job_name}
    #Open Slamd Running Job Page
    Open ddlg Running Job Page
    ${job_to_select} =   Format String   ${XPATH_RUNNING_SELECT_JOB}  job_name=${job_name}
    Wait Until Page Contains Element  ${job_to_select}  timeout=${BROWSER_ELEMENT_TIMEOUT}


Check Slam Param From Running Jobs
    [Documentation]  Verify the jobs in the running state
    [Arguments]   ${xpath_of_element}   ${value}
    Open SLAMD Running Job Detail
    BuiltIn.Sleep  2s
    ${get_text_value} =   Get Text   ${xpath_of_element}
    ${count} =  Get Lines Containing String   ${get_text_value}  ${value}

    ${flag} =  Run Keyword If  '${count}' == '${value}'   Set Variable  True
    ...           ELSE  Set Variable  False
    Log  ${flag}
    [return]  ${flag}

Set Param And Start Running Job Text
    [Documentation]  Set the running job parameter
    [Arguments]   ${job_name}  ${element_identifier}  ${value}
    Clone Slamd Running Job  ${DEVICE_MACID}
    Stop Slamd Running Job  ${DEVICE_MACID}
    Open Slamd Pending Job Page
    ${job_to_select}=  Format String  ${XPATH_SELECT_JOB_TO_EDIT}   job_name=${job_name}
    Click DMS Element  ${job_to_select}
    Click DMS Element  ${XPATH_EDIT_PENDING_JOB_BUTTON}
    Wait Until Element Is Visible  ${element_identifier}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Clear Element Text  ${element_identifier}
    Press Keys  ${element_identifier}   ${value}
    Click DDLG Element   ${XPATH_UPDATE_PENDING_JOB}
    Move Slamd Pending Job To Running  ${DEVICE_MACID}

Update Slamd Pending INFORM
   [Documentation]  Update INFORM Status
   [Arguments]  ${job_name}  ${inform_type}
   Open Slamd Pending Job Page
   ${job_to_select}=  Format String  ${XPATH_SELECT_JOB_TO_EDIT}   job_name=${job_name}
   BuiltIn.Sleep  2s
   Click DMS Element  ${job_to_select}
   BuiltIn.Sleep  2s
   Click DMS Element  ${XPATH_EDIT_PENDING_JOB_BUTTON}
   BuiltIn.Sleep  2s
   ${old_inform_type}=  Get Selected List Value  ${XPATH_INFORM_TYPE_SELECT}
   BuiltIn.Sleep  2s
   Select From List By Value  ${XPATH_INFORM_TYPE_SELECT}  ${inform_type}
   BuiltIn.Sleep  2s
   Click DDLG Element  ${XPATH_UPDATE_PENDING_JOB}
   [Return]  ${old_inform_type}

Update ddlg Pending INFORM
   [Documentation]  Update INFORM Status
   [Arguments]  ${job_name}  ${inform_type}
   Open ddlg Pending Job Page
   ${job_to_select}=  Format String  ${XPATH_SELECT_JOB_TO_EDIT_ddlg}   job_name=${job_name}
   BuiltIn.Sleep  2s
   Click DMS Element  ${job_to_select}
   BuiltIn.Sleep  2s
   Click DMS Element  ${XPATH_EDIT_PENDING_JOB_BUTTON}
   BuiltIn.Sleep  2s
   ${old_inform_type}=  Get Selected List Value  ${XPATH_INFORM_TYPE_SELECT}
   BuiltIn.Sleep  2s
   Select From List By Value  ${XPATH_INFORM_TYPE_SELECT}  ${inform_type}
   BuiltIn.Sleep  2s
   Click DDLG Element   ${XPATH_UPDATE_PENDING_JOB}
   [Return]  ${old_inform_type}


Open ddlg Running Job Detail
    [Documentation]  Open Slamd running Job
    Open ddlg Running Job Page
    BuiltIn.Sleep  2s
    ${job_to_select} =   Format String  ${XPATH_LINK_OF_RUNNING_JOB}  job_name=${DEVICE_MACID}
    BuiltIn.Sleep  2s
    Log  ${job_to_select}
    BuiltIn.Sleep  2s
    Click DMS Element  ${job_to_select}
    BuiltIn.Sleep  2s

