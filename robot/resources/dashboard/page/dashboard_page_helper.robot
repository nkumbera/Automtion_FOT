*** Settings ***
Library             String
Variables           device_dashboard_ui_controls.py

*** Variables ***

*** Keywords ***
Dashboard Device InService Status
    [Documentation]  Check the Device Status
    Log  Check Dashboard Device Inservice Status
    Open Device Dashboard
    Wait Until Page Contains Element  ${XPATH_DMS_INSERVICE_TAG}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${XPATH_DMS_INSERVICE_TAG}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s

Open Device Dashboard
    [Documentation]  Open Device Console Dashboard Page
    Log  One Device Console Dashboard
    ${dashboard_url}=  Format String   ${DEVICE_DASHBOARD_DEVICE_URL}   dms_device_console=${DMS_UI_URL}    device_macid=${DEVICE_MACID}
    Go To  ${dashboard_url}
    Wait Until Element Is Visible  ${XPATH_DASHBOARD_HEADER_LABEL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${XPATH_DASHBOARD_HEADER_LABEL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s

Open Network Console Dashboard
    [Documentation]  Open Network Console Dashboard Page
    Log  One Network Console Dashboard
    Switch browser  ${NC_Window}
    ${dashboard_url}=  Format String   ${NETWORK_CONSOLE_DASHBOARD_URL}   dms_device_console=${DMS_NC_URL}
    Go To  ${dashboard_url}
    Wait Until Element Is Visible  ${XPATH_DASHBOARD_HEADER_LABEL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${XPATH_DASHBOARD_HEADER_LABEL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  3s

Verify Supported Radio Type In Dashboard
   [Documentation]  Verify Supported Radio Type
   [Arguments]  ${pr_type}
   Open Device Dashboard
   ${supported_radio_type} =   Get Text  ${XPATH_DASHBOARD_RADIO_POINT_TYPE_LABEL}
   Log  ${supported_radio_type}
   Should Contain   ${supported_radio_type}   ${pr_type}

Get Device Software Version
    [Documentation]  Get the software version of device
    Open Device Dashboard
    ${dev_software_version}=   Get DMS Element Text  ${XPATH_DASHBOARD_SOFWARE_VERSION_TEXT}
    [Return]  ${dev_software_version}

Create delta to check periodic flow
    Open Overridden Params Page
    Update Carrier Aggregation Downlink

Dashboard Device OutOfService Status
    [Documentation]  Check the Device Status
    Log  Check Dashboard Device OutOfService Status
    Open Device Dashboard
    Wait Until Page Contains Element  ${XPATH_DMS_OUTOFSERVICE_TAG}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${XPATH_DMS_OUTOFSERVICE_TAG}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  2s

get server time
   BuiltIn.Sleep  5s
   ${time_value}    get Text    ${XPATH_SERVER_TIME}
   Log    ${time_value}
   [Return]     ${time_value}


BC DashboardPage component Header
    [Documentation]     BC DashboardPage component Header
    Log  Check DashboardPage component Header
    ${dashboardpage_component1} =    Verify BC DashboardPage Generic components  ${ID_BC_Dashboard_Header}
    Should Contain   ${dashboardpage_component1}   Dashboard

BC DashboardPage component Summary
    [Documentation]     BC DashboardPage component summary
    [Arguments]    ${device_productclass}    ${device_serialno}
    Log  Check BC DashboardPage component summary
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components     ${ID_DC_SummarySerStatus}
    Should Contain Any   ${dashboardpage_component}     In Service    Ready    Out Of Service    Provisioning in Progress

    Log  Check DashboardPage component Title
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components     ${ID_DC_Summary_Title}
    Should Contain   ${dashboardpage_component}   Summary

    Log  Check DashboardPage component OUIPC
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components    ${ID_DC_SummaryOUIPC}
    Should Contain   ${dashboardpage_component}   ${device_productclass}-${device_serialno} (OUI-PC-MAC ID)

BC DashboardPage component Summary Details
    [Documentation]     DashboardPage component summary Details
    Log  Check DashboardPage component summary Details eNodeBName
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components    ${XPATH_DC_eNodeBNameCA_Title_Label}
    Should Contain   ${dashboardpage_component}    eNodeB Name

    Log  Check DashboardPage component summary Details Software Version
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components    ${ID_DC_SoftwareVersionCA_Title_Label}
    Should Contain   ${dashboardpage_component}   Software Version

    Log  Check DashboardPage component summary Details Software Version Value
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components    ${ID_DC_SoftwareVersion_Value_Label}
    #Should Contain Any   ${dashboardpage_component}    6.0.00    6.0.01    6.0.05

    Log  Check DashboardPage component summary Details Hardware Version
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components    ${ID_DC_HardwareVersionCA_Title_Label}
    Should Contain   ${dashboardpage_component}   Hardware Version

    #Log  Check DashboardPage component summary Details Hardware Version Value
    #${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${ID_DC_HeartBeatStatus_Value_Label}
    #Should Contain Any   ${dashboardpage_component}   NA    Not_Started    Started    Normal    Disabled    Critical    Tentative    Unmanaged

    Log  Check DashboardPage component summary Details Number of Active Alarms
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components    ${ID_DC_DvcAlarmsCountCA_Title_Label}
    Should Contain   ${dashboardpage_component}   Number of Active Alarms

    Log  Check DashboardPage component summary Details Number of Critical Alarms
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components    ${XPATH_Number_of_Critical_Alarm}

    Log  Check DashboardPage component summary Details Number of Major Alarms
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components    ${XPATH_Number_of_Major_Alarm}

    Log  Check DashboardPage component summary Details Number of Minor Alarms
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components    ${XPATH_Number_of_Minor_Alarm}

    Log  Check DashboardPage component summary Details Number of Warning Alarms
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components    ${XPATH_Number_of_Warning_Alarm}

    Log  Check DashboardPage component summary Details OAM IP
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components    ${ID_DC_LocalIPAddressTitle_Title_Label}
    Should Contain   ${dashboardpage_component}   OAM IP

    Log  Check DashboardPage component summary Details OAM IP Value
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components    ${ID_DC_LocalIPAddressTitle_Value_Label}
    #Should Contain Any   ${dashboardpage_component}    10.    11
    ${ip_value} =  GET value     ${ID_DC_LocalIPAddressTitle_Value_Label}
    Log     ${ip_value}
    #${pattern}=    Set Variable    "^\\d{1,3}.\\d{1,3}.\\d{1,3}.\\d{1,3}$"
    ${match} =    evaluate            re.match(r'\\d{1,3}\.\\d{1,3}\.\\d{1,3}\.\\d{1,3}', '''${ip_value}''').group(0)       re
    #${match} =    evaluate      re.match(r '\\d{1,3}.\\d{1,3}.\\d{1,3}.\\d{1,3}', '''${ip_value}''').group(0)     re
    Log    ${match}
    Log  Check DashboardPage component summary Details Access Utilities
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components    ${ID_DC_accessUtilities_Title_Label}
    Should Contain   ${dashboardpage_component}   Access Utilities

    Log  Check DashboardPage component summary Details Access Utilities Value
    BuiltIn.Sleep  5s
    #click dms button    ${ID_DC_accessUtilities_WebGUI_Label}
    Element Should Be Enabled     ${ID_DC_accessUtilities_WebGUI_Label}
    BuiltIn.Sleep  5s
    #click dms button    ${ID_DC_accessUtilities_SSH_Label}
    Element Should Be Enabled     ${ID_DC_accessUtilities_SSH_Label}


BC DashboardPage component Device Details
    [Documentation]  DashboardPage component Device Details
    [Arguments]     ${device_serialno}
    Log  Check DashboardPage component Device Details
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${ID_DC_DashBoard_DeviceDetails_Title}
    Should Contain   ${dashboardpage_component}   Device Details

    Log  Check DashboardPage component First Contact Time
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${ID_DC_FirstUseDate_Title_Label}
    Should Contain   ${dashboardpage_component}   First Contact Time

    Log  Check DashboardPage component Last Activation Time
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${ID_DC_LastActivationTime_Title_Label}
    Should Contain   ${dashboardpage_component}   Last Activation Time

    Log  Check DashboardPage component Last Contact Time
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${ID_DC_LastContactTime_Title_Label}
    Should Contain   ${dashboardpage_component}   Last Contact Time

    Log  Check DashboardPage component Local Time Zone
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${ID_DC_LocalTimeZoneTitle_Label}
    Should Contain   ${dashboardpage_component}   Local Time Zone

    Log  Check DashboardPage component netconf Factory Serial Number
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${ID_DC_FactorySerialNumberTitle_Label}
    Should Contain   ${dashboardpage_component}   Factory Serial Number

    Log  Check DashboardPage component netconf Factory Serial Number value
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${ID_DC_FactorySerialNumber_Value_Label}
    Should Contain   ${dashboardpage_component}   0005B9-PC-${device_serialno}

    Log  Check DashboardPage component Friendly Name
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${ID_DC_FriendlyName_Label}
    Should Contain   ${dashboardpage_component}   Friendly Name

BC DashboardPage component Timing Source In Use
    [Documentation]  DashboardPage component connectivity Timing Source In Use
    Log  Check DashboardPage component Timing Source In Use
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${ID_DC_Dashboard_TimingSrcInUse}
    Should Contain   ${dashboardpage_component}   Timing Source In Use

BC DashboardPage component RP Status Count
    [Documentation]  DashboardPage component connectivity RP Status Count
    Log  Check DashboardPage component RP Status Count
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${ID_DC_RP_Status_Count_Label}
    Should Contain   ${dashboardpage_component}   RP Status Count

BC DashboardPage component Provisioning Details
    [Documentation]  DashboardPage component Provisioning Details
    Log  Check DashboardPage component Provisioning Details
    Scroll Element Into View    ${XPATH_DC_ProLedTemp_Title}
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${XPATH_DC_ProLedTemp_Title}
    Should Contain   ${dashboardpage_component}   Provisioning Details

    Log  Check DashboardPage component Carrier Aggregation
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${XPATH_DC_downlinkCaEnableCA_Title_Label}
    Should Contain   ${dashboardpage_component}   Carrier Aggregation

    Log  Check DashboardPage component Number of Sectors
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${XPATH_DC_numSectorsPerBCCA_Title_Label}
    Should Contain   ${dashboardpage_component}   Number of Sectors

    Log  Check DashboardPage component Timing Source
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${XPATH_DC_PTP_SourceCA_Title_Label}
    Should Contain   ${dashboardpage_component}   Timing Source

    Log  Check DashboardPage component summary Details provisioning status
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${XPATH_DC_Provision_Status_Count_Label}
    Should Contain   ${dashboardpage_component}   Provisioning Status

    Log  Check DashboardPage component summary Details provisioning failed
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${XPATH_DC_Provision_Failed_Count_HLayout}

    Log  Check DashboardPage component summary Details provisioning delta
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${XPATH_DC_Provision_Delta_Count_HLayout}

    Log  Check DashboardPage component summary Details provisioning pending
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${XPATH_DC_Provision_Pending_Count_HLayout}

BC DashboardPage component Sector Details and In Use Parameters
    [Documentation]  DashboardPage component Sector Details and In Use Parameters
    Log  Check DashboardPage component Sector Details and In Use Parameters
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${XPATH_DC_DashBoard_Sector_Status_Title}
    Should Contain   ${dashboardpage_component}   Sector Details and In Use Parameters

    Log  Check DashboardPage component Details Sector1
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${XPATH_DC_Dashboard_SectorStatus_1}
    Should Contain   ${dashboardpage_component}   Sector1

    Log  Check DashboardPage component Details Sector2
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${XPATH_DC_Dashboard_SectorStatus_2}
    Should Contain   ${dashboardpage_component}   Sector2

BC DashboardPage component Map
    [Documentation]  DashboardPage component Map
    Log  Check DashboardPage component Map
    Scroll Element Into View    ${XPATH_DC_Dashboard_Map}
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components  ${XPATH_DC_Dashboard_Map}
    Should Contain   ${dashboardpage_component}   Map

BC DashboardPage component Device History
    [Documentation]  DashboardPage component Device History
    Log  Check DashboardPage component Device History
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components    ${ID_DC_Dashboard_Device_History}
    Should Contain   ${dashboardpage_component}   Device History

BC DashboardPage component Device PnP Status
    [Documentation]  DashboardPage component Device PnP Status
    Log  Check DashboardPage component Device PnP Status
    ${dashboardpage_component}=    Verify BC DashboardPage Generic components    ${ID_DC_Dashboard_Device_pnp_status}
    Should Contain   ${dashboardpage_component}   Device PnP Status


Verify BC DashboardPage Generic components
    [Arguments]  ${Generic_XPATH}
    Scroll Element Into View  ${Generic_XPATH}
    Wait Until Page Contains Element  ${Generic_XPATH}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${Generic_XPATH}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    ${dashboardpage_get_component} =   Get Text  ${Generic_XPATH}
    Log  ${dashboardpage_get_component}
    [Return]  ${dashboardpage_get_component}
