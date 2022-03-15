*** Settings ***
Documentation       DMS Provisioning

#Suite Setup         Device console Login
#Suite Teardown      DMS UI Logout    # Logging off

Resource            ../resources/common/ui_common.robot
Resource            ../resources/dashboard_6.0/dashboard_keywords.robot
Resource            ../resources/pnp/pnp_keywords.robot
Resource            ../resources/provisioning/provisioning_keywords.robot
Resource            ../resources/provisioning/page/provisioning_helper.robot

Library             String
Resource            ../resources/Import/Import_keywords.robot
Resource            ../resources/ServiceSetting/ServiceSetting_keywords.robot
Resource            ../resources/Provisioning/provision_page_keywords.robot
Resource            ../resources/dashboard/dashboard_keywords.robot
Resource            ../resources/Search_Page/Search_Device.robot
Resource            ../resources/NetworkConsole/NetworkConsole_keywords.robot
Resource           ../resources/device_history/device_history_page_keywords.robot
Resource            ../resources/Page/ServiceSetting_helper.robot
Resource            ../resources/overwrridden_params_gNB/page/overwrite_params_helper.robot

Variables           ../resources/pnp/page/pnp_page_helper
#Resource            ../resources/ServiceSetting/ServiceSetting_keywords.robot
Test Teardown       DMS Network Console UI Logout

*** Variables ***
${AddFile_DU_whitelist}            ${EXECDIR}${DU_SETTINGS_FILE_LOCATION_whitelist}

*** Test Cases ***

Provisioning for PnP for a DU single cell cellindex_1
    [Documentation]    Check Provisioning for DU cell index 1 T234
    [Tags]    provisioning_du_cell1    provisioning_cucp_cuup_du    MJ_R60   Provision    regression    regression_6.0
    Log    Check Provisioning for DU cell index 1
    #Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CELL1_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Login with gNB Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  2s
	Select Profile Association To Delete Existing Profile    ${DEVICE_OVERWRRIDDEN_PARAMETER_DU}
    BuiltIn.Sleep  5s
	Associate New Profile    ${EXECDIR}${DU_SETTINGS_FILE_CELL1_LOCATION}    ${DEVICE_OVERWRRIDDEN_PARAMETER_DU}
    BuiltIn.Sleep  5s
	Verify gNB Device Reset Status
    Log    Check PnP Compute for DU cell 1 conf
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL1_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 1 conf
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL1_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU single cell cellindex_2
    [Documentation]    Check Provisioning for DU cell index 2 T235
    [Tags]    provisioning_du_cell2    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cell index 2
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CELL2_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL2_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL2_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU single cell cellindex_3
    [Documentation]    Check Provisioning for DU cell index 3 T236
    [Tags]    provisioning_du_cell3    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cell index 3
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CELL3_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL3_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL3_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU single cell cellindex_4
    [Documentation]    Check Provisioning for DU cell index 4 T237
    [Tags]    provisioning_du_cell4    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cell index 4
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CELL4_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL4_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL4_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU multi cell cellindex_1 and cellindex_2
    [Documentation]    Check Provisioning for DU cell index 1 and cellindex_2 T238
    [Tags]    provisioning_du_cell_1_2    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cellindex_1 and cellindex_2
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CELL12_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL1_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL1_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL2_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL2_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU multi cell cellindex_1 and cellindex_3
    [Documentation]    Check Provisioning for DU cellindex_1 and cellindex_3 T239
    [Tags]    provisioning_du_cell_1_3    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cellindex_1 and cellindex_3
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CELL13_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL1_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL1_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL3_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL3_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU multi cell cellindex_1 and cellindex_4
    [Documentation]    Check Provisioning for DU cellindex_1 and cellindex_4 T240
    [Tags]    provisioning_du_cell_1_4    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cellindex_1 and cellindex_4
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CELL14_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL1_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL1_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL4_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL4_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU multi cell cellindex_2 and cellindex_3
    [Documentation]    Check Provisioning for DU cellindex_2 and cellindex_3 T241
    [Tags]    provisioning_du_cell_2_3    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cellindex_2 and cellindex_3
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CELL23_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL2_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL2_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL3_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL3_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU multi cell cellindex_2 and cellindex_4
    [Documentation]    Check Provisioning for DU cellindex_2 and cellindex_4 T242
    [Tags]    provisioning_du_cell_2_4    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cellindex_2 and cellindex_4
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CELL24_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL2_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL2_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL4_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL4_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU multi cell cellindex_3 and cellindex_4
    [Documentation]    Check Provisioning for DU cellindex_3 and cellindex_4 T243
    [Tags]    provisioning_du_cell_3_4    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cellindex_3 and cellindex_4
    Service Setting File import for CUCP CUUP DU   ${DU_SETTINGS_FILE_CELL34_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL3_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL3_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL4_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL4_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU multi cell cellindex_1 cellindex_2 and cellindex_3
    [Documentation]    Check Provisioning for DU cellindex_1 cellindex_2 and cellindex_3 T244
    [Tags]    provisioning_du_cell_1_2_3    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cellindex_1 cellindex_2 and cellindex_3
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CELL123_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL1_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL1_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL2_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL2_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL3_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL3_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU multi cell cellindex_1 cellindex_2 and cellindex_4
    [Documentation]    Check Provisioning for DU cellindex_1 cellindex_2 and cellindex_4 T245
    [Tags]    provisioning_du_cell_1_2_4    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cellindex_1 cellindex_2 and cellindex_4
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CELL124_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL1_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL1_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL2_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL2_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL4_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL4_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU multi cell cellindex_1 cellindex_3 and cellindex_4
    [Documentation]    Check Provisioning for DU cellindex_1 cellindex_3 and cellindex_4 T246
    [Tags]    provisioning_du_cell_1_3_4    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cellindex_1 cellindex_3 and cellindex_4
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CELL134_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL1_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL1_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL3_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL3_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL4_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL4_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU multi cell cellindex_2 cellindex_3 and cellindex_4
    [Documentation]    Check Provisioning for DU cellindex_2 cellindex_3 and cellindex_4 T247
    [Tags]    provisioning_du_cell_2_3_4    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cellindex_2 cellindex_3 and cellindex_4
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CELL234_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL2_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL2_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL3_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL3_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL4_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL4_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU multi cell cellindex_1 cellindex_2 cellindex_3 and cellindex_4
    [Documentation]    Check Provisioning for DU cellindex_1 cellindex_2 cellindex_3 and cellindex_4 T248
    [Tags]    provisioning_du_cell_1_2_3_4    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cellindex_1 cellindex_2 cellindex_3 and cellindex_4
    Service Setting File import of CUCP CUUP DU    ${DU_SETTINGS_FILE_CELL1234_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL1_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL1_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL2_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL2_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL3_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL3_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL4_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL4_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout



Provisioning for PnP for a DU all cell cellindex_2
    [Documentation]    Check Provisioning for DU cell index 2 T250
    [Tags]    provisioning_du_CC2    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cell index 2
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CC2_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with gNB Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify gNB Device Reset Status
    Log    Check PnP Compute for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL2_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL2_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU all cell cellindex_3
    [Documentation]    Check Provisioning for DU cell index 3 T251
    [Tags]    provisioning_du_CC3    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cell index 3
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CC3_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL3_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL3_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU all cell cellindex_4
    [Documentation]    Check Provisioning for DU cell index 4 T252
    [Tags]    provisioning_du_CC4    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cell index 4
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CC4_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL4_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL4_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU all cell configured cellindex_1 and cellindex_2
    [Documentation]    Provisioning for PnP for a DU all cell configured index 1 and cellindex_2 T253
    [Tags]    provisioning_du_CC_1_2    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cellindex_1 and cellindex_2
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CC12_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL1_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL1_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL2_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL2_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU all cell configured cellindex_1 and cellindex_3
    [Documentation]    Provisioning for PnP for a DU all cell configured cellindex_1 and cellindex_3 T254
    [Tags]    provisioning_du_CC_1_3    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cellindex_1 and cellindex_3
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CC13_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL1_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL1_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL3_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL3_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU all cell configured cellindex_1 and cellindex_4
    [Documentation]    Provisioning for PnP for a DU all cell configured cellindex_1 and cellindex_4 T255
    [Tags]    provisioning_du_CC_1_4    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cellindex_1 and cellindex_4
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CC14_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL1_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL1_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL4_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL4_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU all cell configured cellindex_2 and cellindex_3
    [Documentation]    Provisioning for PnP for a DU all cell configured cellindex_2 and cellindex_3 T256
    [Tags]    provisioning_du_CC_2_3    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cellindex_2 and cellindex_3
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CC23_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL2_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL2_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL3_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL3_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU all cell configured cellindex_2 and cellindex_4
    [Documentation]    Provisioning for PnP for a DU all cell configured cellindex_2 and cellindex_4 T257
    [Tags]    provisioning_du_CC_2_4    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cellindex_2 and cellindex_4
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CC24_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL2_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL2_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL4_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL4_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU all cell configured cellindex_3 and cellindex_4
    [Documentation]    Provisioning for PnP for a DU all cell configured cellindex_3 and cellindex_4 T258
    [Tags]    provisioning_du_CC_3_4    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cellindex_3 and cellindex_4
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CC34_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL3_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL3_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL4_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL4_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU all cell configured cellindex_1 cellindex_2 and cellindex_3
    [Documentation]    Provisioning for PnP for a DU all cell configured cellindex_1 cellindex_2 and cellindex_3 T259
    [Tags]    provisioning_du_CC_1_2_3    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cellindex_1 cellindex_2 and cellindex_3
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CC123_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL1_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL1_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL2_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL2_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL3_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL3_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU all cell configured cellindex_1 cellindex_2 and cellindex_4
    [Documentation]    Provisioning for PnP for a DU all cell configured cellindex_1 cellindex_2 and cellindex_4 T260
    [Tags]    provisioning_du_CC_1_2_3    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cellindex_1 cellindex_2 and cellindex_4
    Service Setting File import for CUCP CUUP DU   ${DU_SETTINGS_FILE_CC124_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL1_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL1_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL2_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL2_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL4_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL4_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU all cell configured cellindex_1 cellindex_3 and cellindex_4
    [Documentation]    Check Provisioning for PnP for a DU all cell configured cellindex_1 cellindex_3 and cellindex_4 T261
    [Tags]    provisioning_du_CC_1_3_4    provisioning_cucp_cuup_du
    Log    Check Provisioning for DU cellindex_1 cellindex_3 and cellindex_4
    Service Setting File import for CUCP CUUP DU   ${DU_SETTINGS_FILE_CC134_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL1_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 1 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL1_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL3_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL3_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL4_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL4_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU all cell configured cellindex_2 cellindex_3 and cellindex_4
    [Documentation]    Check Provisioning for DU all cell configured cellindex_2 cellindex_3 and cellindex_4 T262
    [Tags]    provisioning_du_CC_2_3_4    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for DU cellindex_2 cellindex_3 and cellindex_4
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CC234_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  10s
    Verify Device Reset Status
    Log    Check PnP Compute for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL2_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 2 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL2_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL3_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 3 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL3_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    Log    Check PnP Compute for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL4_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 4 conf
    Verify PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL4_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for a DU all cell cellindex_1
    [Documentation]    Check Provisioning for DU cell index 1 T249
    [Tags]    provisioning_du_CC1    provisioning_cucp_cuup_du    MJ_R60    Provision    regression    regression_6.0
    Log    Check Provisioning for DU cell index 1
    Service Setting File import for CUCP CUUP DU    ${DU_SETTINGS_FILE_CC1_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Login with gNB Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  2s
    Verify gNB Device Reset Status
    Log    Check PnP Compute for DU cell 1 conf
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_COMPUTE_CELL1_CONF}    ${XPATH_PNP_COMPUTE_CELL_STATUS}
    Log    Check PnP Provision for DU cell 1 conf
    Verify gNB PnP Provisioning Status    ${XPATH_PNP_PROVISION_CELL1_CONF}    ${XPATH_PNP_PROVISION_CELL_STATUS}
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for CU CP
    [Documentation]    Check Provisioning for CU CP T185
    [Tags]    provisioning_cucp    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for cu cp
    #Service Setting File import for CUCP CUUP DU    ${CUCP_SSETTINGS_FILE_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  2s
	Select Profile Association To Delete Existing Profile    ${DEVICE_OVERWRRIDDEN_PARAMETER}
    BuiltIn.Sleep  5s
    Associate New Profile    ${EXECDIR}${CUCP_SSETTINGS_FILE_LOCATION}    ${DEVICE_OVERWRRIDDEN_PARAMETER}
    BuiltIn.Sleep  5s
    #Verify Device Reset Status
    #Verify Device Replan Status
    Test Replan CU CP
    BuiltIn.Sleep  2s
    DMS UI Logout


Provisioning for PnP for modified PLMN for CU CP in SS
    [Documentation]    Check Provisioning for CU CP T186
    [Tags]    provisioning_cucp_modified_plmn    provisioning_cucp_cuup_du    MJ_R60
    Log    Check Provisioning for cu cp for modified plmn
    Service Setting File import for CUCP CUUP DU    ${CUCP_SSETTINGS_FILE186_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE2_MACID}
    Login with Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  2s
    #Verify Device Reset Status
    #Verify Device Replan Status
    Test Replan CU CP
    BuiltIn.Sleep  2s
    DMS UI Logout


Provisioning for PnP for modified data for CU CP in SS
    [Documentation]    Check Provisioning for CU CP T1523
    [Tags]    provisioning_cucp_modified_data    provisioning_cucp_cuup_du    MJ_R60    Provision    regression    regression_6.0
    Log    Check Provisioning for cu cp for modified data
    #Service Setting File import for CUCP CUUP DU    ${CUCP_SSETTINGS_FILE1523_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Login with gNB Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  2s
    Select Profile Association To Delete Existing Profile    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  5s
	Associate New Profile    ${EXECDIR}${CUCP_SSETTINGS_FILE1523_LOCATION}    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  5s

    #Verify Device Reset Status
    Test Replan CU CP

    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for modified NRCellCUID for CU CP in SS
    [Documentation]    Check Provisioning for CU CP T187
    [Tags]    provisioning_cucp_modified_NRCellCUID    provisioning_cucp_cuup_du    MJ_R60    Provision    regression    regression_6.0
    Log    Check Provisioning for cu cp for modified NRCellCUID
    #Service Setting File import for CUCP CUUP DU    ${CUCP_SSETTINGS_FILE187_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Login with gNB Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  2s
    Select Profile Association To Delete Existing Profile    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  5s
	Associate New Profile    ${EXECDIR}${CUCP_SSETTINGS_FILE187_LOCATION}    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  5s
    Test Replan CU CP
    #Verify Device Reset Status
    #Verify Device Replan Status
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for updated data for CU CP in SS
    [Documentation]    Check Provisioning for CU CP T197
    [Tags]    provisioning_cucp_updated_data    provisioning_cucp_cuup_du    MJ_R60    Provision    regression    regression_6.0
    Log    Check Provisioning for cu cp for modified data
    #Service Setting File import for CUCP CUUP DU    ${CUCP_SSETTINGS_FILE1523_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Login with gNB Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  2s
    Select Profile Association To Delete Existing Profile    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  5s
	Associate New Profile    ${EXECDIR}${CUCP_SSETTINGS_FILE187_LOCATION}    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  5s
    #Verify Device Reset Status
    Test Replan CU CP

    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for CU UP
    [Documentation]    Check Provisioning for CU UP T215
    [Tags]    provisioning_cuup    provisioning_cucp_cuup_du    MJ_R60    Provision    regression    regression_6.0
    Log    Check Provisioning for cu up
    #Service Setting File import for CUCP CUUP DU    ${CUUP_SSETTINGS_FILE_LOCATION}
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Login with gNB Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  2s
	Select Profile Association To Delete Existing Profile    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  5s
    Associate New Profile    ${EXECDIR}${CUUP_SSETTINGS_FILE_LOCATION}    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  5s
    #Verify gNB Device Reset Status
    Test Reset CU UP
    #Verify Device Reset Status
    #Verify Device Replan Status
    BuiltIn.Sleep  2s
    DMS UI Logout

Provisioning for PnP for GUI Overridden DU CellLocalID
    [Documentation]    Check Provisioning for CU CP T1535
    [Tags]    provisioning_cuup_overridden_celllocalid    provisioning_cucp_cuup_du    MJ_R60    Provision    regression    regression_6.0
    Log    Check Provisioning for GUI Overridden DU CellLocalID
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Login with gNB Device ID  ${DEVICE_MACID}
    BuiltIn.Sleep  2s
    Test GUI Override DU Cell 1 Save
    BuiltIn.Sleep  2s
    Test Replan DU
    BuiltIn.Sleep  10s
    Test GUI Override DU Cell 1 Delete
    BuiltIn.Sleep  2s
    Test Replan DU
    BuiltIn.Sleep  2s
    DMS UI Logout


Min Mandatory provisioning failed during full provisioning
    [Documentation]    Min Mandatory provisioning failed during full provisioning
    [Tags]    Min_Mandatory_Failure_Verification    Provision
    Log    Check Mandatory provisioning failed during full provisioning
    Device console Login
    #set global variable  ${DEVICE_MACID}  ${CU_CP_MinMan_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    search using cu_cp name    ${DEVICE_MACID}
	Select Profile Association To Delete Existing Profile    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  30s
    #Dashboard gNB Device InService Status
    Replan gNB Device
    BuiltIn.Sleep  60s
    Associate New Profile    ${AddMinMandFile_CUCP}    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  30s
    #Dashboard gNB Device InService Status
    Replan gNB Device
    BuiltIn.Sleep  60s

	#Select Profile Association To Delete Existing Profile    ${DEVICE_OVERWRRIDDEN_PARAMETER}
	#BuiltIn.Sleep  10s
    #Replan Device
	#BuiltIn.Sleep  10s
    #Associate New Profile    ${AddMinMandFile_CUCP}    ${DEVICE_OVERWRRIDDEN_PARAMETER}
    #BuiltIn.Sleep  30s
    #Reset Device
    #BuiltIn.Sleep  100s
    Verify PnP Min Mandatory Provisioning Status  Failed
    Netconf Provisioning on Device History   Tabular  Last 1 hour  PROVISIONING
    DMS Network Console UI Login
	Open System Alarm Page
	BuiltIn.Sleep  10s
	#Check for Existence of Failure Alarm    ${CU_CP_MinMan_MACID}    VNF Provisioning Failure
    Check for Existence of Failure Alarm    ${DEVICE_MACID}    VNF Provisioning Failure
    #Wait for Proactive Job
    Device console Login
    #set global variable  ${DEVICE_MACID}  ${CU_CP_MinMan_MACID}
    Verify PnP Min Mandatory Provisioning Status  Success


Delta Provisioning on Reconnect DU
    [Documentation]    Delta Provisioning on Reconnect
    [Tags]    delta_provisioning_DU    Regression    Provision    delta_provisioning    regression_6.0
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    search using du name    ${DEVICE_MACID}
    configure VES Params    ${VES_DICT_DMS_Overridden1}
    replan gnb device
    BuiltIn.Sleep  30s
    configure VES Params    ${VES_DICT_DMS_Overridden}
	Verify GNB Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE}
	Change the device to unmaged and back to Managed
	BuiltIn.Sleep  120s
	Verify Delta Provisioning Status in pnp    ${DEVICE_gNB_pnp_PAGE_DU}
	Verify value provisioned    ${DEVICE_gNB_PROVISIONING_DATA_PAGE}


Delta Provisioning on Reconnect CUCP
    [Documentation]    Delta Provisioning on Reconnect
    [Tags]    delta_provisioning_CUCP    Regression    Provision    delta_provisioning    regression_6.0
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    search using cu_cp name    ${DEVICE_MACID}
    configure VES Params CU    ${VES_DICT_DMS_Overridden1}
    replan gnb device
    BuiltIn.Sleep  30s
    configure VES Params CU    ${VES_DICT_DMS_Overridden}
	Verify GNB Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE}
	Change the device to unmaged and back to Managed
	BuiltIn.Sleep  120s
	Verify Delta Provisioning Status in pnp    ${DEVICE_gNB_pnp_PAGE_CP}
	Verify value provisioned    ${DEVICE_gNB_PROVISIONING_DATA_PAGE}

Delta Provisioning on Reconnect CUUP
    [Documentation]    Delta Provisioning on Reconnect
    [Tags]    delta_provisioning_CUUP    Regression    Provision    delta_provisioning    regression_6.0
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    search using cu_up name    ${DEVICE_MACID}
    configure VES Params CU    ${VES_DICT_DMS_Overridden1}
    replan gnb device
    BuiltIn.Sleep  30s
    configure VES Params CU    ${VES_DICT_DMS_Overridden}
	Verify GNB Delta Provisioning Status    ${DEVICE_gNB_PROVISIONING_STATUS_PAGE}
	Change the device to unmaged and back to Managed
	BuiltIn.Sleep  120s
	Verify Delta Provisioning Status in pnp    ${DEVICE_gNB_pnp_PAGE_CP}
	Verify value provisioned    ${DEVICE_gNB_PROVISIONING_DATA_PAGE}


Service Setting File Associate for whitelist on DU
    [DOCUMENTATION]  Service Setting File Associate for whitelist on DU
    [Tags]  profile_association_ss_du_whitelist   regression    regression_6.0
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    search using du name    ${DEVICE_MACID}
    Delete the WhiteList Configured from UI
    Select Profile Association To Delete Existing Profile    ${DEVICE_OVERWRRIDDEN_PARAMETER_DU}
    BuiltIn.Sleep  30s
    Open gNB Device Dashboard
    Verify gNB connect status      Connected
    Replan Device
    BuiltIn.Sleep  60s
    Associate New Profile    ${AddFile_DU_whitelist}    ${DEVICE_OVERWRRIDDEN_PARAMETER_DU}
    BuiltIn.Sleep  30s
    Open gNB Device Dashboard
    Verify gNB connect status      Connected
    Verify Delta Provisioning Status in pnp    ${DEVICE_gNB_pnp_PAGE_DU}
    Replan gNB Device
    BuiltIn.Sleep  60s
    Check for the Row Present    ${DEVICE_OVERWRRIDDEN_PARAMETER_DU}
    Verify WhiteList value provisioned    ${DEVICE_gNB_PROVISIONING_DATA_PAGE}

Provisioning on successfull computation of missing params for CP
    [Documentation]    Provisioning on successfull computation of missing params
    [Tags]    provisioning_missingParams_cp     provisioning_missingParams    Regression    regression_6.0
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE23_MACID}
    search using cu_cp name    ${DEVICE_MACID}
    #Verify DMS Overriden Params page Navigation
    Reset gNB Device
    BuiltIn.Sleep  10s
    Associate New Profile   ${EXECDIR}${CP_ProfileAssociation_Location}    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  20s
    Open VNF Device PnP Page    ${VNF_CU_PNP_PAGE}
    BuiltIn.Sleep  4s
    Verify PnP statue page for successful computation
    BuiltIn.Sleep  5s
    Select Profile Association To Delete Existing Profile   ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  5s
    Reset gNB Device
    BuiltIn.Sleep  5s

Provisioning on successfull computation of missing params for UP
    [Documentation]    Provisioning on successfull computation of missing params
    [Tags]    provisioning_missingParams_up     provisioning_missingParams    Regression    regression_6.0
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE23_MACID}
    search using cu_up name    ${DEVICE_MACID}
    Reset gNB Device
    BuiltIn.Sleep  10s
    #Verify DMS Overriden Params page Navigation
    Associate New Profile   ${EXECDIR}${UP_ProfileAssociation_Location}    ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  20s
    Open VNF Device PnP Page    ${VNF_CU_PNP_PAGE}
    BuiltIn.Sleep  4s
    Verify PnP statue page for successful computation
    BuiltIn.Sleep  5s
    Select Profile Association To Delete Existing Profile   ${DEVICE_OVERWRRIDDEN_PARAMETER_CU}
    BuiltIn.Sleep  5s
    Reset gNB Device
    BuiltIn.Sleep  5s

Provisioning on successfull computation of missing params for DU
    [Documentation]    Provisioning on successfull computation of missing params
    [Tags]    provisioning_missingParams_du     provisioning_missingParams    Regression    regression_6.0
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE23_MACID}
    search using du name    ${DEVICE_MACID}
    Reset gNB Device
    BuiltIn.Sleep  10s
    #Verify DMS Overriden Params page Navigation
    Associate New Profile   ${EXECDIR}${DU_ProfileAssociation_Location}    ${DEVICE_OVERWRRIDDEN_PARAMETER_DU}
    BuiltIn.Sleep  50s
    Open VNF Device PnP Page    ${VNF_DU_PNP_PAGE}
    BuiltIn.Sleep  10s
    Verify PnP statue page for successful computation
    BuiltIn.Sleep  5s
    Select Profile Association To Delete Existing Profile   ${DEVICE_OVERWRRIDDEN_PARAMETER_DU}
    BuiltIn.Sleep  5s
    Reset gNB Device
    BuiltIn.Sleep  5s