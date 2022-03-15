*** Settings ***
Library            SSHLibrary
Suite Teardown     DMS UI Logout
Resource            ../resources/common/ui_common.robot
Resource            ../resources/dashboard/dashboard_keywords.robot
Library             String
#Resource           ../resources/network_console_report/report_keywords.robot
Resource           ../resources/device_history/device_history_page_keywords.robot
Resource           ../resources/Import/Import_keywords.robot
Resource           ../resources/Search_Page/Search_Device.robot
Resource           ../resources/EntityMapping/EntityMapping_keywords.robot
Test Teardown       DMS Network Console UI Logout

*** Variables ***
${HOST}                ${SERVER_IP}
${USERNAME}            ${SERVER_USERNAME}
${PASSWORD}            ${SERVER_PASSWORD}

*** Test Cases ***
#EntityMapping file import along MeNB Device
#    [Documentation]  Verify Entity file import is successful along MeNB device
#    [Tags]   entitymapping_import    import    regression    entitymapping    working
   # Open Connection     ${HOST}
   # Login               ${USERNAME}        ${PASSWORD}
    #put file        ${EXECDIR}${ENTITYMAPPING_FILE_LOCATION}    ${ENTITYMAPPING_FILE_IMPORT_PATH}
    #DMS Network Console UI Login
    #Import Entity Mapping file
    #Verify Operation History for Entity Mapping import  Entity Mapping
    #Device console Login
    #Search using cu_cp name    ${CU_CP_VENUE_DEVICE1}
    #Verify Topology Navigation from dashboard
    #Verify X2C Param Delta in Provisioning Page

#Remove EntityMapping association for MeNB Device
 #   [Documentation]  Verify that removal of Entity file association is successful for MeNB device
 #   [Tags]   remove_entitymapping_import    import    regression    entitymapping    working
 #   Open Connection     ${HOST}
 #   Login               ${USERNAME}        ${PASSWORD}
 #   put file        ${EXECDIR}${ENTITYMAPPING_DEL_FILE_LOCATION}    ${ENTITYMAPPING_FILE_IMPORT_PATH}
 #   DMS Network Console UI Login
 #   Import Entity Mapping file
  #  Verify Operation History for Entity Mapping import  Entity Mapping
  #  Device console Login
   # search using cu_cp name    ${CU_CP_VENUE_DEVICE1}
    #Verify X2C Delete Param Delta in Provisioning Page

