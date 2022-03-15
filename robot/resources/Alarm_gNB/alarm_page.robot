*** Settings ***
Library             pyautogui
Resource            ../common/ui_common.robot
Resource            page/alarm_helper.robot
Resource            ../dashboard/page/dashboard_page_helper.robot
Resource            ../dashboard/page/device_alarm_opertions_helper.robot
Resource            ../dashboard_6.0/dashboard_keywords.robot
Resource            ../dashboard_6.0/page/dashboard_page_helper.robot
Resource            ../pnp/pnp_keywords.robot


*** Variables ***

*** Keywords ***



Verify DU Alarm in Device Console Alarm Page
    Open Device Console gNB Alarm Page  ${ALARM_PARAMETER_CU}
    Search Alarm in Alarm Page  DU-F1 Connection
    Verify DU Alarm Param Details in Alarm page

Verify DU Alarm in Network Console Device Alarm Page
    Device Alarm Page Navigation
    Search Alarm in Network Device Alarm Page  DU-F1 Connection
    Verify DU Alarm Param Details in Network Device Alarm page

Verify DU Clear Alarm in Device Console Alarm Page
    Open Device Console gNB Alarm Page  ${ALARM_PARAMETER_CU}
    Navigate to gNB All Alarm
    Search Alarm in All Alarm Page  DU-F1 Connection
    Verify DU Clear Alarm Param Details in Alarm page
Verify DU Clear Alarm in Network Console Device Alarm Page
    Device Alarm Page Navigation
    Navigate to gNB All Alarm
    Search Alarm in Network Device Alarm Page  DU-F1 Connection
    Verify DU Clear Alarm Param Details in Network Device Alarm page

Verify CUCP Alarm in Device Console Alarm Page
    Open Device Console gNB Alarm Page  ${ALARM_PARAMETER_CU}
    Search Alarm in Alarm Page  X2cConnectionisdown
    Verify CUCP Alarm Param Details in Alarm page

Verify CUCP Alarm in Network Console Device Alarm Page
    Device Alarm Page Navigation
    Search Alarm in Network Device Alarm Page  X2cConnectionisdown
    Verify CUCP Alarm Param Details in Network Device Alarm page

Verify CUCP Clear Alarm in Device Console Alarm Page
    Open Device Console gNB Alarm Page  ${ALARM_PARAMETER_CU}
    Navigate to gNB All Alarm
    Search Alarm in All Alarm Page  X2cConnectionisdown
    Verify CUCP Clear Alarm Param Details in Alarm page
Verify CUCP Clear Alarm in Network Console Device Alarm Page
    Device Alarm Page Navigation
    Navigate to gNB All Alarm
    Search Alarm in Network Device Alarm Page  X2cConnectionisdown
    Verify CUCP Clear Alarm Param Details in Network Device Alarm page


Verify CUUP Alarm in Device Console Alarm Page
    Open Device Console gNB Alarm Page  ${ALARM_PARAMETER_CU}
    Search Alarm in Alarm Page  S1-U Connection
    Verify CUUP Alarm Param Details in Alarm page

Verify CUUP Alarm in Network Console Device Alarm Page
    Device Alarm Page Navigation
    Search Alarm in Network Device Alarm Page  S1-U Connection
    Verify CUUP Alarm Param Details in Network Device Alarm page

Verify CUUP Clear Alarm in Device Console Alarm Page
    Open Device Console gNB Alarm Page  ${ALARM_PARAMETER_CU}
    Navigate to gNB All Alarm
    Search Alarm in All Alarm Page  S1-U Connection
    Verify CUUP Clear Alarm Param Details in Alarm page
Verify CUUP Clear Alarm in Network Console Device Alarm Page
    Device Alarm Page Navigation
    Navigate to gNB All Alarm
    Search Alarm in Network Device Alarm Page  S1-U Connection
    Verify CUUP Clear Alarm Param Details in Network Device Alarm page

Verify RP Alarm in Device Console Alarm Page
    Open Device Console gNB Alarm Page  ${ALARM_PARAMETER_CU}
    Search Alarm in Alarm Page  CU-Plane-RU
    Verify RP Alarm Param Details in Alarm page

Verify RP Alarm in Network Console Device Alarm Page
    Device Alarm Page Navigation
    Search Alarm in Network Device Alarm Page  CU-Plane-RU
    Verify RP Alarm Param Details in Network Device Alarm page

Verify RP Clear Alarm in Device Console Alarm Page
    Open Device Console gNB Alarm Page  ${ALARM_PARAMETER_CU}
    Navigate to gNB All Alarm
    Search Alarm in All Alarm Page  CU-Plane-RU
    Verify RP Clear Alarm Param Details in Alarm page
Verify RP Clear Alarm in Network Console Device Alarm Page
    Device Alarm Page Navigation
    Navigate to gNB All Alarm
    Search Alarm in Network Device Alarm Page  CU-Plane-RU
    Verify RP Clear Alarm Param Details in Network Device Alarm page


Verify CUCP Alarm details in Additional info
    [arguments]    ${CUCP_gNBid}    ${CUCP_vnfid}    ${CUCP_gNBName}
    Open Device Console gNB Alarm Page  ${ALARM_PARAMETER_CU}
    Verify CUCP gNBid gNBName vnfid in Alarm details

Verify CUUP Alarm details in Additional info
    [arguments]    ${CUUP_gNBid}    ${CUUP_vnfid}    ${CUUP_gNBName}
    Open Device Console gNB Alarm Page  ${ALARM_PARAMETER_CU}
    Verify CUUP gNBid gNBName vnfid in Alarm details

Verify DU Alarm details in Additional info
    [arguments]    ${DU_gNBid}    ${DU_vnfid}    ${DU_gNBName}
    Open Device Console gNB Alarm Page  ${ALARM_PARAMETER_DU}
    Verify DU gNBid gNBName vnfid in Alarm details

Verify computation failure PnP status
    computation failure PnP status

Verify computation failure PnP status UP
    computation failure PnP status UP

Verify computation failure PnP status DU
    computation failure PnP status DU

Verify Computation failure alarm
    [arguments]     ${vnf}
    Go To   ${DMS_Network_Console_Alarm_URL}
    computation failure alarm verification  ${vnf}

Verify CUUP Alarm in Device Console Alarm Page after Sync Alarm operation
    Open Device Console gNB Alarm Page  ${ALARM_PARAMETER_CU}
    Perform Sync Alarm Operation
    Verify New Sync Alarm in Alarm page  CRITICAL

Verify Sync Alarm in device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}  ${response_severity}
    Open gNB Device History Page  ${DEVICE_HiSTORY_PARAMETER_CU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Select Device History Items per Page
    Verify Sync Alarm details in history  ${response_severity}
Verify DU Sync Alarm in device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}  ${response_severity}
    Open gNB Device History Page  ${DEVICE_HiSTORY_PARAMETER_CU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Select Device History Items per Page
    Verify DU Sync Alarm details in history  ${response_severity}
Verify CUUP Alarm in Network Console Alarm Page after Sync Alarm operation
    Device Alarm Page Navigation
    Search Alarm in Network Device Alarm Page  X2UConnectionisdown
    Verify New Sync Alarm in Network Alarm page  CRITICAL

Verify DU Alarm in Device Console Alarm Page after Sync Alarm operation
    Open Device Console gNB Alarm Page  ${ALARM_PARAMETER_CU}
    Perform Sync Alarm Operation
    Navigate to gNB All Alarm
    Verify Clear Sync Alarm in Alarm page  CLEAR

Verify DU Alarm in Network Console Alarm Page after Sync Alarm operation
    Device Alarm Page Navigation
    Navigate to gNB All Alarm
    BuiltIn.Sleep  10s
    Search Alarm in Network Device Alarm Page  RU CU-plane sync loss
    Verify Clear Sync Alarm in Network Alarm page  CLEAR

Verify CUCP Alarm in Device Console Alarm Page after Sync Alarm operation
    Open Device Console gNB Alarm Page  ${ALARM_PARAMETER_CU}
    Perform Sync Alarm Operation
    Navigate to gNB All Alarm
    BuiltIn.Sleep  10s
    Verify Clear Sync Alarm in Alarm page  CLEAR

Verify CUCP Alarm in Network Console Alarm Page after Sync Alarm operation
    Device Alarm Page Navigation
    Navigate to gNB All Alarm
    BuiltIn.Sleep  10s
    Search Alarm in Network Device Alarm Page  X2cConnectionisdown
    Verify Clear Sync Alarm in Network Alarm page  CLEAR

Perform Sync Operation during CUCP Factoryreset
    Open Device Console gNB Alarm Page  ${ALARM_PARAMETER_CU}
    Reset gNB Device
    Perform Sync Alarm Operation

Perform Sync Operation during DU Reboot
    Open Device Console gNB Alarm Page  ${ALARM_PARAMETER_CU}
    Reboot gNB Device
    Perform Sync Alarm Operation

Perform Sync Operation during CUUP Replan
    Open Device Console gNB Alarm Page  ${ALARM_PARAMETER_CU}
    Replan gNB Device
    Perform Sync Alarm Operation

#Verify operation details in Notification
 #   Verify Notification details  ipsec2-2051cucp1
Verify RPTxOff Raise Alarm in Device Console Alarm Page
    BuiltIn.Sleep  50s
    Open Device Console gNB Alarm Page  ${ALARM_PARAMETER_DU}
    BuiltIn.Sleep  30s
    Open Device Console gNB Alarm Page  ${ALARM_PARAMETER_DU}
    Search Alarm in Alarm Page  Radio Point Service
    Verify RPTxOff Alarm Param Details in Alarm page

Verify RPTxOff Raise Alarm in Network Console Device Alarm Page
    Device Alarm Page Navigation
    #Search Alarm in Network Device Alarm Page  Radio Point Service
    Search RPTxOff Alarm in Network gNB Device Alarm Page    Radio Point:0005B9514245 in DU:drop2-3031du1_cellindex_1 is DOWN
    Verify RPTxOff Alarm Param Details in Network Device Alarm page

Verify RPTxOff Clear Alarm in Device Console Alarm Page
    Open Device Console gNB Alarm Page  ${ALARM_PARAMETER_DU}
    #Navigate to gNB All Alarm
    #Search RPTxOff Alarm in Network gNB Device Alarm Page      Radio Point:0005B9514245 in DU:drop2-3031du1_cellindex_1 is DOWN
    Search Alarm in Alarm Page     Radio Point Service
    Verify RPTxOff Clear DU Alarm Param Details in Alarm page
Verify RPTxOff Clear Alarm in Network Console Device Alarm Page
    Device Alarm Page Navigation
    Navigate to gNB All Alarm
    Search RPTxOff Alarm in Network gNB Device Alarm Page    Radio Point:0005B9514245 in DU:drop2-3031du1_cellindex_1 is DOWN
    Verify RPTxOff Clear Alarm Param Details in Network Device Alarm page