*** Settings ***
Resource  page/provisioning_helper.robot
Library             pyautogui
Resource            ../common/ui_common.robot
Resource            page/provisioning_helper.robot
Resource            ../resources/dashboard_6.0/dashboard_keywords.robot
Resource            ../dashboard/page/dashboard_page_helper.robot
Resource            page/pnp_page_helper.robot
#Resource            ../ServiceSetting/ServiceSetting_keywords.robot
Resource            ../Import/Import_keywords.robot
Variables            testdata/provisioning_testdata.py

Library             SSHLibrary
Library             String


*** Variables ***


*** Keywords ***
Verify Provisioning page Navigation
    Dashboard Device Provisioning page Summary Status

Verify Provisioning Status
   [Documentation]  Verify Provisioning Status
   [arguments]   ${Downlink_CA_Enable}  ${downlink_ca_enable}
   Open Provisioning Status
   Verify Name AND Value  ${Downlink_CA_Enable}  ${downlink_ca_enable}

Verify Delta Provisioning Status
    [Documentation]  Verify Delta Provisioning Status
    Open Provisioning Status
    Verify Generation Of Delta

Verify PnP Provisioning Status
    [Documentation]  Click and Check Provisioning Status
    [ARGUMENTS]    ${XPATH_PNP_BOX_CLICK}    ${XPATH_PNP_BOX_STATUS}
    Open gNB Device PNP Page
    #Open Device PnP page
    Click Provisioning PnP page box    ${XPATH_PNP_BOX_CLICK}
    Verify Provisioning PnP page box status    ${XPATH_PNP_BOX_STATUS}

Verify gNB PnP Provisioning Status
    [Documentation]  Click and Check Provisioning Status
    [ARGUMENTS]    ${XPATH_PNP_BOX_CLICK}    ${XPATH_PNP_BOX_STATUS}
    Open gNB Device PnP page
    Click Provisioning PnP page box    ${XPATH_PNP_BOX_CLICK}
    Verify Provisioning PnP page box status    ${XPATH_PNP_BOX_STATUS}

Service Setting File import for CUCP CUUP DU
    [Documentation]  Check Service Setting File import
    [ARGUMENTS]    ${SSETTINGS_FILE_CUCP_CUUP_DU}
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    put file        ${SSETTINGS_FILE_CUCP_CUUP_DU}    ${SS_FILE_IMPORT_PATH}
    DMS Network Console UI Login
    Import Service Setting file
    #Verify Operation History for DU Service Setting import  SERVICE_SETTINGS
    DMS Network Console UI Logout



Test GUI Override DU Cell 1 Save
    [Documentation]  GUI Override DU Cell 1 Save
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_TEMP_DMS_DC_OVERRIDDEN_PAGE}
    BuiltIn.Sleep  8s
	Scroll Element Into View    ${ID_TEMP_SEARCH_INPUT}
	BuiltIn.Sleep  3s
    Click DMS Element    ${ID_TEMP_SEARCH_INPUT}
    BuiltIn.Sleep  2s
    Clear Element Text    ${ID_TEMP_SEARCH_INPUT}
    BuiltIn.Sleep  2s
    Input Text    ${ID_TEMP_SEARCH_INPUT}  Cell Local ID
    BuiltIn.Sleep  2s
	Scroll Element Into View    ${ID_TEMP_SEARCH_BUTTON}
	BuiltIn.Sleep  3s
    Click DMS Element    ${ID_TEMP_SEARCH_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element    ${XPATH_TEMP_DMS_DC_CUUP_OVERRIDDEN_PAGE_CELL1}
    BuiltIn.Sleep  2s
    Click DMS Element    ${XPATH_TEMP_DC_CELLLOCALID}
    BuiltIn.Sleep  2s
    Clear Element Text    ${XPATH_TEMP_DC_CELLLOCALID}
    BuiltIn.Sleep  2s
    Input Text    ${XPATH_TEMP_DC_CELLLOCALID}  13320
    BuiltIn.Sleep  2s
    Click DMS Element    ${XPATH_TEMP_DMS_DC_CUUP_OVERRIDDEN_PAGE_CELL1}
    BuiltIn.Sleep  2s
    Click DMS Element    ${XPATH_TEMP_DC_OVERRIDE_SAVE}
    BuiltIn.Sleep  8s

Test GUI Override DU Cell 1 Delete
    [Documentation]  GUI Override DU Cell 1 Delete
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_TEMP_DMS_DC_OVERRIDDEN_PAGE}
    BuiltIn.Sleep  5s
    Click DMS Element    ${ID_TEMP_SEARCH_INPUT}
    BuiltIn.Sleep  2s
    Clear Element Text    ${ID_TEMP_SEARCH_INPUT}
    BuiltIn.Sleep  2s
    Input Text    ${ID_TEMP_SEARCH_INPUT}  Cell Local ID
    BuiltIn.Sleep  2s
    Click DMS Element    ${ID_TEMP_SEARCH_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element    ${XPATH_TEMP_DMS_DC_CUUP_OVERRIDDEN_PAGE_CELL1}
    BuiltIn.Sleep  2s
    Click DMS Element    ${XPATH_TEMP_DC_OVERRIDE_DELETE}
    BuiltIn.Sleep  2s
    Click DMS Element    ${XPATH_TEMP_DC_OVERRIDE_SAVE}
    BuiltIn.Sleep  2s

Test Reset CU CP
    Verify Device Reset Status
    #Log    Check PnP Box CU-CP Managed Status
    #Verify PnP Provisioning Status    ${XPATH_PNP_CU_CP_Managed_Status}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    #Log    Check PnP Box Get CU-CP Info
    #Verify PnP Provisioning Status    ${XPATH_PNP_Get_CU_CP_Info}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    #Log    Check PnP Box DMS Flag For CU-CP Activation
    #Verify PnP Provisioning Status    ${XPATH_PNP_DMS_Flag_For_CU_CP_Activation}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    #Log    Check PnP Box Validate VNF
    #Verify PnP Provisioning Status    ${XPATH_PNP_Validate_VNF}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    #Log    Check PnP Box Notification Subscription
    #Verify PnP Provisioning Status    ${XPATH_PNP_Notification_Subscription}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    #Log    Check PnP Box Get CU-CP Capability
    #Verify PnP Provisioning Status    ${XPATH_PNP_Get_CU_CP_Capability}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    #Log    Check PnP Box Perform Factory Reset
    #Verify PnP Provisioning Status    ${XPATH_PNP_Perform_Factory_Reset}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    #Log    Check PnP Box Lock Datastore
    #Verify PnP Provisioning Status    ${XPATH_PNP_Perform_Lock_Datastore}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    #Log    Check PnP Box Mark CU-CP Flag Activation
    #Verify PnP Provisioning Status    ${XPATH_PNP_Mark_CU_CP_Flag_Activation}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    #Log    Check PnP Box Pre Processing Policy
    #Verify PnP Provisioning Status    ${XPATH_PNP_Pre_Processing_Policy}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    #Log    Check PnP Box Provision Pre Feature Conf
    #Verify PnP Provisioning Status    ${XPATH_PNP_Provision_Pre_Feature_Conf}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    #Log    Check PnP Box Provision Min Mandatory Conf
    #Verify PnP Provisioning Status    ${XPATH_PNP_Provision_Min_Mandatory_Conf}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    #Log    Check PnP Box Provision Feature Conf
    #Verify PnP Provisioning Status    ${XPATH_PNP_Provision_Feature_Conf}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    #Log    Check PnP Box Post Processing Policy
    #Verify PnP Provisioning Status    ${XPATH_PNP_Post_Processing_Policy}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    #Log    Check PnP Box Copy Config
    #Verify PnP Provisioning Status    ${XPATH_PNP_Copy_Config}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    #Log    Check PnP Box DMS Flag for Activation Status
    #Verify PnP Provisioning Status    ${XPATH_PNP_Set_DMS_Flag_for_Activation_Status}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    #Log    Check PnP Box Unlock Datastore
    #Verify PnP Provisioning Status    ${XPATH_PNP_Unlock_Datastore}    ${XPATH_PNP_PROVISION_TEXT_STATUS}

Test Reset CU UP
    #Verify Device Reset Status
    Verify gNB Device Reset Status
    Log    Check PnP Box CU-CP Managed Status
    Verify PnP Provisioning Status    ${XPATH_PNP_CU_UP_Managed_Status}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box Get CU-CP Info
    Verify PnP Provisioning Status    ${XPATH_PNP_Get_CU_UP_Info}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box DMS Flag For CU-CP Activation
    Verify PnP Provisioning Status    ${XPATH_PNP_DMS_Flag_For_CU_UP_Activation}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box Validate VNF
    Verify PnP Provisioning Status    ${XPATH_PNP_Validate_VNF}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box Notification Subscription
    Verify PnP Provisioning Status    ${XPATH_PNP_Notification_Subscription}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box Get CU-CP Capability
    Verify PnP Provisioning Status    ${XPATH_PNP_Get_CU_UP_Capability}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    #Log    Check PnP Box Perform Factory Reset
    #Verify PnP Provisioning Status    ${XPATH_PNP_Perform_Factory_Reset}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box Lock Datastore
    Verify PnP Provisioning Status    ${XPATH_PNP_Perform_Lock_Datastore}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box Mark CU-CP Flag Activation
    Verify PnP Provisioning Status    ${XPATH_PNP_Mark_CU_UP_Flag_Activation}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box Pre Processing Policy
    Verify PnP Provisioning Status    ${XPATH_PNP_Pre_Processing_Policy}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box Provision Pre Feature Conf
    Verify PnP Provisioning Status    ${XPATH_PNP_Provision_Pre_Feature_Conf}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box Provision Min Mandatory Conf
    Verify PnP Provisioning Status    ${XPATH_PNP_Provision_Min_Mandatory_Conf}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box Provision Feature Conf
    Verify PnP Provisioning Status    ${XPATH_PNP_Provision_Feature_Conf}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box Post Processing Policy
    Verify PnP Provisioning Status    ${XPATH_PNP_Post_Processing_Policy}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box Copy Config
    Verify PnP Provisioning Status    ${XPATH_PNP_Copy_Config}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box DMS Flag for Activation Status
    Verify PnP Provisioning Status    ${XPATH_PNP_DMS_Flag_for_Activation_Status}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box Unlock Datastore
    Verify PnP Provisioning Status    ${XPATH_PNP_Unlock_Datastore}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    BuiltIn.Sleep  2s


Test Reset DU

Test Replan CU CP
    [Documentation]  Click and Check Replan
    BuiltIn.Sleep  5s
    Click DMS Element   ${XPATH_TEMP_REPLAN_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element   ${XPATH_TEMP_REPLAN_OK}
    BuiltIn.Sleep  5s

    Log    Check PnP Box CU-CP Managed Status
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_CU_CP_Managed_Status}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box Check Delta Exist
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_Check_Delta_Exist}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box Get Session Id
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_Get_Session_Id}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box Notification_Subscription
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_Notification_Subscription}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box Perform_Lock_Datastore
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_Perform_Lock_Datastore}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box Provision Delta Pre Feature Conf
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_Provision_Delta_Pre_Feature_Conf}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box Provision Delta Min Mandatory Conf
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_Provision_Delta_Min_Mandatory_Conf}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box Provision Delta Feature Conf
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_Provision_Delta_Feature_Conf}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box Copy_Config
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_Copy_Config}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    Log    Check PnP Box Unlock_Datastore
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_Unlock_Datastore}    ${XPATH_PNP_PROVISION_TEXT_STATUS}


Test Replan CU UP
    [Documentation]  Click and Check Replan
    BuiltIn.Sleep  5s
    Click DMS Element   ${XPATH_TEMP_REPLAN_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element   ${XPATH_TEMP_REPLAN_OK}
    BuiltIn.Sleep  5s

Test Replan DU
    [Documentation]  Click and Check Replan
    BuiltIn.Sleep  5s
    Click DMS Element   ${XPATH_TEMP_REPLAN_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element   ${XPATH_TEMP_REPLAN_OK}
    BuiltIn.Sleep  5s
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_DU_Managed_Status}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    BuiltIn.Sleep  2s
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_Check_Delta_Task}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    BuiltIn.Sleep  2s
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_Get_Session_Id}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    BuiltIn.Sleep  2s
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_Notification_Subscription}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    BuiltIn.Sleep  2s
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_Perform_Lock_Datastore}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    BuiltIn.Sleep  2s
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_Provision_Delta_Pre_Feature_Conf}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    BuiltIn.Sleep  2s
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_Provision_Delta_Min_Mandatory_Conf}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    BuiltIn.Sleep  2s
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_Get_Cell_1_Delta_Conf}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    BuiltIn.Sleep  2s
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_Provision_Cell_1_Delta_Conf}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    BuiltIn.Sleep  2s
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_Provision_Delta_Feature_Conf}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    BuiltIn.Sleep  2s
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_Copy_Config}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    BuiltIn.Sleep  2s
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_Unlock_Datastore}    ${XPATH_PNP_PROVISION_TEXT_STATUS}
    BuiltIn.Sleep  2s

Verify PnP Min Mandatory Provisioning Status
    [Documentation]  Verify PnP Min Mandatory Provisioning Status
    [ARGUMENTS]   ${XPATH_PNP_MIN_MAND_BOX_STATUS}
    Open Device PnP page
    Click Provisioning PnP page box    ${XPATH_MIN_MAND_BOX_CLICK}
    Verify Min Mandatory Provisioning PnP page box status    ${XPATH_PNP_MIN_MAND_BOX_STATUS}

configure VES Params
   [arguments]      ${ves_overridden_dict}
   Open gNB Overridden Params Page    ${DEVICE_gNB_OVERIDDEN_PAGE_DU}
   Update Overridden Parameter    DU Node     VES    scalar    ${ves_overridden_dict}
   Save Overriden Parameter

configure VES Params CU
   [arguments]      ${ves_overridden_dict}
   Open gNB Overridden Params Page    ${DEVICE_gNB_OVERIDDEN_PAGE}
   Update gNB Overriden Parameter    VES    scalar    ${ves_overridden_dict}
   Save Overriden Parameter

Verify gNB Delta Provisioning Status
    [arguments]     ${DMS_URL}
    Open gNB Provisioning Status    ${DMS_URL}
    Verify Generation Of Delta

Verify Delta Provisioning Status in pnp
   [arguments]     ${DMS_URL}
   Open gNB Device PNP Page for delta provisioning    ${DMS_URL}
   verify delta provisioning text

Verify value provisioned
    [arguments]     ${DMS_URL}
    open gNB Provisioning Data    ${DMS_URL}
    Search GNB CP DMS Overriden Parameter     VES
    Verify provisioned value

Verify WhiteList value provisioned
    [arguments]     ${DMS_URL}
    open gNB Provisioning Data    ${DMS_URL}
    Search GNB CP DMS Overriden Parameter     WhiteList
    Verify provisioned WhiteList value

Delete the WhiteList Configured from UI
    Open gNB Overridden Params Page    ${DEVICE_gNB_OVERIDDEN_PAGE_DU}
    Search GNB CP DMS Overriden Parameter     WhiteList
    Delete the configured whitelist
    Save Overriden Parameter

Verify gNB no Delta Provisioning Status
    [arguments]     ${DMS_URL}
    Open gNB Provisioning Status    ${DMS_URL}
    Verify no Delta Generation

Verify 5G VNF Delta Provisioning Status
    [arguments]     ${DMS_URL}
    Open gNB Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE}
    Verify Generation Of Delta