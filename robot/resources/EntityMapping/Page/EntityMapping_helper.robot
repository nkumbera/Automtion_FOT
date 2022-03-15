*** Settings ***

#Library             String
#Variables           Import_ui_controls.py
Variables           EntityMapping_ui_controls.py
Variables           ../testdata/EntityMapping_testdata.py

*** Variables ***
${UploadFiletest}           css=[type='file']
${AddFile}          ${ENTITYMAPPING_FILE_LOCATION}


*** Keywords ***

Select and import Entity Mapping file
     BuiltIn.Sleep  3s
     Click DMS Element  ${DEVICE_FILE_TYPE_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${SELECT_ENTITYMAPPING_FILE}
     BuiltIn.Sleep  7s
     Click DMS Element  ${FOLDER_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${UPLOAD_OK_BUTTON}
     BuiltIn.Sleep  7s
     Click DMS Element  ${IMPORT_BUTTON}


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

    Should Contain    ${Operation_type}      	Entity Mapping
    Should Contain    ${Operation_status}      Success
    #Should Contain    ${Operation_name}      	Marriott_Connecticut_Automation.zip

Click Delta Param Entity Mapping
   Click DMS Element  ${XPATH_DELTA_PARAM_ICON_BUTTON}
   BuiltIn.Sleep   3s

Search X2C Delta Parameter in Provisioning Page
    [Documentation]     Search Delta Parameter in Provisioning Page
    [Arguments]     ${section}
    #Wait Until Keyword Succeeds  ${BROWSER_ELEMENT_TIMEOUT}  2 sec  Check If Element Is Clickable  DC_Search_Button
    BuiltIn.Sleep  7s
    Click DMS Element  ${XPATH_DELTA_SEARCH_INPUT}
    BuiltIn.Sleep  7s
    Clear Element Text  ${XPATH_DELTA_SEARCH_INPUT}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_DELTA_SEARCH_INPUT}  ${section}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_PROVISIONING_APPLY_BUTTON}
    BuiltIn.Sleep  5s

X2C Delta Provisioning Page
    #Click DMS Element  ${XPATH_DELTA_PARAM}
    ${value}=     get text    ${XPATH_PROVISIONING_X2C_NAME}
    #convert to string    ${DownlinkBandwidth1}
    #Convert To Integer    ${value}
    Log    ${value}
    Should Be Equal  ${value}    IP Address
    BuiltIn.Sleep   2s
X2C Delete Delta Provisioning Page
    ${value}=     get text    ${XPATH_PROVISIONING_X2C_NAME}
    #convert to string    ${DownlinkBandwidth1}
    #Convert To Integer    ${value}
    Log    ${value}
    Should Be Equal  ${value}    X2 C
    BuiltIn.Sleep   2s

Click CUUP device from Topology
    Click DMS Element  ${XPATH_CUUP_TOPOLOGY_LINK}
    BuiltIn.Sleep   30s
    ${cuup_summary_value}=     get text    ${XPATH_SUMMARY_VALUE}
    #convert to string    ${DownlinkBandwidth1}
    #Convert To Integer    ${value}
    Log    ${cuup_summary_value}
    Should Be Equal  ${cuup_summary_value}    0005B9-CS_ONECELL_CU-UP-ipsec2-2051cuup1 (OUI-PC-VNFID)
    BuiltIn.Sleep   5s

Click DU device from Topology
    Click DMS Element  ${XPATH_DU_TOPOLOGY_LINK}
    BuiltIn.Sleep   30s
    ${du_summary_value}=     get text    ${XPATH_SUMMARY_VALUE}
    #convert to string    ${DownlinkBandwidth1}
    #Convert To Integer    ${value}
    Log    ${du_summary_value}
    Should Be Equal  ${du_summary_value}    0005B9-CS_ONECELL_DU-ipsec2-2051du1 (OUI-PC-VNFID)
    BuiltIn.Sleep   5s
Click CUCP device from Topology
    Click DMS Element  ${XPATH_CUCP_TOPOLOGY_LINK}
    BuiltIn.Sleep   30s
    ${cucp_summary_value}=     get text    ${XPATH_SUMMARY_VALUE}
    #convert to string    ${DownlinkBandwidth1}
    #Convert To Integer    ${value}
    Log    ${cucp_summary_value}
    Should Be Equal  ${cucp_summary_value}    0005B9-CS_ONECELL_CU-CP-ipsec2-2051cucp1 (OUI-PC-VNFID)
    BuiltIn.Sleep   5s

Click RP device from Topology
    Click DMS Element  ${XPATH_RP_TOPOLOGY_LINK}
    BuiltIn.Sleep   30s
    ${rp_summary_value}=     get text    ${XPATH_RP_SUMMARY_VALUE}
    #convert to string    ${DownlinkBandwidth1}
    #Convert To Integer    ${value}
    Log    ${rp_summary_value}
    Should Be Equal  ${rp_summary_value}    - 0005B9-CS_ONECELL_DU-ipsec2-2051du1 (OUI-PC-VNFID)
    BuiltIn.Sleep   5s