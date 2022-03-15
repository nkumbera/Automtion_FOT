*** Settings ***
Resource  ../../common/ui_common.robot
Variables   slamd_ui_controls.py


*** Variables ***



*** Keywords ***

Click SLAMD Element
    [Documentation]  Check SLAMD Element and Click Action
    [Arguments]   ${CONTROL}
    Wait Until Page Contains Element  ${CONTROL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Click Element  ${CONTROL}

Open Slamd Running Job Page
    [Documentation]  Open Slamd Running Job
    log  Open Slamd Running Job
    Switch browser  ${SIM_Window}
    ${running_jobs} =  Format String  ${SMALD_RUNNING_JOB}  slamd_url=${SMALD_SIMULATOR}
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

Open Slamd Pending Job Page
    [Documentation]  Open Slamd Pending Job
    Log  Open Slamd Pending Job
    Switch browser  ${SIM_Window}
    ${pending_jobs} =  Format String  ${SMALD_PENDING_JOB}  slamd_url=${SMALD_SIMULATOR}
    Go To  ${pending_jobs}


Move Slamd Pending Job To Running
    [Documentation]  Move the pending to running job
    [Arguments]  ${job_name}
    Log  Move Pending Job To Running
    Open Slamd Pending Job Page
    ${job_to_select}=  Format String  ${XPATH_PENDING_JOB_CHECKBOX}   job_name=${job_name}
    Click DMS Element  ${job_to_select}
    Click SLAMD Element   ${XPATH_ENABLE_BUTTON}
    Click SLAMD Element   ${XPATH_SUBMIT_BOTTON}
    Verify Running Job Present  ${job_name}

Open Slamd Pending Job
    [Documentation]  Open Slamd Pending Job
    Log  Open Slamd Pending Job

Clone Slamd Running Job
    [Documentation]  Clone running job
    [Arguments]   ${job_name}
    Log  Clone Running Job
    Open Slamd Running Job Page
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


Stop Slamd Job
    [Documentation]  Stop the job
    [Arguments]    ${job_name}
    ${job_to_select} =   Format String   ${XPATH_RUNNING_SELECT_JOB}  job_name=${job_name}
    Click DMS Element  ${job_to_select}
    Click DMS Element  ${XPATH_CANCLE_RUNNING_JOB_BUTTON}
    Click DMS Element  ${XPATH_CLONE_YES_BUTTON}
    BuiltIn.Sleep  5s
    Open Slamd Running Job Page

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
    Click SLAMD Element   ${XPATH_UPDATE_PENDING_JOB}

Verify Pending Job Present
    [Documentation]  Verify the job in the pending state
    [Arguments]  ${job_name}
    Open Slamd Pending Job Page
    ${job_to_select}=  Format String  ${XPATH_SELECT_JOB_TO_EDIT}   job_name=${job_name}
    Wait Until Page Contains Element  ${job_to_select}  timeout=${BROWSER_ELEMENT_TIMEOUT}

Verify Running Job Present
    [Documentation]  Verify the jobs in the running state
    [Arguments]   ${job_name}
    Open Slamd Running Job Page
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
    Click SLAMD Element   ${XPATH_UPDATE_PENDING_JOB}
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
   Click SLAMD Element   ${XPATH_UPDATE_PENDING_JOB}
   [Return]  ${old_inform_type}
