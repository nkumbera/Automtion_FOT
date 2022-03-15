
*** Settings ***
Library             String
Library             DateTime
Variables           firmwareupgrade_ui_controls.py
Resource            robot/resources/common/ui_common.robot
Resource             ../resources/Import/Import_helper.robot




*** Variables ***


*** Keywords ***

Firmware Upgrade Image Page Navigation
    [Documentation]  Open Network Console Firmware Upgrade Image creation Page
    ${open_page}=  Format String   ${FIRMWARE_UPGRADE_IMAGE_URL}   dms_device_console=${DMS_NC_URL}
    Log  ${open_page}
    Go To   ${open_page}


Add URL based Firmware Upgrade
    [Documentation]  Add URL based Firmware Upgrade for device
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_IMAGE_ADD_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_IMAGE_NAME}
    BuiltIn.Sleep  2s
    Input DMS Text   ${ID_IMAGE_NAME}   ${RP_IMAGE_NAME}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_DEVICETYPE}
    BuiltIn.Sleep  2s
    #Input DMS Text   ${ID_DEVICETYPE}   ${DEVICETYPE_NAME}
    Click DMS Element   ${XPATH_BC_DEVICETYPE}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_FIRMWARE_VERSION}
    BuiltIn.Sleep  2s
    Input DMS Text   ${ID_FIRMWARE_VERSION}   ${RP_IMAGE_VERSION}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_IMAGE_LOCATION}
    BuiltIn.Sleep  2s
    Input DMS Text   ${ID_IMAGE_LOCATION}   ${RP_IMAGE_LOCATION}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_IMAGE_TYPE}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_FILE_SIZE}
    BuiltIn.Sleep  2s
    Input DMS Text   ${ID_FILE_SIZE}   ${RP_FILE_SIZE}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_USERNAME}
    BuiltIn.Sleep  2s
    Input DMS Text   ${ID_USERNAME}   ${FIRMWARE_USERNAME}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_PASSWORD}
    BuiltIn.Sleep  2s
    Input DMS Text   ${ID_PASSWORD}   ${FIRMWARE_PASSWORD}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_FIRMWARE_SAVE}
    BuiltIn.Sleep  2s

Verify Added Image in Firmware Image page
    [Documentation]  Verify added firmware image is present in Firmware Image page
    Click DMS Element   ${XPATH_FIRMWARE_NAME}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_FIRMWARE_NAME}   ${RP_IMAGE_NAME}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_FIRMWARE_APPLY}
    BuiltIn.Sleep  2s
    ${value}=     get text    ${XPATH_IMAGE_TYPE_VALUE}
    Log    ${value}
    Should Be Equal  ${value}    RP Only
    BuiltIn.Sleep   2s

Delete Firmware Image
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_FIRMWARE_NAME}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_FIRMWARE_NAME}   ${RP_IMAGE_NAME}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_FIRMWARE_APPLY}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_FIRMWARE_DELETE}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_FIRMWARE_DELETE_CONFIRM}
    BuiltIn.Sleep  2s

Firmware Upgrade Manage Page Navigation
    [Documentation]  Open Network Console Firmware Upgrade Image creation Page
    ${open_page}=  Format String   ${FIRMWARE_UPGRADE_MANAGE_URL}   dms_device_console=${DMS_NC_URL}
    Log  ${open_page}
    Go To   ${open_page}

Edit Firmware Schedule Time
    #click dms element     ${EDIT_SCHEDULE_TIME}
    ${Current Time}=    GET Value     ${XPATH_FIRMWARE_SCHE_STARTDATE}
    Log    ${Current Time}
    ${split value}     Split String   ${Current Time}
    Log     ${split value}
    Log     ${split value}[0]
    Log     ${split value}[1]
    Log     ${split value}[2]
    ${pre}          ${post} =  Split String   ${split value}[1]  :  1
    Log     ${pre}
    Log     ${post}
    Log     int(${post})
    #${pre}    set variable    08
    #${post}    set variable    04
    ${new_value}=    Evaluate   int('${post}') + 3
    Log    ${new_value}
    ${new_value_old}=    set variable    ${new_value}
    #${pre_old}=    set variable    ${pre}


    ${pre}=    Evaluate   int('${pre}') + 0
    Log    ${pre}
    ${pre_old}=    set variable    ${pre}
    ${len_pre}=     Evaluate   int(math.log10(${pre})) + 1
    Log  ${len_pre}
    #${pre}=      Run keyword if  int('${len_pre}') <= 1    Catenate    0${pre}


    ${pre}=     Run keyword if  int(${new_value}) >= 60    Evaluate   int('${pre}') + 1
    ...  ELSE   set variable   ${pre_old}
    Log     ${pre}
    ${len_pre}=     Evaluate   int(math.log10(${pre})) + 1
    Log  ${len_pre}
    ${pre}=      Run keyword if  int('${len_pre}') <= 1    Catenate    0${pre}
    ...  ELSE   set variable   ${pre}
    ${new_value}=     Run keyword if  int(${new_value}) >= 60    Evaluate   int('${new_value}') - 60
    ...  ELSE   set variable   ${new_value_old}
    Log     ${new_value}
    ${new_value}=    Run keyword if  ${new_value} == 0    set variable    01
    ...  ELSE   set variable   ${new_value}
    ${new_value}=    Evaluate   int('${new_value}') + 0
    Log    ${new_value}
    ${len}=     Evaluate   int(math.log10(${new_value})) + 1
    Log  ${len}


    #${len_pre}=     Evaluate   int(math.log10(${pre})) + 1
    #Log  ${len_pre}



    ${new date}=     Run keyword if  int(${len}) == 1    Catenate     ${split value}[0]  ${pre}:0${new_value}  ${split value}[2]
    ...  ELSE    Catenate     ${split value}[0]  ${pre}:${new_value}  ${split value}[2]
    Log     ${new date}

    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_FIRMWARE_SCHE_STARTDATE}
    BuiltIn.Sleep  5s
    Input DMS Text      ${XPATH_FIRMWARE_SCHE_STARTDATE}      ${new date}
    BuiltIn.Sleep  5s


Schedule RP Only Firmware Upgrade Job
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_FIRMWARE_ADD_BUTTON}
    BuiltIn.Sleep  2s
    Input DMS Text   ${ID_FIRMWARE_JOB_NAME}   ${FIRMWARE_JOB_NAME}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_FIRMWARE_SCHE_STARTDATE}
    BuiltIn.Sleep  2s
    Edit Firmware Schedule Time
    #Edit Schedule Time
    BuiltIn.Sleep  5s
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_FIRMWARE_DEVICETYPE}
    BuiltIn.Sleep  2s
    #Input DMS Text   ${ID_DEVICETYPE}   ${DEVICETYPE_NAME}
    Click DMS Element   ${XPATH_BC_DEVICETYPE}
    BuiltIn.Sleep  2s
    Scroll Element Into View    ${XPATH_MACID_SEARCH}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_MACID_SEARCH}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_MACID_SEARCH}   ${FIRMWARE_MAC_ID}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_DEVICE_APPLY}
    BuiltIn.Sleep  2s
    #Scroll Down Page
    #BuiltIn.Sleep  2s
    Scroll Element Into View    ${ID_ADD_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_SELECT_DEVICE}
    BuiltIn.Sleep  2s
    #Scroll Element Into View    ${ID_ADD_BUTTON}
   # BuiltIn.Sleep  2s
    Click DMS Element   ${ID_ADD_BUTTON}
    BuiltIn.Sleep  2s
    Scroll Element Into View    ${ID_IMAGE_NUMBER}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_IMAGE_SEARCH}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_IMAGE_SEARCH}   ${RP_IMAGE_NAME}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_IMAGE_APPLY}
    BuiltIn.Sleep  2s
    Scroll Element Into View    ${ID_IMAGE_NUMBER}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_SELECT_IMAGE}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_FIRMWARE_SAVE}

Verify RP Firmware Job Status
    [Arguments]     ${job_status}
    BuiltIn.Sleep  60s
    BuiltIn.Sleep  60s
    BuiltIn.Sleep  60s
    Firmware Upgrade Manage Page Navigation
    Click DMS Element   ${XPATH_JOBNAME_SEARCH}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_JOBNAME_SEARCH}   ${FIRMWARE_JOB_NAME}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_JOBSEARCH_APPLY}
    BuiltIn.Sleep  2s
    ${value}=     get text    ${XPATH_JOB_STATUS}
    Log    ${value}
    Should Be Equal  ${value}    ${job_status}

Verify Firmware Upgrade details in history
    BuiltIn.Sleep  2s
    Scroll Element Into View     ${XPATH_DOWNLOAD_ROW}
    BuiltIn.Sleep  5s
    #${Device_history_table}=     get text    ${XPATH_RESULT_PANEL}
    #Log    ${Device_history_table}
    ${Device_history_row}=     get text    ${XPATH_DOWNLOAD_ROW}
    Log    ${Device_history_row}
    #should contain      ${Device_history_table}     Device Reachability
    should contain      ${Device_history_row}     Initiate Download
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DOWNLOAD_ROW}
    BuiltIn.Sleep  10s
    ${value}=     get text    ${XPATH_FIRMWARE_NAME_HISTORY}
    Log    ${value}
    Should Be Equal  ${value}    ${RP_IMAGE_NAME}
    BuiltIn.Sleep  5s
        #Click DMS Element ${XPATH_HISTORY_DETAIL_CLOSE}
        #BuiltIn.Sleep  2s
    Click DMS Element    ${XPATH_CLOSE_BUTTON}
    BuiltIn.Sleep  2s

Delete Firmware Job
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_JOBNAME_SEARCH}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_JOBNAME_SEARCH}   ${FIRMWARE_JOB_NAME}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_JOBSEARCH_APPLY}
    BuiltIn.Sleep  2s
    Scroll Element Into View    ${ID_FIRMWARE_JOB_DELETE}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_FIRMWARE_JOB_DELETE}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_FIRMWARE_JOB_DELETE_CONFIRM}
    BuiltIn.Sleep  2s

Return Added Time
    [Arguments]  ${time_mins}  ${Current Time}
    Log    ${Current Time}
    ${split value}     Split String   ${Current Time}
    Log     ${split value}
    Log     ${split value}[0]
    Log     ${split value}[1]
    Log     ${split value}[2]
    ${pre}          ${post} =  Split String   ${split value}[1]  :  1
    Log     ${pre}
    Log     ${post}
    Log     int(${post})
    #${pre}    set variable    08
    #${post}    set variable    04
    ${new_value}=    Evaluate   int('${post}') + ${time_mins}
    Log    ${new_value}
    ${new_value_old}=    set variable    ${new_value}
    #${pre_old}=    set variable    ${pre}


    ${pre}=    Evaluate   int('${pre}') + 0
    Log    ${pre}
    ${pre_old}=    set variable    ${pre}
    ${len_pre}=     Evaluate   int(math.log10(${pre})) + 1
    Log  ${len_pre}
    #${pre}=      Run keyword if  int('${len_pre}') <= 1    Catenate    0${pre}


    ${pre}=     Run keyword if  int(${new_value}) >= 60    Evaluate   int('${pre}') + 1
    ...  ELSE   set variable   ${pre_old}
    Log     ${pre}
    ${len_pre}=     Evaluate   int(math.log10(${pre})) + 1
    Log  ${len_pre}
    ${pre}=      Run keyword if  int('${len_pre}') <= 1    Catenate    0${pre}
    ...  ELSE   set variable   ${pre}
    ${new_value}=     Run keyword if  int(${new_value}) >= 60    Evaluate   int('${new_value}') - 60
    ...  ELSE   set variable   ${new_value_old}
    Log     ${new_value}
    ${new_value}=    Run keyword if  ${new_value} == 0    set variable    01
    ...  ELSE   set variable   ${new_value}
    ${new_value}=    Evaluate   int('${new_value}') + 0
    Log    ${new_value}
    ${len}=     Evaluate   int(math.log10(${new_value})) + 1
    Log  ${len}


    #${len_pre}=     Evaluate   int(math.log10(${pre})) + 1
    #Log  ${len_pre}



    ${new date}=     Run keyword if  int(${len}) == 1    Catenate     ${split value}[0]  ${pre}:0${new_value}  ${split value}[2]
    ...  ELSE    Catenate     ${split value}[0]  ${pre}:${new_value}  ${split value}[2]
    Log     ${new date}
    [return]    ${new date}


Schedule split firmware upgrade job for OneCell devices
    [Arguments]  ${FIRMWAREUPGRADE_JOB_NAME}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_FIRMWARE_ADD_BUTTON}
    BuiltIn.Sleep  2s
    ${JOB_NAME}=    Set Variable    ${FIRMWAREUPGRADE_JOB_NAME}
    Input DMS Text   ${ID_FIRMWARE_JOB_NAME}   ${JOB_NAME}
    BuiltIn.Sleep  2s
    #Clear Element Text  ${XPATH_DURATION}
    #Input DMS Text  ${XPATH_DURATION}   8
    #BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_FIRMWARE_SCHE_STARTDATE}
    BuiltIn.Sleep  2s
    ${CurrentTime}=    GET Value     ${XPATH_FIRMWARE_SCHE_STARTDATE}
    Log         ${CurrentTime}
    ${new date}=        Return Added Time    5     ${CurrentTime}
    BuiltIn.Sleep  5s
    BuiltIn.Sleep  2s
    Clear Element Text  ${XPATH_FIRMWARE_SCHE_STARTDATE}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_FIRMWARE_SCHE_STARTDATE}   ${new date}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_RADIOBTN_ENDBY}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_FIRMWARE_DEVICETYPE}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_BC_DEVICETYPE}
    BuiltIn.Sleep  2s
    Scroll Element Into View    ${XPATH_MACID_SEARCH}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_RADIOBTN_SPLIT}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_FIRMWARE_ACTIVATE_STARTDATE}
    BuiltIn.Sleep  2s
    ${new date}=        Return Added Time    6     ${CurrentTime}
    Clear Element Text  ${XPATH_FIRMWARE_ACTIVATE_STARTDATE}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_FIRMWARE_ACTIVATE_STARTDATE}   ${new date}
    BuiltIn.Sleep  2s
    Clear Element Text  ${XPATH_FIRMWARE_ACTIVATE_MINUTE}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_FIRMWARE_ACTIVATE_MINUTE}   30
    BuiltIn.Sleep  2s
    Scroll Element Into View    ${XPATH_MACID_SEARCH}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_MACID_SEARCH}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_MACID_SEARCH}   ${FIRMWARE_SPLIT_MAC_ID}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_DEVICE_APPLY}
    BuiltIn.Sleep  2s
    #Scroll Down Page
    #BuiltIn.Sleep  2s
    Scroll Element Into View    ${ID_ADD_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_SELECT_DEVICE}
    BuiltIn.Sleep  2s
    #Scroll Element Into View    ${ID_ADD_BUTTON}
   # BuiltIn.Sleep  2s
    Click DMS Element   ${ID_ADD_BUTTON}
    BuiltIn.Sleep  2s
    Scroll Element Into View    ${ID_IMAGE_NUMBER}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_IMAGE_SEARCH}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_IMAGE_SEARCH}   ${SPLIT_IMAGE_NAME}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_IMAGE_APPLY}
    BuiltIn.Sleep  2s
    Scroll Element Into View    ${ID_IMAGE_NUMBER}
    BuiltIn.Sleep  2s
    ${item_present}=  Run Keyword And Return Status  Element Should Be Visible  ${XPATH_SELECT_IMAGE}
    BuiltIn.Sleep  3s
    Run Keyword If  ${item_present}  Run Keywords     BuiltIn.Sleep  1s  AND    Click DMS Element  ${XPATH_SELECT_IMAGE}
    ...  ELSE  Run Keywords  Add URL based Split Firmware Upgrade  AND  Input DMS Text   ${XPATH_IMAGE_SEARCH}   ${SPLIT_IMAGE_NAME}  AND  Click DMS Element   ${ID_IMAGE_APPLY}   AND  BuiltIn.Sleep  2s  AND    Click DMS Element  ${XPATH_SELECT_IMAGE}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_FIRMWARE_SAVE}
    [return]    ${JOB_NAME}

Verify Firmware Job Status
    [Arguments]     ${job_status}   ${JOB_NAME}
    BuiltIn.Sleep  5s
    Firmware Upgrade Manage Page Navigation
    Click DMS Element   ${XPATH_JOBNAME_SEARCH}
    BuiltIn.Sleep  2s
    Input DMS Text   ${XPATH_JOBNAME_SEARCH}   ${JOB_NAME}
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_JOBSEARCH_APPLY}
    BuiltIn.Sleep  2s
    ${value}=     get text    ${XPATH_JOB_STATUS}
    Log    ${value}
    Should Be Equal  ${value}    ${job_status}

Add URL based Split Firmware Upgrade
    [Documentation]  Add URL based Split Firmware Upgrade for device
    BuiltIn.Sleep  2s
    Click DMS Element   ${ID_SPLIT_FIRMWARE_ADD_BUTTON}
    BuiltIn.Sleep  2s
    Input DMS Text   ${ID_IMAGE_NAME}   ${SPLIT_IMAGE_NAME}
    BuiltIn.Sleep  2s
    Scroll Element Into View    ${ID_IMAGE_LOCATION}
    BuiltIn.Sleep  2s
    Input DMS Text   ${ID_FIRMWARE_VERSION}   ${SPLIT_IMAGE_VERSION}
    BuiltIn.Sleep  2s
    Scroll Element Into View    ${ID_FILE_SIZE}
    BuiltIn.Sleep  2s
    Input DMS Text   ${ID_IMAGE_LOCATION}   ${SPLIT_IMAGE_LOCATION}
    BuiltIn.Sleep  2s
    Input DMS Text   ${ID_FILE_SIZE}   ${SPLIT_FILE_SIZE}
    BuiltIn.Sleep  2s
    Scroll Element Into View    ${ID_PASSWORD}
    BuiltIn.Sleep  2s
    Input DMS Text   ${ID_USERNAME}   ${FIRMWARE_USERNAME}
    BuiltIn.Sleep  2s
    Input DMS Text   ${ID_PASSWORD}   ${FIRMWARE_PASSWORD}
    BuiltIn.Sleep  2s
    Scroll Element Into View    ${ID_SPLIT_FIRMWARE_SAVE_BUTTON}
    BuiltIn.Sleep  3s
    Click DMS Element   ${ID_SPLIT_FIRMWARE_SAVE_BUTTON}
    BuiltIn.Sleep  2s