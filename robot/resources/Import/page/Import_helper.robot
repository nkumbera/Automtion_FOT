*** Settings ***
Library             String
Variables           ServiceSetting_ui_controls.py
Resource           ../resources/ServiceSetting/testdata/ServiceSetting_testdata.py
#Library             String
Variables           Import_ui_controls.py
Variables           ../testdata/Import_testdata.py
Resource           ../resources/device_history/device_history_page_keywords.robot
Variables           device_history_ui_controls.py

*** Variables ***
${UploadFiletest}           css=[type='file']
${AddFile}           ${NETCONF_FILE_LOCATION}
${AddMountFile}      ${EXECDIR}${MOUNT_UMANAGED_FILE_LOCATION}


*** Keywords ***
Open File Import Page
    go to   ${DMS_FILE_IMPORT_URL}
    Wait Until Page Contains Element  ${DEVICE_FILE_IMPORT}  timeout=${BROWSER_ELEMENT_TIMEOUT}

Select and import file
     BuiltIn.Sleep  3s
     Click DMS Element  ${DEVICE_FILE_TYPE_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${SELECT_NETCONF_MOUNT_FILE}
     BuiltIn.Sleep  7s
     Click DMS Element  ${FOLDER_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${UPLOAD_OK_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${IMPORT_BUTTON}

Select and import entity mapping file
     BuiltIn.Sleep  3s
     Click DMS Element  ${DEVICE_FILE_TYPE_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${SELECT_ENTITY_MAPPING_FILE}
     BuiltIn.Sleep  7s
     Click DMS Element  ${FOLDER_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${UPLOAD_OK_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${IMPORT_BUTTON}

Select and import Service Setting file
     BuiltIn.Sleep  3s
     Click DMS Element  ${DEVICE_FILE_TYPE_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${SELECT_SERVICE_SETTING_FILE}
     BuiltIn.Sleep  7s
     Click DMS Element  ${FOLDER_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${UPLOAD_OK_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${IMPORT_BUTTON}


Select and import Factory file
    BuiltIn.Sleep  3s
     Click DMS Element  ${DEVICE_FILE_TYPE_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${SELECT_FACTORY_FILE}
     BuiltIn.Sleep  7s
     Click DMS Element  ${FOLDER_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${UPLOAD_OK_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${IMPORT_BUTTON}

Open Operation History
    BuiltIn.Sleep  10s
    click dms element    ${OPERTION_HISTORY_BUTTON}
    BuiltIn.Sleep  5s

Search Operation Type in History
    [Arguments]  ${optype}
    BuiltIn.Sleep  7s
	Scroll Element Into View    ${XPATH_OH_OPERATION_TYPE}
    Click DMS Element  ${XPATH_OH_OPERATION_TYPE}
    BuiltIn.Sleep  7s
    Clear Element Text  ${XPATH_OH_OPERATION_TYPE}
    BuiltIn.Sleep  5s
    #Input Text  ${XPATH_OH_OPERATION_TYPE}  Netconf Mount
    Input Text  ${XPATH_OH_OPERATION_TYPE}  ${optype}
    BuiltIn.Sleep  5s
	Scroll Element Into View    ${ID_OH_APPLY_BUTTON}
    Click DMS Element  ${ID_OH_APPLY_BUTTON}
    BuiltIn.Sleep  5s

Verify Operation History values
    ${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    Log     ${Operation_name}
    ${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    Log     ${Operation_type}
     ${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    Log     ${Operation_status}
    Should Contain    ${Operation_name}      	ServiceSetting_ONECELL_5.5_Automation.xml
    Should Contain    ${Operation_type}      	SERVICE_SETTINGS
    Should Contain    ${Operation_status}      Success


Verify Operation History factory import values
    ${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    Log     ${Operation_name}
    ${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    Log     ${Operation_type}
     ${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    Log     ${Operation_status}
    Should Contain    ${Operation_name}      	GEDF_factory_NW.xml
    Should Contain    ${Operation_type}      	FACTORY
    Should Contain    ${Operation_status}       Success


Verify Operation History values for CUCP Service Setting import
    #Wait Until Keyword Succeeds  ${BROWSER_ELEMENT_TIMEOUT}  2 sec  Check If Element Is Clickable  DC_Search_Button

    ${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    Log     ${Operation_name}
    BuiltIn.Sleep  5s
    ${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    Log     ${Operation_type}
    BuiltIn.Sleep  5s
    ${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    Log     ${Operation_status}

    Should Contain    ${Operation_name}      	ServiceSetting_ONECELL5GCU_CP_NC_Automation.xml
    Should Contain    ${Operation_type}      	SERVICE_SETTINGS
    Should Contain    ${Operation_status}      Success

Verify Operation History values for CUUP Service Setting import
    #Wait Until Keyword Succeeds  ${BROWSER_ELEMENT_TIMEOUT}  2 sec  Check If Element Is Clickable  DC_Search_Button
    ${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    Log     ${Operation_name}
    BuiltIn.Sleep  5s
    ${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    Log     ${Operation_type}
    BuiltIn.Sleep  5s
    ${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    Log     ${Operation_status}

    Should Contain    ${Operation_name}      	ServiceSetting_ONECELL5GCU_UP_NC_Automation.xml
    Should Contain    ${Operation_type}      	SERVICE_SETTINGS
    Should Contain    ${Operation_status}      Success

Verify Operation History values for DU Service Setting import
    #Wait Until Keyword Succeeds  ${BROWSER_ELEMENT_TIMEOUT}  2 sec  Check If Element Is Clickable  DC_Search_Button
    ${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    Log     ${Operation_name}
    BuiltIn.Sleep  5s
    ${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    Log     ${Operation_type}
    BuiltIn.Sleep  5s
    ${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    Log     ${Operation_status}

    Should Contain    ${Operation_name}      	ServiceSetting_ONECELL5GDU_NC_Automation.xml
    Should Contain    ${Operation_type}      	SERVICE_SETTINGS
    Should Contain    ${Operation_status}      Success

Select advance option1
    BuiltIn.Sleep  2s
    Maximize Browser Window
    BuiltIn.Sleep  5s
    Scroll Element Into View    ${SHOW_ADVANCE_OPTION}
    BuiltIn.Sleep  5s
    click dms element    ${SHOW_ADVANCE_OPTION}
    BuiltIn.Sleep  5s
    Input Text  ${PRO_ASSOCIATION_INPUT}  ${Profile_Name}
    BuiltIn.Sleep  5s
    click dms element    ${APPLY_FILTER}
    BuiltIn.Sleep  10s
    click dms element    ${SELECT_CHECKBOX}
    BuiltIn.Sleep  10s
    click dms element    ${ADD_BUTTON}
    BuiltIn.Sleep  10s
    click dms element    ${SAVE_BUTTON}
    BuiltIn.Sleep  10s

	
Verify Operation History values for Netconf Mount import
    #Wait Until Keyword Succeeds  ${BROWSER_ELEMENT_TIMEOUT}  2 sec  Check If Element Is Clickable  DC_Search_Button
    [Arguments]  ${netconfmount_name}
    ${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    Log     ${Operation_name}
    BuiltIn.Sleep  5s
    ${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    Log     ${Operation_type}
    BuiltIn.Sleep  5s
    ${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    Log     ${Operation_status}

    Should Contain    ${Operation_name}      	${netconfmount_name}
    Should Contain    ${Operation_type}      	Netconf Mount
    Should Contain    ${Operation_status}      Success

Verify Operation History values for Entity Mapping import
    #Wait Until Keyword Succeeds  ${BROWSER_ELEMENT_TIMEOUT}  2 sec  Check If Element Is Clickable  DC_Search_Button

    ${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    Log     ${Operation_name}
    BuiltIn.Sleep  5s
    ${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    Log     ${Operation_type}
    BuiltIn.Sleep  5s
    ${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    Log     ${Operation_status}

    Should Contain    ${Operation_name}      	ATT-drop2-device-entity.xml
    Should Contain    ${Operation_type}      	Entity Mapping
    Should Contain    ${Operation_status}       Success

Verify Operation History values for Entity Mapping import with all device
    #Wait Until Keyword Succeeds  ${BROWSER_ELEMENT_TIMEOUT}  2 sec  Check If Element Is Clickable  DC_Search_Button
    [Arguments]  ${device-entity_name}
    ${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    Log     ${Operation_name}
    BuiltIn.Sleep  5s
    ${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    Log     ${Operation_type}
    BuiltIn.Sleep  5s
    ${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    Log     ${Operation_status}

    Should Contain    ${Operation_type}      	Entity Mapping
    Should Contain    ${Operation_status}      Success
    #Should Contain    ${Operation_name}      	Automation-ipsec2-device-entity.xml

Verify Operation History values for Unmanaged Netconf Mount import
    #Wait Until Keyword Succeeds  ${BROWSER_ELEMENT_TIMEOUT}  2 sec  Check If Element Is Clickable  DC_Search_Button

    ${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    Log     ${Operation_name}
    BuiltIn.Sleep  5s
    ${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    Log     ${Operation_type}
    BuiltIn.Sleep  5s
    ${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    Log     ${Operation_status}

    Should Contain    ${Operation_name}      	Netconf_VNF_Unmanaged.xml
    Should Contain    ${Operation_type}      	Netconf Mount
    Should Contain    ${Operation_status}      Success
	

#Delete Existing Profile
#    BuiltIn.Sleep  10s
    #Scroll Element Into View    ${SELECT_CHECKBOX}
    #BuiltIn.Sleep  5s
    #click dms element    ${SELECT_CHECKBOX}
    #BuiltIn.Sleep  5s
#    click dms element    ${XPATH_DELETE_CHECKBOX}
#    BuiltIn.Sleep  10s
#    click dms element    ${XPATH_DELETE_BUTTON}

#Associate New one
#   BuiltIn.Sleep  5s
#   click dms element    ${XPATH_ADD_BUTTON}
#   BuiltIn.Sleep  5s
#   click dms element    ${XPATH_PROFILE_ASSOCIATIOn_BUTTON_CLICK}
#   BuiltIn.Sleep  5s
   #click dms element    ${XPATH_CHOOSE_FILE}
   #BuiltIn.Sleep  5s
#   Wait Until Page Contains Element   ${UploadFiletest}   60s
#   Scroll Element Into View     ${UploadFiletest}
#   Choose File     ${UploadFiletest}     ${AddFile}
#   BuiltIn.Sleep  5s
#   Click DMS Element    ${XPATH_CLICK_OK_BUTTON}


#Save Service Setting Parameter
#    [Documentation]  Save DMS overridden parameters
#    BuiltIn.Sleep   2s
#    Set Focus To Element  ${XPATH_ORP_PARAM_SAVE_BUTTON}
#    BuiltIn.Sleep   3s
#    ${bool}=  Run Keyword And Return Status  Check If Element Is Clickable  ${XPATH_ORP_PARAM_SAVE_BUTTON}
#    BuiltIn.Sleep   3s
#    Run Keyword If  ${bool}  Click DMS Element  ${XPATH_ORP_PARAM_SAVE_BUTTON}
#    BuiltIn.Sleep   5s
    #Run Keyword If  ${bool}  Click DMS Element  ${XPATH_ORP_SAVE_NOTIFICATION_POPUP}
    #BuiltIn.Sleep   3s

Verify Operation History values for Service Setting import from so_tool
#Wait Until Keyword Succeeds  ${BROWSER_ELEMENT_TIMEOUT}  2 sec  Check If Element Is Clickable  DC_Search_Button
    [Arguments]    ${ServiceSetting_name}
    ${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    Log     ${Operation_name}
    BuiltIn.Sleep  5s
    ${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    Log     ${Operation_type}
    BuiltIn.Sleep  5s
    ${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    Log     ${Operation_status}

    Should Contain    ${Operation_name}      	${ServiceSetting_name}
    Should Contain    ${Operation_type}      	SERVICE_SETTINGS
    Should Contain    ${Operation_status}       Success

Get First Session Establishment Time
    ${value}        Get Text     ${XPATH_FIRST_ESTABLISHMENT_VALUE}
    Log             ${value}
    Should Contain    ${value}    NA

Get Last Session Establishment Time
    ${value}        Get Text     ${XPATH_LAST_ESTABLISHMENT_VALUE}
    Log             ${value}
    Should Contain    ${value}    NA

Get HeartBeat Status
    ${value}        Get Text     ${XPATH_HEARTBEAT_STATUS}
    Log             ${value}
    Should Contain    ${value}    Unmanaged

Get VNF Managed State
    [Arguments]     ${managed_state}
    ${value}        Get Text     ${XPATH_VNF_MANAGED_STATE}
    Log             ${value}
    Should Contain    ${value}    ${managed_state}

Device History VNF Details
    Click DMS Element    ${XPATH_DEVICE_HISTORY_DETAILS}
    BuiltIn.Sleep   4s
    ${value}        Get Text     ${XPATH_DH_DETAILS_TEXT}
    Log             ${value}
    Should Contain    ${value}    ${UNMANAGED_REASON}

Device History DU Details
    Click DMS Element    ${XPATH_DEVICE_HISTORY_DETAILS}
    BuiltIn.Sleep   4s
    ${value}        Get Text     ${XPATH_DU_DH_DETAILS}
    Log             ${value}
    Should Contain    ${value}    ${UNMANAGED_REASON}

Verify Operation History values for Netconf Mount auto import

    [Arguments]  ${helper_import_filename}
    ${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    Log     ${Operation_name}
    BuiltIn.Sleep  5s
    ${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    Log     ${Operation_type}
    BuiltIn.Sleep  5s
    ${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    Log     ${Operation_status}

    Should Contain    ${Operation_name}      	${helper_import_filename}
    Should Contain    ${Operation_type}      	Netconf Mount
    Should Contain    ${Operation_status}      Success


Open Schedule Import Page
    go to   ${DMS_FILE_IMPORT_URL1}
    BuiltIn.Sleep  2s
    Maximize Browser Window
    BuiltIn.Sleep  5s

Edit Schedule Time
    #click dms element     ${EDIT_SCHEDULE_TIME}
    ${Current Time}=    GET Value     ${EDIT_SCHEDULE_TIME}
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
    ${new_value}=    Evaluate   int('${post}') + 5
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
    Clear Element Text     ${EDIT_SCHEDULE_TIME}
    BuiltIn.Sleep  5s
    Input DMS Text      ${EDIT_SCHEDULE_TIME}      ${new date}
    BuiltIn.Sleep  5s

Schedule ODF Import
    Scroll Element Into View    ${ODF_IMPORT_EDIT_BUTTON}
    BuiltIn.Sleep  5s
    click dms element    ${ODF_IMPORT_EDIT_BUTTON}
    BuiltIn.Sleep  5s
    Edit Schedule Time
    BuiltIn.Sleep  30s

Schedule Factory Import
    Scroll Element Into View    ${Factory_IMPORT_EDIT_BUTTON}
    BuiltIn.Sleep  5s
    click dms element    ${Factory_IMPORT_EDIT_BUTTON}
    BuiltIn.Sleep  5s
    Edit Schedule Time
    BuiltIn.Sleep  30s
    click dms element      ${SCHEDULE_IMPORT_SAVE_BUTTON}
    BuiltIn.Sleep  50s

Verify Operation History Schedule factory import values
    ${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    Log     ${Operation_name}
    ${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    Log     ${Operation_type}
     ${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    Log     ${Operation_status}
    Should Contain    ${Operation_name}      	GEDF_factory_v55.xml
    Should Contain    ${Operation_type}      	FACTORY
    Should Contain    ${Operation_status}       Success

Select and import Gold Standard Value file
    BuiltIn.Sleep  3s
     Click DMS Element  ${DEVICE_FILE_TYPE_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${SELECT_GSV_FILE}
     BuiltIn.Sleep  7s
     Click DMS Element  ${FOLDER_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${UPLOAD_OK_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${IMPORT_BUTTON}

Verify Operation History GSV Import values
    ${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    Log     ${Operation_name}
    ${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    Log     ${Operation_type}
     ${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    Log     ${Operation_status}
    Should Contain    ${Operation_name}      	GoldStandardValue.xml
    Should Contain    ${Operation_type}      	GOLD_STANDARD
    Should Contain    ${Operation_status}       Success

Select and import OmKPi file
    BuiltIn.Sleep  3s
     Click DMS Element  ${DEVICE_FILE_TYPE_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${SELECT_OmKPi_FILE}
     BuiltIn.Sleep  7s
     Click DMS Element  ${FOLDER_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${UPLOAD_OK_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${IMPORT_BUTTON}

Verify Operation History OmKPi File
    ${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    Log     ${Operation_name}
    ${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    Log     ${Operation_type}
     ${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    Log     ${Operation_status}
    Should Contain    ${Operation_name}      	0005B9-LTE_Enterprise_C-RANSC_Cntrl_sectorkpi.csv
    Should Contain    ${Operation_type}      	OM_KPI
    Should Contain    ${Operation_status}       Success


Schedule Entity Mapping Import
    Scroll Element Into View    ${XPATH_EDIT_ENTITY_MAPPING}
    BuiltIn.Sleep  5s
    click dms element    ${XPATH_EDIT_ENTITY_MAPPING}
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${EDIT_SCHEDULE_TIME}
    BuiltIn.Sleep  2s
    Schedule Import Edit Calender Time



Schedule Import Edit Calender Time
    ${Current Time}=    GET Value     ${EDIT_SCHEDULE_TIME}
    Log    ${Current Time}
    ${split value}     Split String   ${Current Time}
    Log     ${split value}
    Log     ${split value}[0]
    Log     ${split value}[1]
    Log     ${split value}[2]
    ${pre}    ${post} =  Split String   ${split value}[1]  :  1
    Log     ${pre}
    Log     ${post}
    Log     int(${post})
    #${pre}    set variable    08
    #${post}    set variable    04
    ${new_value}=    Evaluate   int('${post}') + 2
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
    Clear Element Text     ${EDIT_SCHEDULE_TIME}
    BuiltIn.Sleep  5s
    Input DMS Text      ${EDIT_SCHEDULE_TIME}      ${new date}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_CLICK}
    BuiltIn.Sleep  5s
    Scroll Element Into View    ${XPATH_SCHEDULE_SAVE_BUTTON}
    BuiltIn.Sleep  5s
    Press Keys    ${XPATH_SCHEDULE_SAVE_BUTTON}  ENTER
    #click dms element      ${XPATH_SAVE_BUTTON}
    BuiltIn.Sleep  60s

Verify Operation History Schedule Entity import values
    BuiltIn.Sleep  90s
    ${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    Log     ${Operation_name}
    ${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    Log     ${Operation_type}
     ${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    Log     ${Operation_status}
    Should Contain    ${Operation_name}      	Automation-alarmtest-device-auto-entity.xml
    Should Contain    ${Operation_type}      	Entity Mapping
    Should Contain    ${Operation_status}       Success

Schedule 6.0 ONECELL SS Import
    Scroll Element Into View    ${XPATH_ODF_EDIT_BUTTON}
    BuiltIn.Sleep  5s
    click dms element    ${XPATH_ODF_EDIT_BUTTON}
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${EDIT_SCHEDULE_TIME}
    BuiltIn.Sleep  2s
    Schedule Import Edit Calender Time


Verify Operation History Schedule 6.0 Service Setting values
    BuiltIn.Sleep  30s
    Input DMS Text      ${XPATH_OPERATION_HISTORY_RESOURCE}    ServiceSetting_ONECELL_AutoImport_6.0.xml
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_APPLY_FILTER_RESOURCE}
    BuiltIn.Sleep  3s
    ${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    Log     ${Operation_name}
    ${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    Log     ${Operation_type}
     ${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    Log     ${Operation_status}
    Should Contain    ${Operation_name}      	ServiceSetting_ONECELL_AutoImport_6.0.xml
    Should Contain    ${Operation_type}      	SERVICE_SETTINGS
    Should Contain    ${Operation_status}       Success


Verify Operation History for NW Factory File Import
    ${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    Log     ${Operation_name}
    ${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    Log     ${Operation_type}
    ${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    Log     ${Operation_status}
    Should Contain    ${Operation_name}      	GEDF_factory_BC_NW.xml
    Should Contain    ${Operation_type}      	FACTORY
    Should Contain    ${Operation_status}       Success

Verify Operation History for 5G GSV File Import
    ${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    Log     ${Operation_name}
    ${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    Log     ${Operation_type}
    ${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    Log     ${Operation_status}
    ${Operation_method}  Get DMS Element Text    ${OPERTION_HISTORY_METHOD}
    Log     ${Operation_method}
    Should Contain    ${Operation_name}      	Automation_Venue-Venue.txt
    Should Contain    ${Operation_type}      	GOLD_STANDARD
    Should Contain    ${Operation_status}       Success
    Should Contain    ${Operation_method}       GOLDSTANDARD

Verify Device State in Dashboard
    ${Device_state}  Get DMS Element Text    ${XPATH_DEVICE_STATE}
    Log     ${Device_state}
    Should Contain    ${Device_state}      	Ready

Schedule Gold Standard Value Import
    Scroll Element Into View    ${GSV_IMPORT_EDIT_BUTTON}
    BuiltIn.Sleep  5s
    click dms element    ${GSV_IMPORT_EDIT_BUTTON}
    BuiltIn.Sleep  5s
    ${Current Time}=    GET Value     ${EDIT_SCHEDULE_TIME}
    Log    ${Current Time}
    ${split value}     Split String   ${Current Time}
    Log     ${split value}
    Log     ${split value}[0]
    Log     ${split value}[1]
    Log     ${split value}[2]
    ${pre}	${post} =	Split String	${split value}[1]	:	1
    Log     ${pre}
    Log     ${post}
    ${new value}=    Evaluate   int(${post}) + 2
    Log    ${new value}
    ${new date}=     Catenate     ${split value}[0]  ${pre}:${new value}  ${split value}[2]
    Log     ${new date}
    BuiltIn.Sleep  5s
    Clear Element Text     ${EDIT_SCHEDULE_TIME}
    BuiltIn.Sleep  5s
    Input DMS Text      ${EDIT_SCHEDULE_TIME}      ${new date}
    BuiltIn.Sleep  30s
    click dms element      ${SCHEDULE_IMPORT_SAVE_BUTTON}