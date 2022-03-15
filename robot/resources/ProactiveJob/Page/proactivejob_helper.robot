*** Keywords ***
*** Settings ***
Library             String
Library             DateTime
Variables           proactivejob_ui_controls.py
Resource            robot/resources/common/ui_common.robot




*** Variables ***
${ppj_start_time}

*** Keywords ***
Open Proactive Provisioning Page
    Go To  ${Proactive_job}
    Wait Until Page Contains Element  ${ID_PROACTIVE_STATUS_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${ID_PROACTIVE_STATUS_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}

Proactive Provisioning Page Navigation
    [Documentation]  Network Console Proactive Provision Page Navigation
    BuiltIn.Sleep  5s
    #Click DMS Element   ${XPATH_License}
    Wait Until Page Contains Element   ${XPATH_PROACTIVEJOB_MENU}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    Click DMS Element   ${XPATH_PROACTIVEJOB_MENU}
    BuiltIn.Sleep  5s

CUCP FR Proactive_Job Verification
	[Documentation]  CUCP Proactive Provision Failure Recovery Job Verification
	Scroll Element Into View   ${XPATH_PPJ_DEVICETYPE}
    BuiltIn.Sleep  3s
    Wait Until Page Contains Element   ${XPATH_NAME_FILTER}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    Input DMS Text   ${XPATH_NAME_FILTER}   ${CUCP_FRJOB}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_APPLY_FILTER_PROACTIVE_PAGE}
    BuiltIn.Sleep  2s
    #${verification_JobState} =  Get Value  ${XPATH_JobState}
    #Log    ${verification_JobState}
    Mouse over  ${XPATH_JobState_Mouse_Hover}
    Wait Until Page Contains    ${helpText}
    Click DMS Element  ${ID_EDIT_BUTTON}

CUUP FR Proactive_Job Verification
	[Documentation]  CUUP Proactive Provision Failure Recovery Job Verification
	Scroll Element Into View   ${XPATH_PPJ_DEVICETYPE}
    BuiltIn.Sleep  3s
    Wait Until Page Contains Element   ${XPATH_NAME_FILTER}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    Input DMS Text   ${XPATH_NAME_FILTER}   ${CUUP_FRJOB}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_APPLY_FILTER_PROACTIVE_PAGE}
    BuiltIn.Sleep  2s
    Mouse over  ${XPATH_JobState_Mouse_Hover}
    Wait Until Page Contains    ${helpText}
    Click DMS Element  ${ID_EDIT_BUTTON}

DU FR Proactive_Job Verification
	[Documentation]  DU Proactive Provision Failure Recovery Job Verification
	Scroll Element Into View   ${XPATH_PPJ_DEVICETYPE}
    BuiltIn.Sleep  3s
    Wait Until Page Contains Element   ${XPATH_NAME_FILTER}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    Input DMS Text   ${XPATH_NAME_FILTER}   ${DU_FRJOB}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_APPLY_FILTER_PROACTIVE_PAGE}
    BuiltIn.Sleep  2s
    Mouse over  ${XPATH_JobState_Mouse_Hover}
    Wait Until Page Contains    ${helpText}
    Click DMS Element  ${ID_EDIT_BUTTON}

CUCP Job Name Verification
	[Documentation]  CUCP Proactive Provision Failure Recovery Job Name Verification
	${verification_Jobname} =  Get DMS Element Text  ${XPATH_FRJOBName}
    Should Be Equal As Strings  ${verification_Jobname}  ${CUCP_FRJOB}
    BuiltIn.Sleep  5s
    #${verification_OperationType} =  Get List Items  ${XPATH_FROpType}    False
    #Log    ${verification_OperationType}
    #${verification_OperationType} =  Select From List By Index  ${XPATH_FROpType}    0
    #Log    ${verification_OperationType}
    #${verification_OperationType} =  Select From List By Label  ${XPATH_FROpType}    Proactive Recovery
    #Log    ${verification_OperationType}
    #${verification_OperationType} =  Select From List By Value  ${XPATH_FROpType}    Proactive Recovery
    #Log    ${verification_OperationType}

CUUP Job Name Verification
	[Documentation]  CUUP Proactive Provision Failure Recovery Job Name Verification
	${verification_Jobname} =  Get DMS Element Text  ${XPATH_FRJOBName}
    Should Be Equal As Strings  ${verification_Jobname}  ${CUUP_FRJOB}
    BuiltIn.Sleep  5s

DU Job Name Verification
	[Documentation]  CUUP Proactive Provision Failure Recovery Job Name Verification
	${verification_Jobname} =  Get DMS Element Text  ${XPATH_FRJOBName}
    Should Be Equal As Strings  ${verification_Jobname}  ${DU_FRJOB}
    BuiltIn.Sleep  5s

FR Job Operation Details
	[Documentation]  Proactive Provision Failure Recovery Job Operationa Details Verification
	${verification_OperationType} =  Get Value  ${XPATH_FROpType}
    #Log ${verification_OperationType}
    #${verification_OperationType} =    Get Value  ${XPATH_HOME_DEVICE_DROPDOWN_1}
    Should Be Equal As Strings  ${verification_OperationType}  ${OperationType}
    BuiltIn.Sleep  2s

FR Job Execution Details
	[Documentation]  Proactive Provision Failure Recovery Job Execution Details Verification
    ${verification_JobType} =  Get DMS Element Text  ${XPATH_FRJobType}
    Should Be Equal As Strings  ${verification_JobType}  ${JobType}
    BuiltIn.Sleep  2s
    ${verification_JobExecFrequency} =  Get Value  ${XPATH_FRJobExecFrequency}
    Should Be Equal As Strings  ${verification_JobExecFrequency}  ${JobExecFrequency}
    ${verification_JobFrequencyHours} =  Get Value  ${XPATH_FRJobFrequencyHours}
    Should Be Equal As Strings  ${verification_JobFrequencyHours}  ${JobFrequencyHours}
    BuiltIn.Sleep  2s
    ${verification_JobFrequencyMinutes} =  Get Value  ${XPATH_FRJobFrequencyMinutes}
    Should Be Equal As Strings  ${verification_JobFrequencyMinutes}  ${JobFrequencyMinutes}
    BuiltIn.Sleep  2s
    #Scroll Element Into View    ${XPATH_DeviceSelection}
    #Wait Until Page Contains    ${XPATH_FR}     timeout=${BROWSER_ELEMENT_TIMEOUT}
    #Set Focus To Element    ${XPATH_FR}

Edit FR Job Execution Details
	[Documentation]  Editing Proactive Provision Failure Recovery Job Execution Details Verification
    Click DMS Element  ${XPATH_HOUR_SELECTOR}
    BuiltIn.Sleep  2s
    Click DMS Element  ${HOUR_SELECTION}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_MINUTE_SELECTOR}
    BuiltIn.Sleep  2s
    Click DMS Element  ${MINUTE_SELCETION}
    BuiltIn.Sleep  2s

CUCP Device Type Verification
	[Documentation]  CUCP Proactive Provision Failure Recovery Job Device Type Verification
    ${verification_DeviceType} =  Get DMS Element Text  ${XPATH_FRDeviceType}
    Should Be Equal As Strings  ${verification_DeviceType}  ${CUCP_DeviceType}

CUUP Device Type Verification
	[Documentation]  CUUP Proactive Provision Failure Recovery Job Device Type Verification
    ${verification_DeviceType} =  Get DMS Element Text  ${XPATH_FRDeviceType}
    Should Be Equal As Strings  ${verification_DeviceType}  ${CUUP_DeviceType}

DU Device Type Verification
	[Documentation]  DU Proactive Provision Failure Recovery Job Device Type Verification
    ${verification_DeviceType} =  Get DMS Element Text  ${XPATH_FRDeviceType}
    Should Be Equal As Strings  ${verification_DeviceType}  ${DU_DeviceType}

FR Job Device Selection Criteria
	[Documentation]  Proactive Provision Failure Recovery Job Device Selection Criteria Verification
    ${verification_DeviceSelectionCriterion} =  Get DMS Element Text  ${XPATH_DeviceSelection}
    Should Be Equal As Strings  ${verification_DeviceSelectionCriterion}  ${Device_Selection_Criterion}

Scroll Down Page
	[Documentation]  Scroll down to page
	#Scroll Element Into View  ${XPATH_ValFail}
    Scroll Element Into View    ${XPATH_END_OF_PAGE}
    #${value}    Get Vertical Position       ${XPATH_CompFail}
    #Log      ${value}
    #${value}    Get Horizontal Position     ${XPATH_CompFail}
    #Log     ${value}
    press keys  ${XPATH_END_OF_PAGE}  ARROW_DOWN
    press keys  ${XPATH_END_OF_PAGE}  END
    press keys  ${XPATH_END_OF_PAGE}  END
    BuiltIn.Sleep  5s

FR Job Failure Reasons Validation
	[Documentation]  Proactive Provision Failure Recovery Job Failure Reason Details Verification
	#Scroll Element Into View    ${XPATH_CompFail}
	Scroll Element Into View    ${PAGE_END}
	${verification_FRC_CompFail} =  Get DMS Element Text  ${XPATH_CompFail}
    Should Be Equal As Strings  ${verification_FRC_CompFail}  ${CompFail}
    ${verification_FRC_ValFail} =  Get DMS Element Text  ${XPATH_ValFail}
    Should Be Equal As Strings  ${verification_FRC_ValFail}  ${ValFail}
    ${verification_FRC_ProvFail} =  Get DMS Element Text  ${XPATH_ProvFail}
    Should Be Equal As Strings  ${verification_FRC_ProvFail}  ${ProvFail}
    BuiltIn.Sleep  2s
    #Scroll Element Into View    ${XPATH_END_OF_PAGE}BuiltIn.Sleep  5s
    #${value}    Get Vertical Position       ${XPATH_CompFail}Log      ${value}${value}    Get Horizontal Position     ${XPATH_CompFail}Log     ${value}#Click DMS Element     ${XPATH_DEVICE_CRITERIA_ALL}
    #press keys  ${XPATH_END_OF_PAGE}  ARROW_DOWN
    #press keys  ${XPATH_END_OF_PAGE}  END
    #press keys  ${XPATH_END_OF_PAGE}  END
    #BuiltIn.Sleep  15s

FR Job Edit Failure Reason Criteria
	[Documentation]  Editing Proactive Provision Failure Recovery Job Failure Reason criteria Verification
	Click DMS Element     ${XPATH_CompFail}
    BuiltIn.Sleep  2s
    Click DMS Element     ${XPATH_ValFail}
    BuiltIn.Sleep  2s
    Click DMS Element     ${XPATH_ProvFail}
    BuiltIn.Sleep  2s
    Click DMS Element     ${XPATH_CompFail}
    BuiltIn.Sleep  2s
    Click DMS Element     ${XPATH_ValFail}
    BuiltIn.Sleep  2s
    Click DMS Element     ${XPATH_ProvFail}
    BuiltIn.Sleep  2s

Cancel the Changes
	[Documentation]  Cancel the changes made in Proactive Provision Failure Recovery Job
	#Click DMS Element    ${XPATH_BACK_BUUTON}
    Click DMS Element     ${XPATH_CANCEL_BUTTON}
    BuiltIn.Sleep  2s
    #Click DMS Element     ${XPATH_CONFIRM_BUTTON}
    #Click DMS Element     ${XPATH_SAVE_BUTTON}
    #BuiltIn.Sleep  2s




Add gNB Endby Proactive job
    [Arguments]  ${Job_name}    ${Operation_type}
    Click DMS Element    ${XPATH_ADD_BUTTON_PROACTIVE_JOB}
    BuiltIn.Sleep  5s
    Input DMS Text  ${XAPTH_Job_Name}    ${Job_name}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_JOB_STATE}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_OPERATION_TYPE}
    BuiltIn.Sleep  5s
    Select DMS Dropdown Option  ${XPATH_OPERATION_TYPE}    ${Operation_type}
    BuiltIn.Sleep  5s
    Click DMS Element     ${XPATH_JOBTYPE}
    BuiltIn.Sleep  5s
    Select schedule time    ${XPATH_START_TIME}
    BuiltIn.Sleep  5s
    #Scroll Element Into View   ${XAPTH_DEVICE_CRITERIA}
    Scroll Element Into View  ${XPATH_END_OF_PAGE}
    BuiltIn.Sleep  3s
    Click DMS Element     ${XPATH_END_DATE}
    BuiltIn.Sleep  5s
    Click DMS Element     ${XPATH_DEVICE_TYPE_CUCP}
    BuiltIn.Sleep  5s
    #Click DMS Element     ${XPATH_DEVICE_TYPE}
    #BuiltIn.Sleep  2s

    execute javascript  window.scrollBy(600, 700)
    Scroll Element Into View  ${XPATH_END_OF_PAGE}
    BuiltIn.Sleep  5s

    ${value}    Get Vertical Position       ${XAPTH_DEVICE_CRITERIA}
    Log      ${value}
    ${value}    Get Horizontal Position     ${XAPTH_DEVICE_CRITERIA}
    Log     ${value}
    press keys  ${XPATH_END_OF_PAGE}  ARROW_DOWN
    press keys  ${XPATH_END_OF_PAGE}  END
    press keys  ${XPATH_END_OF_PAGE}  END
    BuiltIn.Sleep  5s
    Click DMS Element     ${XAPTH_DEVICE_CRITERIA}
    BuiltIn.Sleep  2s


Add gNB Device for configuration Proactive Job
    [Arguments]  ${Network_Param_config_mac}
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${ID_ADD_AVAILABLE_DEVICE_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_PATH_MACID_INPUT}
    BuiltIn.Sleep  2s
    Input DMS Text     ${XPATH_PATH_MACID_INPUT}    ${Network_Param_config_mac}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_APPLY_FILTER_PROACTIVE_PAGE}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_SELECT_DEVICE}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ADD_DEVICE_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DEVICE_LIST_TABLE}
    BuiltIn.Sleep  10s
    Click DMS Element    ${XPATH_BULK_CONFIG_SAVE_BUTTON}
    BuiltIn.Sleep  5s

Search Existing Job
    [Documentation]  Delete the Procative Job Created
    [Arguments]     ${Job_Name}
    input dms text    ${XPATH_INPUT_JOB_NAME}   ${Job_Name}
    BuiltIn.Sleep   5s
    Click DMS Element    ${XPATH_APPLY_FILTER_procative_job}
    BuiltIn.Sleep   5s


Delete Existing Job
    [Documentation]  Delete the Procative Job Created
    [Arguments]     ${Job_Name}
    Search Existing Job    ${Job_Name}
    BuiltIn.Sleep   5s
    Run keyword And Ignore Error    Click DMS Element    ${DELETE_PROACTIVE_JOB}
    BuiltIn.Sleep   5s
    Run keyword And Ignore Error    Click DMS Button     ${CONFIRM_proactive}
    BuiltIn.Sleep   5s
    Run keyword And Ignore Error    Wait Until Element Is Visible   ${XPATH_DELETE_MSG_NOTIFICATION}  timeout=180s
    BuiltIn.Sleep   5s
    Log     Policy deleted Successfully


Add gNB Device for Proactive Job
    [Arguments]  ${Device MACID List}
    BuiltIn.Sleep  10s
    Scroll Element Into View  ${XPATH_ADD_DEVICE_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_PATH_MACID_INPUT}
    BuiltIn.Sleep  2s
    Clear Element Text     ${XPATH_PATH_MACID_INPUT}
    BuiltIn.Sleep  2s
    Input DMS Text     ${XPATH_PATH_MACID_INPUT}    ${Device MACID List}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_APPLY_FILTER_device}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_SELECT_DEVICE}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ADD_DEVICE_BUTTON}
    BuiltIn.Sleep  5s

    Click DMS Element  ${XPATH_DEVICE_LIST_TABLE}
    BuiltIn.Sleep  10s
    Click DMS Element    ${XPATH_BULK_CONFIG_SAVE_BUTTON}
    BuiltIn.Sleep  5s


Add gNB End After Proactive job
    [Arguments]  ${Job_name}    ${Operation_type}
    Click DMS Element    ${XPATH_ADD_BUTTON_PROACTIVE_JOB}
    BuiltIn.Sleep  5s
    Input DMS Text  ${XAPTH_Job_Name}    ${Job_name}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_JOB_STATE}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_OPERATION_TYPE}
    BuiltIn.Sleep  5s
    Select DMS Dropdown Option  ${XPATH_OPERATION_TYPE}    ${Operation_type}
    BuiltIn.Sleep  5s
    Click DMS Element     ${XPATH_JOBTYPE}
    BuiltIn.Sleep  5s
    Select schedule time    ${XPATH_START_TIME}
    BuiltIn.Sleep  5s
    #Scroll Element Into View   ${XAPTH_DEVICE_CRITERIA}
    Scroll Element Into View  ${XPATH_END_OF_PAGE}
    BuiltIn.Sleep  3s
    Click DMS Element     ${XPATH_END_AFTER}
    BuiltIn.Sleep  5s
    Click DMS Element     ${XPATH_DEVICE_TYPE_CUUP}
    BuiltIn.Sleep  5s
    #Click DMS Element     ${XPATH_DEVICE_TYPE}
    #BuiltIn.Sleep  2s

    execute javascript  window.scrollBy(600, 700)
    Scroll Element Into View  ${XPATH_END_OF_PAGE}
    BuiltIn.Sleep  5s

    ${value}    Get Vertical Position       ${XAPTH_DEVICE_CRITERIA}
    Log      ${value}
    ${value}    Get Horizontal Position     ${XAPTH_DEVICE_CRITERIA}
    Log     ${value}
    press keys  ${XPATH_END_OF_PAGE}  ARROW_DOWN
    press keys  ${XPATH_END_OF_PAGE}  END
    press keys  ${XPATH_END_OF_PAGE}  END
    BuiltIn.Sleep  5s
    Click DMS Element     ${XAPTH_DEVICE_CRITERIA}
    BuiltIn.Sleep  2s

Add gNB no end date Proactive job
    [Arguments]  ${Job_name}    ${Operation_type}
    Click DMS Element    ${XPATH_ADD_BUTTON_PROACTIVE_JOB}
    BuiltIn.Sleep  5s
    Input DMS Text  ${XAPTH_Job_Name}    ${Job_name}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_JOB_STATE}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_OPERATION_TYPE}
    BuiltIn.Sleep  5s
    Select DMS Dropdown Option  ${XPATH_OPERATION_TYPE}    ${Operation_type}
    BuiltIn.Sleep  5s
    Click DMS Element     ${XPATH_JOBTYPE}
    BuiltIn.Sleep  5s
    Select schedule time    ${XPATH_START_TIME}
    BuiltIn.Sleep  5s
    #Scroll Element Into View   ${XAPTH_DEVICE_CRITERIA}
    Scroll Element Into View  ${XPATH_END_OF_PAGE}
    BuiltIn.Sleep  3s
    Click DMS Element     ${XPATH_No_End_Date}
    BuiltIn.Sleep  5s
    Click DMS Element     ${XPATH_DEVICE_TYPE_DU}
    BuiltIn.Sleep  5s
    #Click DMS Element     ${XPATH_DEVICE_TYPE}
    #BuiltIn.Sleep  2s

    execute javascript  window.scrollBy(600, 700)
    Scroll Element Into View  ${XPATH_END_OF_PAGE}
    BuiltIn.Sleep  5s

    ${value}    Get Vertical Position       ${XAPTH_DEVICE_CRITERIA}
    Log      ${value}
    ${value}    Get Horizontal Position     ${XAPTH_DEVICE_CRITERIA}
    Log     ${value}
    press keys  ${XPATH_END_OF_PAGE}  ARROW_DOWN
    press keys  ${XPATH_END_OF_PAGE}  END
    press keys  ${XPATH_END_OF_PAGE}  END
    BuiltIn.Sleep  5s
    Click DMS Element     ${XAPTH_DEVICE_CRITERIA}
    BuiltIn.Sleep  2s

Add gNB run immediately Proactive job
    [Arguments]  ${Job_name}    ${Operation_type}    ${device_type}
    Click DMS Element    ${XPATH_ADD_BUTTON_PROACTIVE_JOB}
    BuiltIn.Sleep  5s
    Input DMS Text  ${XAPTH_Job_Name}    ${Job_name}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_JOB_STATE}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_OPERATION_TYPE}
    BuiltIn.Sleep  5s
    Select DMS Dropdown Option  ${XPATH_OPERATION_TYPE}    ${Operation_type}
    BuiltIn.Sleep  5s
    Click DMS Element     ${XPATH_JOBTYPE_Immediate}
    BuiltIn.Sleep  5s
    #Select schedule time
    BuiltIn.Sleep  5s
    #Scroll Element Into View   ${XAPTH_DEVICE_CRITERIA}
    #Scroll Element Into View  ${XPATH_END_OF_PAGE}
    #BuiltIn.Sleep  3s
    #Click DMS Element     ${XPATH_No_End_Date}
    BuiltIn.Sleep  5s
    RUN KEYWORD IF    '${device_type}'=='DU'    Click DMS Element     ${XPATH_DEVICE_TYPE_DU}
    RUN KEYWORD IF    '${device_type}'=='UP'    Click DMS Element     ${XPATH_DEVICE_TYPE_CUUP}
    RUN KEYWORD IF    '${device_type}'=='CP'    Click DMS Element     ${XPATH_DEVICE_TYPE_CUCP}
    BuiltIn.Sleep  5s
    #Click DMS Element     ${XPATH_DEVICE_TYPE}
    #BuiltIn.Sleep  2s

    execute javascript  window.scrollBy(600, 700)
    Scroll Element Into View  ${XPATH_END_OF_PAGE}
    BuiltIn.Sleep  5s

    ${value}    Get Vertical Position       ${XAPTH_DEVICE_CRITERIA}
    Log      ${value}
    ${value}    Get Horizontal Position     ${XAPTH_DEVICE_CRITERIA}
    Log     ${value}
    press keys  ${XPATH_END_OF_PAGE}  ARROW_DOWN
    press keys  ${XPATH_END_OF_PAGE}  END
    press keys  ${XPATH_END_OF_PAGE}  END
    BuiltIn.Sleep  5s
    Click DMS Element     ${XAPTH_DEVICE_CRITERIA}
    BuiltIn.Sleep  2s

Verify execution Status
    [Arguments]     ${Job_Name}
    Search Existing Job    ${Job_Name}
    ${job_content}=    Get Text    ${XPATH_PROACTIVE_JOb_TABLE}
    Log    ${job_content}
    should contain    ${job_content}    Finished
    should contain    ${job_content}    1

Verify ves provisioned value
    ${Table_value}    GET Text   ${XAPTH_VES_PROVISIONED_DATA_DMSGUI}
    Log     ${Table_value}
    should contain    ${Table_value}    ${url_ves_DMS}
    should contain    ${Table_value}    ${Username_ves_DMS}
    should contain    ${Table_value}    ${Password_ves_DMS}
    should contain    ${Table_value}    DMS GUI

Add gNB End After Reboot Proactive job
    [Arguments]  ${Job_name}    ${Operation_type}    ${Occurance_value}    ${device_type}
    Click DMS Element    ${XPATH_ADD_BUTTON_PROACTIVE_JOB}
    BuiltIn.Sleep  5s
    Input DMS Text  ${XAPTH_Job_Name}    ${Job_name}
    BuiltIn.Sleep  5s
    #Click DMS Element    ${XPATH_JOB_STATE}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_OPERATION_TYPE}
    BuiltIn.Sleep  5s
    Select DMS Dropdown Option  ${XPATH_OPERATION_TYPE}    ${Operation_type}
    BuiltIn.Sleep  5s
    Click DMS Element     ${XPATH_JOBTYPE}
    BuiltIn.Sleep  5s
    Select schedule time    ${XPATH_START_TIME}
    BuiltIn.Sleep  5s
    #Scroll Element Into View   ${XAPTH_DEVICE_CRITERIA}
    Scroll Element Into View  ${XPATH_END_OF_PAGE}
    BuiltIn.Sleep  3s
    Click DMS Element     ${XPATH_END_AFTER}
    BuiltIn.Sleep  5s
    Click DMS Element     ${ID_END_AFTER_OCCURANCE}
    BuiltIn.Sleep  5s
    Clear Element Text     ${ID_END_AFTER_OCCURANCE}
    BuiltIn.Sleep  5s
    Input DMS Text  ${ID_END_AFTER_OCCURANCE}    ${Occurance_value}
    #BuiltIn.Sleep  5s
    #Click DMS Element     ${XPATH_DEVICE_TYPE_CUUP}
    #BuiltIn.Sleep  5s
    BuiltIn.Sleep  5s
    RUN KEYWORD IF    '${device_type}'=='DU'    Click DMS Element     ${XPATH_DEVICE_TYPE_DU}
    RUN KEYWORD IF    '${device_type}'=='UP'    Click DMS Element     ${XPATH_DEVICE_TYPE_CUUP}
    RUN KEYWORD IF    '${device_type}'=='CP'    Click DMS Element     ${XPATH_DEVICE_TYPE_CUCP}
    BuiltIn.Sleep  5s
    #Click DMS Element     ${XPATH_DEVICE_TYPE}
    #BuiltIn.Sleep  2s

    execute javascript  window.scrollBy(600, 700)
    Scroll Element Into View  ${XPATH_END_OF_PAGE}
    BuiltIn.Sleep  5s

    ${value}    Get Vertical Position       ${XAPTH_DEVICE_CRITERIA}
    Log      ${value}
    ${value}    Get Horizontal Position     ${XAPTH_DEVICE_CRITERIA}
    Log     ${value}
    press keys  ${XPATH_END_OF_PAGE}  ARROW_DOWN
    press keys  ${XPATH_END_OF_PAGE}  END
    press keys  ${XPATH_END_OF_PAGE}  END
    BuiltIn.Sleep  5s
    Click DMS Element     ${XAPTH_FILTER_CRITERIA}
    BuiltIn.Sleep  2s

Add gNB Filter Device for Proactive Job
    [Arguments]  ${Device_filter}
    #BuiltIn.Sleep  10s
    #Scroll Element Into View  ${XPATH_PPJ_DEVICETYPE}
    #BuiltIn.Sleep  2s
    #Click DMS Element   ${XPATH_PPJ_DEVICETYPE}
    #BuiltIn.Sleep  2s
    BuiltIn.Sleep  10s
    Scroll Element Into View  ${XPATH_PPJ_DEVICETYPE}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_PPJ_DEVICETYPE}
    BuiltIn.Sleep  2s
    #Input DMS Text   ${ID_DEVICETYPE}   ${DEVICETYPE_NAME}
    Click DMS Element   ${XPATH_SELECT_DEVICETYPE}
    BuiltIn.Sleep  2s
    #Scroll Element Into View  ${XPATH_END_OF_PAGE}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_DEVICE_FILTER}
    BuiltIn.Sleep  2s
    #Scroll Element Into View   ${XPATH_SELECT_FILTER}
    #Scroll Element Into View  ${XPATH_END_OF_PAGE}
    BuiltIn.Sleep  2s
    ${Device_filter_output}=  Format String   ${XPATH_SELECT_FILTER}   Device_filter=${Device_filter}
    BuiltIn.Sleep  5s
    Click DMS Element  ${Device_filter_output}
    BuiltIn.Sleep  5s
    #Input DMS Text     ${XPATH_DEVICE_FILTER}    ${Device_Filter}
    #BuiltIn.Sleep  2s
    #press keys  ${XPATH_DEVICE_FILTER}  ARROW_RIGHT
    BuiltIn.Sleep  10s
    Click DMS Element    ${XPATH_BULK_CONFIG_SAVE_BUTTON}
    BuiltIn.Sleep  5s


Select and Add gNB Filter Device for Proactive Job
    [Arguments]  ${Device_filter}
    #BuiltIn.Sleep  10s
    #Scroll Element Into View  ${XPATH_PPJ_DEVICETYPE}
    #BuiltIn.Sleep  2s
    #Click DMS Element   ${XPATH_PPJ_DEVICETYPE}
    #BuiltIn.Sleep  2s
    BuiltIn.Sleep  10s
    Scroll Element Into View  ${XPATH_gNB_DEVICETYPE}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_gNB_DEVICETYPE}
    BuiltIn.Sleep  2s
    #Input DMS Text   ${ID_DEVICETYPE}   ${DEVICETYPE_NAME}
    Click DMS Element   ${XPATH_SELECT_DEVICETYPE}
    BuiltIn.Sleep  2s
    #Scroll Element Into View  ${XPATH_END_OF_PAGE}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_DEVICE_FILTER}
    BuiltIn.Sleep  2s
    #Scroll Element Into View   ${XPATH_SELECT_FILTER}
    #Scroll Element Into View  ${XPATH_END_OF_PAGE}
    BuiltIn.Sleep  2s
    ${Device_filter_output}=  Format String   ${XPATH_SELECT_FILTER}   Device_filter=${Device_filter}
    BuiltIn.Sleep  5s
    Click DMS Element  ${Device_filter_output}
    BuiltIn.Sleep  5s
    #Input DMS Text     ${XPATH_DEVICE_FILTER}    ${Device_Filter}
    #BuiltIn.Sleep  2s
    #press keys  ${XPATH_DEVICE_FILTER}  ARROW_RIGHT
    BuiltIn.Sleep  10s
    Click DMS Element    ${XPATH_BULK_CONFIG_SAVE_BUTTON}
    BuiltIn.Sleep  5s





Select parallel schedule time

    ${Current Time}=    GET Value     ${XPATH_START_TIME}
    Log    ${Current Time}
    ${split value}     Split String   ${Current Time}
    Log     ${split value}
    Log     ${split value}[0]
    Log     ${split value}[1]
    Log     ${split value}[2]
    ${pre}     ${post} =  Split String   ${split value}[1]  :  1
    Log     ${pre}
    Log     ${post}
    Log     int(${post})
    #${pre}    set variable    08
    #${post}    set variable    04
    ${new_value}=    Evaluate   int('${post}') + 10
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
    Clear Element Text     ${XPATH_START_TIME}
    BuiltIn.Sleep  5s
    Input DMS Text      ${XPATH_START_TIME}      ${new date}
    BuiltIn.Sleep  5s
    [Return]    ${new date}

Add gNB no end date Parallel Proactive job
    [Arguments]  ${Job_name}    ${Operation_type}    ${device_type}
    Click DMS Element    ${XPATH_ADD_BUTTON_PROACTIVE_JOB}
    BuiltIn.Sleep  5s
    Input DMS Text  ${XAPTH_Job_Name}    ${Job_name}
    BuiltIn.Sleep  5s
    #Click DMS Element    ${XPATH_JOB_STATE}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_OPERATION_TYPE}
    BuiltIn.Sleep  5s
    Select DMS Dropdown Option  ${XPATH_OPERATION_TYPE}    ${Operation_type}
    BuiltIn.Sleep  5s
    Click DMS Element     ${XPATH_JOBTYPE}
    BuiltIn.Sleep  5s
    ${ppj_start_time}    Select parallel schedule time
    Set Global Variable      ${ppj_start_time}
    #Select parallel schedule time    ${schedule_time_ppj}
    #Select parallel schedule time UP
    BuiltIn.Sleep  5s
    #Scroll Element Into View   ${XAPTH_DEVICE_CRITERIA}
    Scroll Element Into View  ${XPATH_END_OF_PAGE}
    BuiltIn.Sleep  3s
    Click DMS Element     ${XPATH_No_End_Date}
    BuiltIn.Sleep  5s
    #Click DMS Element     ${XPATH_DEVICE_TYPE_DU}
    BuiltIn.Sleep  5s
    RUN KEYWORD IF    '${device_type}'=='DU'    Click DMS Element     ${XPATH_DEVICE_TYPE_DU}
    RUN KEYWORD IF    '${device_type}'=='UP'    Click DMS Element     ${XPATH_DEVICE_TYPE_CUUP}
    RUN KEYWORD IF    '${device_type}'=='CP'    Click DMS Element     ${XPATH_DEVICE_TYPE_CUCP}
    BuiltIn.Sleep  5
    BuiltIn.Sleep  5s
    #Click DMS Element     ${XPATH_DEVICE_TYPE}
    #BuiltIn.Sleep  2s

    execute javascript  window.scrollBy(600, 700)
    Scroll Element Into View  ${XPATH_END_OF_PAGE}
    BuiltIn.Sleep  5s

    ${value}    Get Vertical Position       ${XAPTH_DEVICE_CRITERIA}
    Log      ${value}
    ${value}    Get Horizontal Position     ${XAPTH_DEVICE_CRITERIA}
    Log     ${value}
    press keys  ${XPATH_END_OF_PAGE}  ARROW_DOWN
    press keys  ${XPATH_END_OF_PAGE}  END
    press keys  ${XPATH_END_OF_PAGE}  END
    BuiltIn.Sleep  5s
    Click DMS Element     ${XAPTH_DEVICE_CRITERIA}
    BuiltIn.Sleep  2s



Select parallel schedule time UP
    [Arguments]  ${ppj_start_time}
    ${Current Time}=    GET Value     ${XPATH_START_TIME}
    Log    ${Current Time}
    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_START_TIME}
    BuiltIn.Sleep  5s
    Input DMS Text      ${XPATH_START_TIME}      ${ppj_start_time}
    log    ${ppj_start_time}
    BuiltIn.Sleep  5s

Add gNB no end date Parallel Proactive job UP device
    [Arguments]  ${Job_name}    ${Operation_type}    ${device_type}
    Click DMS Element    ${XPATH_ADD_BUTTON_PROACTIVE_JOB}
    BuiltIn.Sleep  5s
    Input DMS Text  ${XAPTH_Job_Name}    ${Job_name}
    BuiltIn.Sleep  5s
    #Click DMS Element    ${XPATH_JOB_STATE}
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_OPERATION_TYPE}
    BuiltIn.Sleep  5s
    Select DMS Dropdown Option  ${XPATH_OPERATION_TYPE}    ${Operation_type}
    BuiltIn.Sleep  5s
    Click DMS Element     ${XPATH_JOBTYPE}
    BuiltIn.Sleep  5s
    Select parallel schedule time UP    ${ppj_start_time}
    BuiltIn.Sleep  5s
    #Scroll Element Into View   ${XAPTH_DEVICE_CRITERIA}
    Scroll Element Into View  ${XPATH_END_OF_PAGE}
    BuiltIn.Sleep  3s
    Click DMS Element     ${XPATH_No_End_Date}
    BuiltIn.Sleep  5s
    #Click DMS Element     ${XPATH_DEVICE_TYPE_DU}
    BuiltIn.Sleep  5s
    RUN KEYWORD IF    '${device_type}'=='DU'    Click DMS Element     ${XPATH_DEVICE_TYPE_DU}
    RUN KEYWORD IF    '${device_type}'=='UP'    Click DMS Element     ${XPATH_DEVICE_TYPE_CUUP}
    RUN KEYWORD IF    '${device_type}'=='CP'    Click DMS Element     ${XPATH_DEVICE_TYPE_CUCP}
    BuiltIn.Sleep  5
    BuiltIn.Sleep  5s
    #Click DMS Element     ${XPATH_DEVICE_TYPE}
    #BuiltIn.Sleep  2s

    execute javascript  window.scrollBy(600, 700)
    Scroll Element Into View  ${XPATH_END_OF_PAGE}
    BuiltIn.Sleep  5s

    ${value}    Get Vertical Position       ${XAPTH_DEVICE_CRITERIA}
    Log      ${value}
    ${value}    Get Horizontal Position     ${XAPTH_DEVICE_CRITERIA}
    Log     ${value}
    press keys  ${XPATH_END_OF_PAGE}  ARROW_DOWN
    press keys  ${XPATH_END_OF_PAGE}  END
    press keys  ${XPATH_END_OF_PAGE}  END
    BuiltIn.Sleep  5s
    Click DMS Element     ${XAPTH_DEVICE_CRITERIA}
    BuiltIn.Sleep  2s
