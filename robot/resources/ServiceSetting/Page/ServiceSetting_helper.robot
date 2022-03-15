*** Settings ***
#Library             String
Variables           ServiceSetting_ui_controls.py
Variables           ../testdata/ServiceSetting_testdata.py


*** Variables ***
${UploadFiletest}           css=[type='file']
${AddFile_profile}          ${EXECDIR}${SETTINGS_FILE_LOCATION_profile}
${4.5_SS_File}              ${EXECDIR}${SS_File_Location}
${RDC_SS_File}              ${EXECDIR}\\robot\\properties\\File_For_Import\\ServiceSetting_ONECELL_RDC.xml


*** Keywords ***
Open File Import Page1
    go to   ${DMS_FILE_IMPORT_URL}
    Wait Until Page Contains Element  ${DEVICE_FILE_IMPORT}  timeout=${BROWSER_ELEMENT_TIMEOUT}

Select and import file1
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

#Open Operation History
#    BuiltIn.Sleep  10s
#    click dms element    ${Operation_history_button}
#    BuiltIn.Sleep  5s

Verify Operation History values1
    ${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    Log     ${Operation_name}
    ${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    Log     ${Operation_type}
     ${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    Log     ${Operation_status}
    Should Contain    ${Operation_name}      	ServiceSetting_ONECELL_5.5_Automation.xml
    Should Contain    ${Operation_type}      	SERVICE_SETTINGS
    Should Contain    ${Operation_status}      Success


Verify Operation History values2
    ${Operation_name}    Get DMS Element Text    ${OPERTION_HISTORY_RESOURCE_NAME}
    Log     ${Operation_name}
    ${Operation_type}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_TYPE}
    Log     ${Operation_type}
     ${Operation_status}  Get DMS Element Text    ${OPERTION_HISTORY_OPERATION_STATUS}
    Log     ${Operation_status}
    Should Contain    ${Operation_name}         ServiceSetting_ONECELL_5.5_MinMand.xml
    Should Contain    ${Operation_type}      	SERVICE_SETTINGS
    Should Contain    ${Operation_status}      Success


Select advance option
    BuiltIn.Sleep  2s
    Maximize Browser Window
    BuiltIn.Sleep  5s
    Scroll Element Into View    ${SHOW_ADVANCE_OPTION}
    BuiltIn.Sleep  5s
    click dms element    ${SHOW_ADVANCE_OPTION}
    BuiltIn.Sleep  5s
    Input Text  ${PROFILE_ASSOCIATION_INPUT}  ${Profile_Name}
    BuiltIn.Sleep  5s
    click dms element    ${APPLY_FILTER}
    BuiltIn.Sleep  10s
    click dms element    ${SELECT_CHECKBOX_profile}
    BuiltIn.Sleep  10s
    click dms element    ${ADD_BUTTON}
    BuiltIn.Sleep  10s
    click dms element    ${SAVE_BUTTON}
    BuiltIn.Sleep  10s


Delete Existing Profile
    BuiltIn.Sleep  10s
    #Scroll Element Into View    ${SELECT_CHECKBOX}
    #BuiltIn.Sleep  5s
    #click dms element    ${SELECT_CHECKBOX}
    #BuiltIn.Sleep  5s
    click dms element    ${XPATH_DELETE_CHECKBOX}
    BuiltIn.Sleep  10s
    click dms element    ${XPATH_Profile_DELETE_BUTTON}

New Profile Associate
   BuiltIn.Sleep  5s
   click dms element    ${XPATH_ADD_BUTTON}
   BuiltIn.Sleep  5s
   click dms element    ${XPATH_PROFILE_ASSOCIATIOn_BUTTON_CLICK}
   BuiltIn.Sleep  5s
   #click dms element    ${XPATH_CHOOSE_FILE}
   #BuiltIn.Sleep  5s
   Wait Until Page Contains Element   ${UploadFiletest}   60s
   Scroll Element Into View     ${UploadFiletest}
   Choose File     ${UploadFiletest}     ${AddFile_profile}
   BuiltIn.Sleep  5s
   Click DMS Element    ${XPATH_CLICK_OK_BUTTON}


Save Service Setting Parameter
    [Documentation]  Save DMS overridden parameters
    BuiltIn.Sleep   5s
    Set Focus To Element  ${XPATH_ORP_PARAM_SAVE_BUTTON}
    BuiltIn.Sleep   5s
    ${bool}=  Run Keyword And Return Status  Check If Element Is Clickable  ${XPATH_ORP_PARAM_SAVE_BUTTON}
    BuiltIn.Sleep   5s
    Run Keyword If  ${bool}  Click DMS Element  ${XPATH_ORP_PARAM_SAVE_BUTTON}
    BuiltIn.Sleep   10s
    #Run Keyword If  ${bool}  Click DMS Element  ${XPATH_ORP_SAVE_NOTIFICATION_POPUP}
    #BuiltIn.Sleep   3s

Associate New one
   [arguments]    ${File_for_upload}
   BuiltIn.Sleep  5s
   click dms element    ${XPATH_ADD_BUTTON}
   BuiltIn.Sleep  5s
   click dms element    ${XPATH_PROFILE_ASSOCIATIOn_BUTTON_CLICK}
   BuiltIn.Sleep  5s
   #click dms element    ${XPATH_CHOOSE_FILE}
   #BuiltIn.Sleep  5s
   Wait Until Page Contains Element   ${UploadFiletest}   60s
   Scroll Element Into View     ${UploadFiletest}
   Choose File    ${UploadFiletest}     ${File_for_upload}
   BuiltIn.Sleep  5s
   Click DMS Element    ${XPATH_CLICK_OK_BUTTON}

Verify Profile Associated
   ${profile_value}    get Text    ${XPATH_Profile_value}
   Log    ${profile_value}

New Profile Associate1
   BuiltIn.Sleep  5s
   click dms element    ${XPATH_ADD_BUTTON}
   BuiltIn.Sleep  5s
   click dms element    ${XPATH_PROFILE_ASSOCIATIOn_BUTTON_CLICK}
   BuiltIn.Sleep  5s
   #click dms element    ${XPATH_CHOOSE_FILE}
   #BuiltIn.Sleep  5s
   Wait Until Page Contains Element   ${UploadFiletest}   60s
   Scroll Element Into View     ${UploadFiletest}
   Choose File     ${UploadFiletest}    ${4.5_SS_File}

Delete Existing Profile RDC
    BuiltIn.Sleep  10s

    FOR  ${Index}  IN RANGE  1  4
       Log  ${Index}
       ${a}=    Set Variable   //*[@id='DC_ProfileAssociation_Table']//tr[
       ${b}=    Set Variable   ${Index}
       ${c}=    Set Variable   ]//input[@type='text']
       ${XPATH_RDC}=    Set Variable    ${a}${b}${c}
       ${item_present}=  Run Keyword And Return Status  Element Should Be Visible  ${XPATH_RDC}

       IF  ${item_present}==True
         ${Response}=  Get Element Attribute  ${XPATH_RDC}    attribute=value
          IF  "${Response}"=="RDC"
          ${XPATH_CHECKBOX}=    Set Variable    ${a}${b}]//td[1]//span
          ${XPATH_DELETE_BUTTON}=   Set Variable    ${a}${b}]//td//div[contains(@id,'DC_Action_Delete_Button')]
          click dms element    ${XPATH_CHECKBOX}
          BuiltIn.Sleep  10s
          click dms element    ${XPATH_DELETE_BUTTON}
          BuiltIn.Sleep  5s
          click dms element    ${SAVE_BUTTON}
          BuiltIn.Sleep  20s
          END
       ELSE
         Exit For Loop If    ${item_present}==False
       END
    END

New Profile Associate for RDC
   BuiltIn.Sleep  5s
   click dms element    ${XPATH_ADD_BUTTON}
   BuiltIn.Sleep  5s
   click dms element    ${XPATH_PROFILE_ASSOCIATIOn_BUTTON_CLICK}
   BuiltIn.Sleep  5s
   Wait Until Page Contains Element   ${UploadFiletest}   60s
   Scroll Element Into View     ${UploadFiletest}
   Choose File     ${UploadFiletest}     ${RDC_SS_File}
   BuiltIn.Sleep  5s
   Click DMS Element    ${XPATH_CLICK_OK_BUTTON}
   BuiltIn.Sleep  20s
   click dms element    ${SAVE_BUTTON}
   BuiltIn.Sleep  20s