*** Settings ***
Library             String
Variables           device_dashboard_ui_controls.py

*** Variables ***

*** Keywords ***
Dashboard gNB Device Summary Status
    [Documentation]  Check the Device Summary
    Log  Check Dashboard Device Summary content
    Wait Until Page Contains Element  ${ID_DASHBOARD_DASHBOARD_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${ID_DASHBOARD_DASHBOARD_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s
    Wait Until Page Contains Element  ${XPATH_DASHBOARD_DASHBOARD_SUMMARY}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${XPATH_DASHBOARD_DASHBOARD_SUMMARY}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s

Dashboard gNB Device InService Status
    [Documentation]  Check the Device Status
    Log  Check Dashboard gNB Device Inservice Status
    Open gNB Device Dashboard
    Wait Until Page Contains Element  ${XPATH_DMS_INSERVICE_TAG}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${XPATH_DMS_INSERVICE_TAG}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s

Dashboard DU gNB Device InService Status
    [Documentation]  Check the Device Status
    Log  Check Dashboard gNB Device Inservice Status
    Open DU gNB Device Dashboard
    Wait Until Page Contains Element  ${XPATH_DC_SummarySerStatus}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${XPATH_DC_SummarySerStatus}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    ${Summary_Ser_Status} =   Get Text  ${XPATH_DC_SummarySerStatus}
    log   ${Summary_Ser_Status}
    Should Contain   ${Summary_Ser_Status}   In Service
    BuiltIn.Sleep  2s


Open gNB Device Dashboard
    [Documentation]  Open Device Console Dashboard Page
    Log  One Device Console Dashboard
    ${dashboard_url}=  Format String   ${DEVICE_DASHBOARD_DEVICE_URL_gNB_CU}   dms_device_console=${DMS_UI_URL}    device_macid=${DEVICE_MACID}
    Go To  ${dashboard_url}
    Wait Until Element Is Visible  ${XPATH_DASHBOARD_HEADER_LABEL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${XPATH_DASHBOARD_HEADER_LABEL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s

Open DU gNB Device Dashboard
    [Documentation]  Open Device Console Dashboard Page
    Log  One Device Console Dashboard
    ${dashboard_url}=  Format String   ${DEVICE_DASHBOARD_DEVICE_URL_gNB_DU}   dms_device_console=${DMS_UI_URL}    device_macid=${DEVICE_MACID}
    Go To  ${dashboard_url}
    Wait Until Element Is Visible  ${XPATH_DASHBOARD_HEADER_LABEL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${XPATH_DASHBOARD_HEADER_LABEL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s


Open gNB Network Console Dashboard
    [Documentation]  Open Network Console Dashboard Page
    Log  One Network Console Dashboard
    Switch browser  ${NC_Window}
    ${dashboard_url}=  Format String   ${NETWORK_CONSOLE_DASHBOARD_URL}   dms_device_console=${DMS_NC_URL}
    Go To  ${dashboard_url}
    Wait Until Element Is Visible  ${XPATH_DASHBOARD_HEADER_LABEL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${XPATH_DASHBOARD_HEADER_LABEL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s

Verify gNB Supported Radio Type In Dashboard
   [Documentation]  Verify Supported Radio Type
   [Arguments]  ${pr_type}
   Open gNB Device Dashboard
   ${supported_radio_type} =   Get Text  ${XPATH_DASHBOARD_RADIO_POINT_TYPE_LABEL}
   Log  ${supported_radio_type}
   Should Contain   ${supported_radio_type}   ${pr_type}

Get gNB Device Software Version
    [Documentation]  Get the software version of device
    Open gNB Device Dashboard
    ${dev_software_version}=   Get DMS Element Text  ${XPATH_DASHBOARD_SOFWARE_VERSION_TEXT}
    [Return]  ${dev_software_version}

Create delta to check periodic flow1
    Open Overridden Params Page
    Update Carrier Aggregation Downlink

Dashboard gNB Device OutOfService Status
    [Documentation]  Check the Device Status
    Log  Check Dashboard Device OutOfService Status
    Open gNB Device Dashboard
    Wait Until Page Contains Element  ${XPATH_DMS_OUTOFSERVICE_TAG}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${XPATH_DMS_OUTOFSERVICE_TAG}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s
	
Change to Unmanaged
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_MANAGED_BUTTON}
    BuiltIn.Sleep  5s
    Input Text     ${XPATH_INPUT_UNMANAGED_MANAGED}    Moving to Unmanaged
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_MANAGED_CONFIRM_BUTTON}


Change to Managed
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_MANAGED_BUTTON}
    BuiltIn.Sleep  5s
    Input Text     ${XPATH_INPUT_UNMANAGED_MANAGED}    Moving to Managed
    BuiltIn.Sleep  5s
    Click DMS Element    ${XPATH_MANAGED_CONFIRM_BUTTON}
	
Verify the status of netconf connection
    [Arguments]  ${Status}
    ${Status_value} 	Get Text    ${XPATH_NETCONF_CONNECTION_STATUS}
	Should contain     ${Status_value}     ${Status}  


DashboardPage component Header
    [Documentation]  DashboardPage component Header
    Log  Check DashboardPage component Header
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_Dashboard_Header}
    Should Contain   ${dashboardpage_component}   Dashboard

DashboardPage component Summary
    [Documentation]  DashboardPage component summary
    [Arguments]  ${device_productclass}    ${device_serialno}
    Log  Check DashboardPage component summary
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_SummarySerStatus}
    Should Contain Any   ${dashboardpage_component}   Not Applicable    Unknown    In Service    Ready    Out Of Service

    Log  Check DashboardPage component Title
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_Summary_Title}
    Should Contain   ${dashboardpage_component}   Summary

    Log  Check DashboardPage component OUIPC
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_SummaryOUIPC}
    Should Contain   ${dashboardpage_component}   ${device_productclass}-${device_serialno} (OUI-PC-VNFID)

    Log  Check DashboardPage component MaintenanceStatus
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_MaintenanceStatus}
    Should Contain Any   ${dashboardpage_component}   System Unmanaged    Managed    User Unmanaged

DashboardPage component Summary Details
    [Documentation]  DashboardPage component summary Details
    #Log  Check DashboardPage component summary Details gNB ID
    #[Arguments]  ${XPATH_DC_gNBIdCA_Title_Label_local}    ${XPATH_DC_gNBId_Value_Label_local}
    #${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_DC_gNBIdCA_Title_Label_local}
    #Should Contain   ${dashboardpage_component}   gNB ID

    #Log  Check DashboardPage component summary Details gNB ID Value
    #${dashboardpage_component}=    Verify DashboardPage Generic components    ${XPATH_DC_gNBId_Value_Label_local}

    Log  Check DashboardPage component summary Details Netconf Session Status
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_NetCnfSessionStatusCA_Title_Label}
    Should Contain   ${dashboardpage_component}   Netconf Session Status

    Log  Check DashboardPage component summary Details Netconf Session value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_NetCnfSessionStatus_Value_Label}
    Should Contain Any   ${dashboardpage_component}    Connected    Disconnected    Connecting

    Log  Check DashboardPage component summary Details Heartbeat Status
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_HeartBeatStatusCA_Title_Label}
    Should Contain   ${dashboardpage_component}   Heartbeat Status

    Log  Check DashboardPage component summary Details Heartbeat Value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_HeartBeatStatus_Value_Label}
    Should Contain Any   ${dashboardpage_component}   NA    Not_Started    Started    Normal    Disabled    Critical    Tentative    Unmanaged

    Log  Check DashboardPage component summary Details Number of Active Alarms
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_DvcAlarmsCountCA_Title_Label}
    Should Contain   ${dashboardpage_component}   Number of Active Alarms

    Log  Check DashboardPage component summary Details Number of Critical Alarms
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Number_of_Critical_Alarm}

    Log  Check DashboardPage component summary Details Number of Major Alarms
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Number_of_Major_Alarm}

    Log  Check DashboardPage component summary Details Number of Minor Alarms
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Number_of_Minor_Alarm}

    Log  Check DashboardPage component summary Details Number of Warning Alarms
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Number_of_Warning_Alarm}

    Log  Check DashboardPage component summary Details provisioning status
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_Provision_Status_Count_Display_Name}
    Should Contain   ${dashboardpage_component}   Provisioning Status

    Log  Check DashboardPage component summary Details provisioning failed
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Number_of_Failed_Provisioned}

    Log  Check DashboardPage component summary Details provisioning delta
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Number_of_Delta_Provisioned}

    Log  Check DashboardPage component summary Details provisioning running
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Number_of_Running_Provisioned}

    Log  Check DashboardPage component summary Details provisioning pending
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Number_of_Pending_Provisioned}

DashboardPage component gNB Details CUCP
    [Documentation]  DashboardPage component gNB Details
    Log  Check DashboardPage component gNB Details gNB Details
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_DC_SummaryDetails}
    Should Contain   ${dashboardpage_component}   gNB Details

    Log  Check DashboardPage component summary Details gNB ID
    ${dashboardpage_component}=    Verify DashboardPage Generic components    ${XPATH_DC_gNBIdTitle_Label}
    Should Contain   ${dashboardpage_component}   ID

    Log  Check DashboardPage component summary Details gNB ID Value
    ${dashboardpage_component}=    Verify DashboardPage Generic components    ${XPATH_DC_gNBId_Value_Label}

    Log  Check DashboardPage component summary Details gNB Name
    ${dashboardpage_component}=    Verify DashboardPage Generic components    ${XPATH_DC_cucp_gNBNameTitle_Label}
    Should Contain   ${dashboardpage_component}   Name

    Log  Check DashboardPage component summary Details gNB Name Value
    ${dashboardpage_component}=    Verify DashboardPage Generic components    ${XPATH_DC_cucp_gNBName_Value_Label}

DashboardPage component gNB Details CUUP
    [Documentation]  DashboardPage component gNB Details
    Log  Check DashboardPage component gNB Details gNB Details
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_DC_SummaryDetails}
    Should Contain   ${dashboardpage_component}   gNB Details

    Log  Check DashboardPage component summary Details gNB ID
    ${dashboardpage_component}=    Verify DashboardPage Generic components    ${XPATH_DC_CUUP_gNBIdTitle_Label}
    Should Contain   ${dashboardpage_component}   ID

    Log  Check DashboardPage component summary Details gNB ID Value
    ${dashboardpage_component}=    Verify DashboardPage Generic components    ${XPATH_DC_CUUP_gNBId_Value_Label}

    Log  Check DashboardPage component summary Details gNB Name
    ${dashboardpage_component}=    Verify DashboardPage Generic components    ${XPATH_DC_cuup_gNBNameTitle_Label}
    Should Contain   ${dashboardpage_component}   Name

    Log  Check DashboardPage component summary Details gNB Name Value
    ${dashboardpage_component}=    Verify DashboardPage Generic components    ${XPATH_DC_cuup_gNBName_Value_Label}

DashboardPage component gNB Details DU
    [Documentation]  DashboardPage component gNB Details
    Log  Check DashboardPage component gNB Details gNB Details
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_DC_SummaryDetails}
    Should Contain   ${dashboardpage_component}   gNB Details

    Log  Check DashboardPage component summary Details gNB ID
    ${dashboardpage_component}=    Verify DashboardPage Generic components    ${XPATH_DC_gNBIdTitle_Label}
    Should Contain   ${dashboardpage_component}   ID

    Log  Check DashboardPage component summary Details gNB ID Value
    ${dashboardpage_component}=    Verify DashboardPage Generic components    ${XPATH_DC_gNBId_Value_Label}

    Log  Check DashboardPage component summary Details gNB Name
    ${dashboardpage_component}=    Verify DashboardPage Generic components    ${XPATH_DC_gNBNameTitle_Label}
    Should Contain   ${dashboardpage_component}   Name

    Log  Check DashboardPage component summary Details gNB Name Value
    ${dashboardpage_component}=    Verify DashboardPage Generic components    ${XPATH_DC_gNBName_Value_Label}


DashboardPage component netconf session
    [Documentation]  DashboardPage component connectivity
    Log  Check DashboardPage component connectivity
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_DashBoard_ConnectivityDetails_Title}
    Should Contain   ${dashboardpage_component}   Connectivity

    Log  Check DashboardPage component netconf session
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_DashBoard_NetConfDetails_Title}
    Should Contain   ${dashboardpage_component}   Netconf Session

    Log  Check DashboardPage component netconf ip port
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_LocalIPAddressTitle_Label}
    Should Contain   ${dashboardpage_component}   Netconf IP/FQDN-Port

    Log  Check DashboardPage component netconf ip port value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_LocalIPAddress_Value_Label}

    Log  Check DashboardPage component netconf FirstEstSessTime
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_FirstEstSessTime_Title_Label}
    Should Contain   ${dashboardpage_component}   First Session Established Time

    Log  Check DashboardPage component netconf FirstEstSessTime value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_FirstEstSessTime_Value_Label}

    Log  Check DashboardPage component netconf LastEstSessTime
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_LastEstSessTime_Title_Label}
    Should Contain   ${dashboardpage_component}   Last Session Established Time

    Log  Check DashboardPage component netconf LastEstSessTime value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_LastEstSessTime_Value_Label}

    Log  Check DashboardPage component netconf NextSessRetryTime
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_NextSessRetryTime_Title_Label}
    Should Contain   ${dashboardpage_component}   Next Session Retry Time

    Log  Check DashboardPage component netconf NextSessRetryTime value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_NextSessRetryTime_Value_Label}

    Log  Check DashboardPage component netconf LastSessRetryTime
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_LastSessRetryTime_Title_Label}
    Should Contain   ${dashboardpage_component}   Last Session Retry Time

    Log  Check DashboardPage component netconf LastSessRetryTime value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_LastSessRetryTime_Value_Label}

DashboardPage component ves heartbeat
    [Documentation]  DashboardPage component connectivity VES HB
    Log  Check DashboardPage component connectivity
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_DashBoard_VESHtBeatDetails_Title}
    Should Contain   ${dashboardpage_component}   VES Heartbeat

    Log  Check DashboardPage component VES HB FirstReceviedTime
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_FirstReceviedTime_Title_Label}
    Should Contain   ${dashboardpage_component}   First Heartbeat Received Time

    Log  Check DashboardPage component VES HB FirstReceviedTime value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_FirstReceviedTime_Value_Label}

    Log  Check DashboardPage component VES HB LastReceviedTime
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_LastReceviedTime_Title_Label}
    Should Contain   ${dashboardpage_component}   Last Heartbeat Received Time

    Log  Check DashboardPage component VES HB LastSessRetryTime value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_LastSessRetryTime_Value_Label}

    Log  Check DashboardPage component VES HB LastSessRetryTime
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_HeartBeatIntervalCA_Title_Label}
    Should Contain   ${dashboardpage_component}   Heartbeat Period (minutes)

    Log  Check DashboardPage component VES HB LastSessRetryTime value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_HeartBeatInterval_Value_Label}

    Log  Check DashboardPage component VES HB LastSessRetryTime
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_HeartBeatMissingCountCA_Title_Label}
    Should Contain   ${dashboardpage_component}   Missing Heartbeat Count

    Log  Check DashboardPage component VES HB LastSessRetryTime value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_HeartBeatMissingCount_Value_Label}

DashboardPage component toplogy
    [Documentation]  DashboardPage component Topology
    Log  Check DashboardPage component Topology
    [Arguments]  ${local1_cuPlaneCA}    ${local2_cuPlaneCA}
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_DashBoard_Map_Title}
    Should Contain   ${dashboardpage_component}   Topology

    Log  Check DashboardPage component Topology cuUserPlaneCA
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_cuUserPlaneCA_Title_Label}
    Should Contain   ${dashboardpage_component}   ${local1_cuPlaneCA}

    Log  Check DashboardPage component Topology cuUserPlaneCA value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_DC_cuUserPlaneCA_Title_Value}

    Log  Check DashboardPage component Topology distributedUnitCA
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_distributedUnitCA_Title_Label}
    Should Contain   ${dashboardpage_component}   ${local2_cuPlaneCA}

    Log  Check DashboardPage component Topology distributedUnitCA value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_DC_distributedUnitCA_Title_Value}

    Log  Check DashboardPage component Topology Rp Status
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_CPUP_Rp_Status_Count_Display_Name}
    Should Contain   ${dashboardpage_component}   Radio Point

    #Log  Check DashboardPage component Topology Rp Status value
    #${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_DC_DU_CPUP_Rp_Status_Count_Display_Value}

DashboardPage component toplogy DU
    [Documentation]  DashboardPage component Topology DU
    Log  Check DashboardPage component Topology DU
    [Arguments]  ${local1_cuPlaneCA}    ${local2_cuPlaneCA}
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_DashBoard_Map_Title}
    Should Contain   ${dashboardpage_component}   Topology

    Log  Check DashboardPage component Topology cuControlPlaneCA DU
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_cuControlPlaneCA_Title_Label}
    Should Contain   ${dashboardpage_component}   ${local1_cuPlaneCA}

    Log  Check DashboardPage component Topology cuControlPlaneCA value DU
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_DC_cuControlPlaneCA_Title_Value}

    Log  Check DashboardPage component Topology cuUserPlaneCA DU
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_cuUserPlaneCA_Title_Label}
    Should Contain   ${dashboardpage_component}   ${local2_cuPlaneCA}

    Log  Check DashboardPage component Topology cuUserPlaneCA value DU
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_DC_cuUserPlaneCA_Title_Value}

    Log  Check DashboardPage component Topology Rp Status DU
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_DU_CPUP_Rp_Status_Count_Display_Name}
    Should Contain   ${dashboardpage_component}   Radio Point

    #Log  Check DashboardPage component Topology Rp Status value DU
    #${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_DC_DU_CPUP_Rp_Status_Count_Display_Value}

DashboardPage component details
    [Documentation]  DashboardPage component Details
    Log  Check DashboardPage component Details
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_DashBoard_DeviceDetails_Title}
    Should Contain   ${dashboardpage_component}   Details

    Log  Check DashboardPage component Details Friendly Name
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_userTag_title}
    Should Contain   ${dashboardpage_component}   Friendly Name

    Log  Check DashboardPage component Details Software version
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_SoftwareVersionCA_Title_Label}
    Should Contain   ${dashboardpage_component}   Software Version

    Log  Check DashboardPage component Details Software version value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_SoftwareVersion_Value_Label}

    Log  Check DashboardPage component Details First Activation Time
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_FirstActivationTime_Title_Label}
    Should Contain   ${dashboardpage_component}   First Reset Time

    Log  Check DashboardPage component Details First Activation Time value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_FirstActivationTime_Value_Label}

    Log  Check DashboardPage component Details First Boot Time
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_lastBoot_Time_Title_Label}
    Should Contain   ${dashboardpage_component}   Last Boot Time

    Log  Check DashboardPage component Details First Boot Time value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_lastBoot_Time_Value_Label}

    Log  Check DashboardPage component Details Last Activation Time
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_LastActivationTime_Title_Label}
    Should Contain   ${dashboardpage_component}   Last Reset Time

    Log  Check DashboardPage component Details Last Activation value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_LastActivationTime_Value_Label}

DashboardPage component x2 connection
    [Documentation]  DashboardPage component X2 Connections
    Log  Check DashboardPage component X2 Connections
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_DashBoard_Sector_Status_Title}
    Should Contain   ${dashboardpage_component}   X2 Connections

    Log  Check DashboardPage component X2 Connection ID
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_X2_CONNECTION_ID_Title}
    Should Contain   ${dashboardpage_component}   ID

    Log  Check DashboardPage component X2 Connection ID value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_DC_Dashboard_DUCellInuse_EPX2C}

    Log  Check DashboardPage component X2 Connection X2 IP Address
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_X2_IP_Address}
    Should Contain   ${dashboardpage_component}   X2 IP Address

    Log  Check DashboardPage component X2 Connection X2 IP Address value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_DC_Dashboard_DUCellInuse_EPX2C_remoteAddr}

    Log  Check DashboardPage component X2 connection X2 Connection Status
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_X2_Connection_Status_Title}
    Should Contain   ${dashboardpage_component}   X2 Connection Status

    Log  Check DashboardPage component X2 connection X2 Connection Status value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_LastActivationTime_Value_Label}

    Log  Check DashboardPage component X2 connection Associated BC
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Associated_BC}
    Should Contain   ${dashboardpage_component}   Associated Baseband Controller: MAC ID / Service Status

    Log  Check DashboardPage component X2 connection Associated BC value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_DMS_BC_MAIN_DATA}

DashboardPage component e1 connection
    [Documentation]  DashboardPage component e1 connection
    Log  Check DashboardPage component e1 connection
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_DashBoard_ConfigurationDetails_Title}
    Should Contain   ${dashboardpage_component}   E1 Connections

    Log  Check DashboardPage component e1 connection e1 address
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_remoteAddrCA_Title_Label}
    Should Contain   ${dashboardpage_component}   E1 Address

    Log  Check DashboardPage component e1 connection e1 address value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_remoteAddr_Value_Label}

    Log  Check DashboardPage component e1 connection status
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_stateCA_Title_Label}
    Should Contain   ${dashboardpage_component}   E1 Connection Status

    Log  Check DashboardPage component e1 connection status value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_state_Value_Label}

DashboardPage component cell details and inuse parameters
    [Documentation]  DashboardPage component cell details and inuse parameters
    Log  Check DashboardPage component cell details and inuse parameters
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_DashBoard_DUCellInuse_Status_Title}
    Should Contain   ${dashboardpage_component}   Cell Details and In Use Parameters

    Log  Check DashboardPage component cell details Status
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_DC_DashBoard_DUCellInuse_Status}
    Should Contain   ${dashboardpage_component}   Status

    Log  Check DashboardPage component cell 1 details status
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_STATUS_CELL1}
    Should Contain   ${dashboardpage_component}    1

    Log  Check DashboardPage component cell 2 details status
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_STATUS_CELL2}
    Should Contain   ${dashboardpage_component}    2

    Log  Check DashboardPage component cell 3 details status
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_STATUS_CELL3}
    Should Contain   ${dashboardpage_component}    3

    Log  Check DashboardPage component cell 4 details status
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_STATUS_CELL4}
    Should Contain   ${dashboardpage_component}    4

    Log  Check DashboardPage component cell details Provisioning
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_DC_DashBoard_DUCellInuse_Prov_Title}
    Should Contain   ${dashboardpage_component}   Provisioning

    Log  Check DashboardPage component cell 1 details Provisioning
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Provisioning_CELL1}
    #Should Contain Any   ${dashboardpage_component}    NA

    Log  Check DashboardPage component cell 2 details Provisioning
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Provisioning_CELL2}
    #Should Contain Any   ${dashboardpage_component}    NA

    Log  Check DashboardPage component cell 3 details Provisioning
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Provisioning_CELL3}
    #Should Contain Any   ${dashboardpage_component}    NA

    Log  Check DashboardPage component cell 4 details Provisioning
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Provisioning_CELL4}
    #Should Contain Any   ${dashboardpage_component}    NA

    Log  Check DashboardPage component cell details Administrative
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_DC_DashBoard_DUCellInuse_Administrative_Title}
    Should Contain   ${dashboardpage_component}   Administrative

    Log  Check DashboardPage component cell 1 details Administrative
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Administrative_CELL1}
    Should Contain Any   ${dashboardpage_component}    NA    UNLOCKED    LOCKED

    Log  Check DashboardPage component cell 2 details Administrative
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Administrative_CELL2}
    Should Contain Any   ${dashboardpage_component}    NA    UNLOCKED    LOCKED

    Log  Check DashboardPage component cell 3 details Administrative
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Administrative_CELL3}
    Should Contain Any   ${dashboardpage_component}    NA    UNLOCKED    LOCKED

    Log  Check DashboardPage component cell 4 details Administrative
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Administrative_CELL4}
    Should Contain Any   ${dashboardpage_component}    NA    UNLOCKED    LOCKED

    Log  Check DashboardPage component cell details Operational
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_DC_DashBoard_DUCellInuse_Operational_Title}
    Should Contain   ${dashboardpage_component}   Operational

    Log  Check DashboardPage component cell 1 details Operational
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Operational_CELL1}
    Should Contain Any   ${dashboardpage_component}    NA    ENABLED    DISABLED

    Log  Check DashboardPage component cell 2 details Operational
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Operational_CELL2}
    Should Contain Any   ${dashboardpage_component}    NA    ENABLED    DISABLED

    Log  Check DashboardPage component cell 3 details Operational
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Operational_CELL3}
    Should Contain Any   ${dashboardpage_component}    NA    ENABLED    DISABLED

    Log  Check DashboardPage component cell 4 details Operational
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Operational_CELL4}
    Should Contain Any   ${dashboardpage_component}    NA    ENABLED    DISABLED

    Log  Check DashboardPage component cell details Cell State
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_DC_DashBoard_DUCellInuse_Cell_State_Title}
    Should Contain   ${dashboardpage_component}   Cell State

    Log  Check DashboardPage component cell 1 details Cell State
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Cell_State_CELL1}
    Should Contain Any   ${dashboardpage_component}    NA    ACTIVE    INACTIVE    IDLE

    Log  Check DashboardPage component cell 2 details Cell State
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Cell_State_CELL2}
    Should Contain Any   ${dashboardpage_component}    NA    ACTIVE    INACTIVE    IDLE

    Log  Check DashboardPage component cell 3 details Cell State
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Cell_State_CELL3}
    Should Contain Any   ${dashboardpage_component}    NA    ACTIVE    INACTIVE    IDLE

    Log  Check DashboardPage component cell 4 details Cell State
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Cell_State_CELL4}
    Should Contain Any   ${dashboardpage_component}    NA    ACTIVE    INACTIVE    IDLE

    Log  Check DashboardPage component cell details Total RPs
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_DC_DashBoard_DUCellInuse_Total_RPs_Title}
    Should Contain   ${dashboardpage_component}   Total RPs / RP In Service

    Log  Check DashboardPage component cell 1 details Total RPs
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Total_RPs_CELL1}

    Log  Check DashboardPage component cell 2 details Total RPs
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Total_RPs_CELL2}

    Log  Check DashboardPage component cell 3 details Total RPs
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Total_RPs_CELL3}

    Log  Check DashboardPage component cell 4 details Total RPs
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Total_RPs_CELL4}

    Log  Check DashboardPage component cell details NR PCI
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_DC_Dashboard_DUCellInuse_nRPCI}
    Should Contain   ${dashboardpage_component}   NR PCI

    Log  Check DashboardPage component cell 1 details NR PCI
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_nRPCI_CELL1}

    Log  Check DashboardPage component cell 2 details NR PCI
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_nRPCI_CELL2}

    Log  Check DashboardPage component cell 3 details NR PCI
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_nRPCI_CELL3}

    Log  Check DashboardPage component cell 4 details NR PCI
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_nRPCI_CELL4}

    Log  Check DashboardPage component cell details Root Sequence Index
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_DC_DashBoard_DUCellInuse_RSI_Title}
    Should Contain   ${dashboardpage_component}   Root Sequence Index

    Log  Check DashboardPage component cell 1 details Root Sequence Index
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Root_Sequence_Index_CELL1}

    Log  Check DashboardPage component cell 2 details Root Sequence Index
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Root_Sequence_Index_CELL2}

    Log  Check DashboardPage component cell 3 details Root Sequence Index
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Root_Sequence_Index_CELL3}

    Log  Check DashboardPage component cell 4 details Root Sequence Index
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_CELL_DETAILS_Root_Sequence_Index_CELL4}

DashboardPage component du configuration
    [Documentation]  DashboardPage component DU Configuration
    Log  Check DashboardPage component DU Configuration
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_DashBoard_ConfigurationDetails_Title}
    Should Contain   ${dashboardpage_component}   DU Configuration

    Log  Check DashboardPage component DU Configuration F1 C Address
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_CELL_DETAILS_DUConfig_F1_C_Address}
    Should Contain   ${dashboardpage_component}   F1 C Address

    Log  Check DashboardPage component DU Configuration F1 C Address value
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_CELL_DETAILS_DUConfig_F1_C_Value}


DashboardPage component provisioned cell configuration
    [Documentation]  DashboardPage component provisioned cell configuration
    Log  Check DashboardPage component provisioned cell configuration
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_Prov_Cell_Configuration_Title}
    Should Contain   ${dashboardpage_component}   Provisioned Cell Configuration

    Log  Check DashboardPage component cell configuration Parameters
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_DC_Prov_Cell_Config_Parameters}
    Should Contain   ${dashboardpage_component}   Parameters

    Log  Check DashboardPage component cell 1 cell configuration Parameters
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_Parameters_CELL1}
    Should Contain Any   ${dashboardpage_component}    1

    Log  Check DashboardPage component cell 2 cell configuration Parameter
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_Parameters_CELL2}
    Should Contain Any   ${dashboardpage_component}    2

    Log  Check DashboardPage component cell 3 cell configuration Parameter
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_Parameters_CELL3}
    Should Contain Any   ${dashboardpage_component}    3

    Log  Check DashboardPage component cell 4 cell configuration Parameter
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_Parameters_CELL4}
    Should Contain Any   ${dashboardpage_component}    4

    Log  Check DashboardPage component cell configuration NR PCI
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_NR_PCI}
    Should Contain   ${dashboardpage_component}   NR PCI

    Log  Check DashboardPage component cell 1 Provisioned Cell Configuration NR PCI
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_NR_PCI_CELL1}

    Log  Check DashboardPage component cell 2 Provisioned Cell Configuration NR PCI
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_NR_PCI_CELL2}

    Log  Check DashboardPage component cell 3 Provisioned Cell Configuration NR PCI
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_NR_PCI_CELL3}

    Log  Check DashboardPage component cell 4 Provisioned Cell Configuration NR PCI
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_NR_PCI_CELL4}

    Log  Check DashboardPage component cell Provisioned Cell Configuration ARFCN DL
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_ARFCN_DL_Title}
    Should Contain   ${dashboardpage_component}   ARFCN DL

    Log  Check DashboardPage component cell 1 Provisioned Cell Configuration ARFCN DL
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_ARFCN_DL_CELL1}

    Log  Check DashboardPage component cell 2 Provisioned Cell Configuration ARFCN DL
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_ARFCN_DL_CELL2}

    Log  Check DashboardPage component cell 3 Provisioned Cell Configuration ARFCN DL
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_ARFCN_DL_CELL3}

    Log  Check DashboardPage component cell 4 Provisioned Cell Configuration ARFCN DL
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_ARFCN_DL_CELL4}

    Log  Check DashboardPage component cell Provisioned Cell Configuration ARFCN UL
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_ARFCN_UL_Title}
    Should Contain   ${dashboardpage_component}   ARFCN UL

    Log  Check DashboardPage component cell 1 Provisioned Cell Configuration ARFCN UL
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_ARFCN_UL_CELL1}

    Log  Check DashboardPage component cell 2 Provisioned Cell Configuration ARFCN UL
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_ARFCN_UL_CELL2}

    Log  Check DashboardPage component cell 3 Provisioned Cell Configuration ARFCN UL
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_ARFCN_UL_CELL3}

    Log  Check DashboardPage component cell 4 Provisioned Cell Configuration ARFCN UL
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_ARFCN_UL_CELL4}

    Log  Check DashboardPage component cell Provisioned Cell Configuration DL BS Channel BW
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_DL_BS_Channel_BW_Title}
    Should Contain   ${dashboardpage_component}   DL BS Channel BW

    Log  Check DashboardPage component cell 1 Provisioned Cell Configuration DL BS Channel BW
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_DL_BS_Channel_BW_CELL1}

    Log  Check DashboardPage component cell 2 Provisioned Cell Configuration DL BS Channel BW
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_DL_BS_Channel_BW_CELL2}

    Log  Check DashboardPage component cell 3 Provisioned Cell Configuration DL BS Channel BW
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_DL_BS_Channel_BW_CELL3}

    Log  Check DashboardPage component cell 4 Provisioned Cell Configuration DL BS Channel BW
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_DL_BS_Channel_BW_CELL4}

    Log  Check DashboardPage component cell Provisioned Cell Configuration UL BS Channel BW
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_UL_BS_Channel_BW_Title}
    Should Contain   ${dashboardpage_component}   UL BS Channel BW

    Log  Check DashboardPage component cell 1 Provisioned Cell Configuration UL BS Channel BW
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_UL_BS_Channel_BW_CELL1}

    Log  Check DashboardPage component cell 2 Provisioned Cell Configuration UL BS Channel BW
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_UL_BS_Channel_BW_CELL2}

    Log  Check DashboardPage component cell 3 Provisioned Cell Configuration UL BS Channel BW
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_UL_BS_Channel_BW_CELL3}

    Log  Check DashboardPage component cell 4 Provisioned Cell Configuration UL BS Channel BW
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_UL_BS_Channel_BW_CELL4}

    Log  Check DashboardPage component cell Provisioned Cell Configuration NR Frequency Band DL
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_NR_Freq_Band_DL}
    Should Contain   ${dashboardpage_component}   NR Frequency Band DL

    Log  Check DashboardPage component cell 1 Provisioned Cell Configuration NR Frequency Band DL
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_NR_Freq_Band_DL_CELL1}

    Log  Check DashboardPage component cell 2 Provisioned Cell Configuration NR Frequency Band DL
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_NR_Freq_Band_DL_CELL2}

    Log  Check DashboardPage component cell 3 Provisioned Cell Configuration NR Frequency Band DL
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_NR_Freq_Band_DL_CELL3}

    Log  Check DashboardPage component cell 4 Provisioned Cell Configuration NR Frequency Band DL
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_NR_Freq_Band_DL_CELL4}

    Log  Check DashboardPage component cell Provisioned Cell Configuration Root Sequence Index
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_Root_Sequence_Index_Title}
    Should Contain   ${dashboardpage_component}   Root Sequence Index

    Log  Check DashboardPage component cell 1 Provisioned Cell Configuration Root Sequence Index
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_Root_Sequence_Index_CELL1}

    Log  Check DashboardPage component cell 2 Provisioned Cell Configuration Root Sequence Index
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_Root_Sequence_Index_CELL2}

    Log  Check DashboardPage component cell 3 Provisioned Cell Configuration Root Sequence Index
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${XPATH_Prov_Cell_Config_Root_Sequence_Index_CELL3}

    Log  Check DashboardPage component cell 4 Provisioned Cell Configuration Root Sequence Index
    ${dashboardpage_component}=    Verify DashboardPage Generic components    ${XPATH_Prov_Cell_Config_Root_Sequence_Index_CELL4}

DashboardPage component history
    [Documentation]  DashboardPage component History
    Log  Check DashboardPage component History
    ${dashboardpage_component}=    Verify DashboardPage Generic components    ${ID_DC_Dashboard_Device_History}
    Should Contain   ${dashboardpage_component}   History

DashboardPage component pnp status
    [Documentation]  DashboardPage component PnP Status
    Log  Check DashboardPage component PnP Status
    ${dashboardpage_component}=    Verify DashboardPage Generic components    ${ID_DC_Dashboard_Devicepnpstatus}
    Should Contain   ${dashboardpage_component}   PnP Status

Verify DashboardPage Generic components
    [Arguments]  ${Generic_XPATH}
    Scroll Element Into View  ${Generic_XPATH}
    Wait Until Page Contains Element  ${Generic_XPATH}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${Generic_XPATH}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    ${dashboardpage_get_component} =   Get Text  ${Generic_XPATH}
    Log  ${dashboardpage_get_component}
    [Return]  ${dashboardpage_get_component}

DashboardPage component Service State
    [Documentation]  DashboardPage component Service State
    [Arguments]  ${device_productclass}    ${device_serialno}  ${device_servicestate}
    Log  Check DashboardPage component Service State
    ${dashboardpage_component}=    Verify DashboardPage Generic components  ${ID_DC_SummarySerStatus}
    Should Contain Any   ${dashboardpage_component}   ${device_servicestate}   Unknown


Verify Warning Sign in dashboard
    BuiltIn.Sleep  5s
    Wait Until Element Is Visible  ${XPATH_WARNING_ICON}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Scroll Element Into View  ${XPATH_WARNING_ICON}
    #Wait Until Page Contains Element  ${WARNING_REASON}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    #${value} =   Get Text  ${XPATH_WARNING_ICON}
    #Log  ${value}
    #Should Contain   ${value}   Some of the X2 connections are in non operational mode