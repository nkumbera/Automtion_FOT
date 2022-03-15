*** Settings ***
Resource            page/overwrite_params_helper.robot
Resource            ../provisioning/provisioning_keywords.robot
Variables           testdata/overridden_testdata.py
#Resource            ../page/bulk_configuration_helper.robot
#Resource            ../page/device_history/device_history_page_keywords.robot
#Variables           testdata/bulk_configure_testdata.py
Resource           ../resources/device_history/device_history_page_keywords.robot
Resource           ../resources/History_page/history_page_keywords.robot
Resource           ../resources/pnp/pnp_keywords.robot
Resource            ../Import/Import_helper.robot


*** Variables ***


*** Keywords ***

Update X2C and CA Param
    [Documentation]  Update X2C and CA param value

    Open Overridden Params Page
    #Update Overridden Parameter  X2C_CA  scalar  ${X2C_CA_PARAM_DICT1}
    #Save Overriden Parameter
    #BuiltIn.Sleep   2s
    #Replan Device
    #BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}

   #Open Overridden Params Page
    #Update Overridden Parameter  X2C_CA  scalar  ${X2C_CA_PARAM_DICT}
    #Save DMS Overriden Parameter
    #BuiltIn.Sleep   2s

Verify CUCP Subscription in PnP Status

    Open gNB Device PNP Page
    BuiltIn.Sleep   4s
    Click Notification Subscription
    BuiltIn.Sleep   2s
    Verify CUCP Notification Subscription Value in PnP Status
    BuiltIn.Sleep   2s

CUCP Subscription on Device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page  ${DEVICE_HiSTORY_PARAMETER_CU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Verify CUCP Notification Subscription Value in History  ${event_type}

Verify CUUP Subscription in PnP Status

    Open gNB Device PNP Page
    BuiltIn.Sleep   4s
    Click Notification Subscription
    BuiltIn.Sleep   2s
    Verify CUUP Notification Subscription Value in PnP Status
    BuiltIn.Sleep   2s

CUUP Subscription on Device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page  ${DEVICE_HiSTORY_PARAMETER_CU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Verify CUUP Notification Subscription Value in History  ${event_type}

Verify DU Subscription in PnP Status

    Open gNB Device PNP Page
    BuiltIn.Sleep   4s
    Click Notification Subscription
    BuiltIn.Sleep   2s
    Verify DU Notification Subscription Value in PnP Status
    BuiltIn.Sleep   2s

DU Subscription on Device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page  ${DEVICE_HiSTORY_PARAMETER_CU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Verify DU Notification Subscription Value in History  ${event_type}

MeNB X2C Value Change in Device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open Device History Page
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Verify MeNB X2C Value Change in History  ${event_type}

Verify X2C TIA PARAM in CUCP Provisioned Page
    Open gNB Provisioned Page  ${DEVICE_PROVSIONED_DATA_CUCP}
    Search gNB Provision Parameter  X2 Configuration
    Verify X2C Param in Provisioned Page

X2C TIA PARAM on Device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page  ${DEVICE_HiSTORY_PARAMETER_CU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Verify X2C TIA PARAM in History  ${event_type}

configure Heartbeat Params CU
    [Arguments]      ${VES_DICT_Heartbeat_DMS_Overridden}
    #Open gNB Overridden Params Page    ${DMS_DEVICE_URL}
    Update gNB Overriden Parameter    Heartbeat    scalar    ${VES_DICT_Heartbeat_DMS_Overridden}
    Save Overriden Parameter


Verify Delta Provisioning Status in pnp
    [Arguments]     ${DMS_URL}
    Open gNB Device PNP Page    ${DMS_URL}
    verify delta provisioning text

Verify value provisioned for Heartbeat Configuration
    [Arguments]     ${DMS_URL}
    open gNB Provisioning Data    ${DMS_URL}
    Search GNB CP DMS Overriden Parameter     Heartbeat Period
    Verify provisioned value for Heartbeat Period
    Get Heartbeat Interval value from Provisioned data page
    Get Heartbeat Interval value from dashboard
    Compare provisioned and dashboard values should be equal

Add DMS Overriden Parameter CUCP gNBID Keywords
    Open gNB Overridden Parameter Page
    Add gNB Overridden Parameter  ${gNBID_PARAM_DICT}  ${XPATH_DC_gNBId_TF}
    Save Overriden Parameter

Delete DMS Overriden Parameter CUCP gNBID Keywords
    Open gNB Overridden Parameter Page
    Delete gNB DMS Overriden Parameter  gNB ID
    Save Overriden Parameter

Add DMS Overriden Parameter CUCP PLMN Keywords
    Open gNB Overridden Parameter Page
    Load Provisioned Data    PLMN
    Save Overriden Parameter

Delete DMS Overriden Parameter CUCP PLMN Keywords
    Open gNB Overridden Parameter Page
    Delete gNB DMS Overriden Parameter  PLMN
    Save Overriden Parameter

Add DMS Overriden Parameter CUCP Cell Local ID Keywords
    Open gNB Overridden Parameter Page
    Add gNB Overridden Parameter  ${CellLocalID_PARAM_DICT}  ${XPATH_DC_NRCell_LocalId_TF}
    Save Overriden Parameter

Delete DMS Overriden Parameter CUCP Cell Local ID Keywords
    Open gNB Overridden Parameter Page
    Delete gNB DMS Overriden Parameter  Cell Local ID
    Save Overriden Parameter

Add DMS Overriden Parameter CUCP PLMNInfoList Keywords
    Open gNB Overridden Parameter Page
    Load Provisioned Data    PLMNInfoList
    Save Overriden Parameter

Delete DMS Overriden Parameter CUCP PLMNInfoList Keywords
    Open gNB Overridden Parameter Page
    Delete gNB DMS Overriden Parameter  PLMNInfoList
    Save Overriden Parameter

Add DMS Overriden Parameter CUCP X2 C Keywords
    Open gNB Entity Mapping Overridden Parameter Page
    Load Provisioned Data    X2 C
    Save Overriden Parameter

Delete DMS Overriden Parameter CUCP X2 C Keywords
    Open gNB Entity Mapping Overridden Parameter Page
    Delete gNB DMS Overriden Parameter  X2 C
    Save Overriden Parameter


Add DMS Overriden Parameter CUUP gNBID Keywords
    Open gNB Overridden Parameter Page
    Add gNB Overridden Parameter  ${gNBID_PARAM_DICT}  ${XPATH_DC_CUUP_gNBId_TF}
    Save Overriden Parameter

Delete DMS Overriden Parameter CUUP gNBID Keywords
    Open gNB Overridden Parameter Page
    Delete gNB DMS Overriden Parameter  gNB ID
    Save Overriden Parameter

Add DMS Overriden Parameter CUUP E1 Keywords
    Open gNB Overridden Parameter Page
    Load Provisioned Data    E1
    Save Overriden Parameter

Delete DMS Overriden Parameter CUUP E1 Keywords
    Open gNB Overridden Parameter Page
    Delete gNB DMS Overriden Parameter  E1
    Save Overriden Parameter


Add DMS Overriden Parameter DU gNBID Keywords
    Open gNB Overridden Parameter Page
    Add gNB Overridden Parameter  ${gNBID_PARAM_DICT}  ${XPATH_DC_gNBId_TF}
    Save Overriden Parameter

Delete DMS Overriden Parameter DU gNBID Keywords
    Open gNB Overridden Parameter Page
    Delete gNB DMS Overriden Parameter  gNB ID
    Save Overriden Parameter

Add DMS Overriden Parameter DU F1 C Keywords
    Open gNB Overridden Parameter Page
    Load Provisioned Data    F1 C
    Save Overriden Parameter

Delete DMS Overriden Parameter DU F1 C Keywords
    Open gNB Overridden Parameter Page
    Delete gNB DMS Overriden Parameter  F1 C
    Save Overriden Parameter

Add DMS Overriden Parameter DU PLMN Keywords
    Open gNB DU CELL1 Overridden Parameter Page
    Search DMS Overriden Parameter  Cell 1   PLMN
    Load Provisioned Data    PLMN
    Save Overriden Parameter

Delete DMS Overriden Parameter DU PLMN Keywords
    Open gNB DU CELL1 Overridden Parameter Page
    Search DMS Overriden Parameter  Cell 1   PLMN
    Delete gNB DMS Overriden Parameter  PLMN
    Save Overriden Parameter

Add DMS Overriden Parameter DU Cell Local ID Keywords
    Open gNB DU CELL1 Overridden Parameter Page
    Search DMS Overriden Parameter  Cell 1   Cell Local ID
    Add gNB Overridden Parameter  ${CellLocalID_PARAM_DICT}  ${XPATH_DC_cellLocalId_TF}
    Save Overriden Parameter

Delete DMS Overriden Parameter DU Cell Local ID Keywords
    Open gNB DU CELL1 Overridden Parameter Page
    Search DMS Overriden Parameter  Cell 1   Cell Local ID
    Delete gNB DMS Overriden Parameter  Cell Local ID
    Save Overriden Parameter

Add DMS Overriden Parameter DU NR PCI Keywords
    Open gNB DU CELL1 Overridden Parameter Page
    Search DMS Overriden Parameter  Cell 1   NR PCI
    Add gNB Overridden Parameter  ${NRPCI_PARAM_DICT}  ${XPATH_DC_nRPCI_TF}
    Save Overriden Parameter

Delete DMS Overriden Parameter DU NR PCI Keywords
    Open gNB DU CELL1 Overridden Parameter Page
    Search DMS Overriden Parameter  Cell 1   NR PCI
    Delete gNB DMS Overriden Parameter  NR PCI
    Save Overriden Parameter

Add DMS Overriden Parameter DU ARFCN DL Keywords
    Open gNB DU CELL1 Overridden Parameter Page
    Search DMS Overriden Parameter  Cell 1   ARFCN DL
    Add gNB Overridden Parameter  ${ARFCNDL_PARAM_DICT}  ${XPATH_DC_arfcnDL_TF}
    Save Overriden Parameter

Delete DMS Overriden Parameter DU ARFCN DL Keywords
    Open gNB DU CELL1 Overridden Parameter Page
    Search DMS Overriden Parameter  Cell 1   ARFCN DL
    Delete gNB DMS Overriden Parameter  ARFCN DL
    Save Overriden Parameter

Add DMS Overriden Parameter DU ARFCN UL Keywords
    Open gNB DU CELL1 Overridden Parameter Page
    Search DMS Overriden Parameter  Cell 1   ARFCN UL
    Add gNB Overridden Parameter  ${ARFCNUL_PARAM_DICT}  ${XPATH_DC_arfcnUL_TF}
    Save Overriden Parameter

Delete DMS Overriden Parameter DU ARFCN UL Keywords
    Open gNB DU CELL1 Overridden Parameter Page
    Search DMS Overriden Parameter  Cell 1   ARFCN UL
    Delete gNB DMS Overriden Parameter  ARFCN UL
    Save Overriden Parameter

Add DMS Overriden Parameter DU DL BS Channel BW Keywords
    Open gNB DU CELL1 Overridden Parameter Page
    Search DMS Overriden Parameter  Cell 1   DL BS Channel BW
    Add gNB Overridden Parameter  ${DLBSChannelBW_PARAM_DICT}  ${XPATH_DC_bSChanBwDL_TF}
    Save Overriden Parameter

Delete DMS Overriden Parameter DU DL BS Channel BW Keywords
    Open gNB DU CELL1 Overridden Parameter Page
    Search DMS Overriden Parameter  Cell 1   DL BS Channel BW
    Delete gNB DMS Overriden Parameter  DL BS Channel BW
    Save Overriden Parameter

Add DMS Overriden Parameter DU UL BS Channel BW Keywords
    Open gNB DU CELL1 Overridden Parameter Page
    Search DMS Overriden Parameter  Cell 1   UL BS Channel BW
    Add gNB Overridden Parameter  ${ULBSChannelBW_PARAM_DICT}  ${XPATH_DC_bSChanBwUL_TF}
    Save Overriden Parameter

Delete DMS Overriden Parameter DU UL BS Channel BW Keywords
    Open gNB DU CELL1 Overridden Parameter Page
    Search DMS Overriden Parameter  Cell 1   UL BS Channel BW
    Delete gNB DMS Overriden Parameter  UL BS Channel BW
    Save Overriden Parameter

Add DMS Overriden Parameter DU NR Frequency Band DL Keywords
    Open gNB DU CELL1 Overridden Parameter Page
    Search DMS Overriden Parameter  Cell 1   NR Frequency Band DL
    Add gNB Overridden Parameter  ${NRFrequencyBandDL_PARAM_DICT}  ${XPATH_DC_nRFreqBandDL_TF}
    Save Overriden Parameter

Delete DMS Overriden Parameter DU NR Frequency Band DL Keywords
    Open gNB DU CELL1 Overridden Parameter Page
    Search DMS Overriden Parameter  Cell 1   NR Frequency Band DL
    Delete gNB DMS Overriden Parameter  NR Frequency Band DL
    Save Overriden Parameter

Add DMS Overriden Parameter DU Root Sequence Index Keywords
    Open gNB DU CELL1 Overridden Parameter Page
    Search DMS Overriden Parameter  Cell 1   Root Sequence Index
    Add gNB Overridden Parameter  ${RootSequenceIndex_PARAM_DICT}  ${XPATH_DC_RSI_TF}
    Save Overriden Parameter

Delete DMS Overriden Parameter DU Root Sequence Index Keywords
    Open gNB DU CELL1 Overridden Parameter Page
    Search DMS Overriden Parameter  Cell 1   Root Sequence Index
    Delete gNB DMS Overriden Parameter  Root Sequence Index
    Save Overriden Parameter

Verify gNBID Param Value in Overridden Page
    Open gNB Overridden Params Page    ${gNB_DEVICE_OVERWRRIDDEN_PARAMETER_URL}
    BuiltIn.Sleep   3s
    Search gNB DMS Overriden Parameter  gNB ID
    BuiltIn.Sleep   2s
    Verify Param Value  ${XPATH_DC_gNBId_TF}  ${gNBID_PARAM_DICT}
    BuiltIn.Sleep   2s


configure whitelst Params DU
    [Arguments]      ${Whitelist_DMS_Overridden}
    Open gNB Overridden Params Page    ${DEVICE_gNB_OVERIDDEN_PAGE_DU}
    Search gNB DMS Overriden Parameter  WhiteList RPs
    Update WhiteList value    ${Whitelist_DMS_Overridden}
    #Save gNB Overriden Parameter

Verify value provisioned for Whitelist Configuration
    [Arguments]     ${DMS_URL}    ${value_whitelist}
    open gNB Provisioning Data    ${DMS_URL}
    Search GNB DMS Overriden Parameter   WhiteList
    Verify provisioned Whitelist value gNB    ${value_whitelist}

Override CP HBPeriod and gNBName
    #[arguments]   ${XPATH_HBPeriod_EnterCP}    ${XPATH_gNBNameCP}
    Search gNB DMS Overriden Parameter    Heartbeat Period
    Modify HB    ${XPATH_HBPeriod_EnterCP}
    Search gNB DMS Overriden Parameter    gNB Name
    BuiltIn.Sleep   2s
    Modify gNBName    ${XPATH_gNBNameCP}
    BuiltIn.Sleep   2s
    Save Overriden Parameter
    BuiltIn.Sleep   2s

Override UP HBPeriod and gNBName
    Search gNB DMS Overriden Parameter    Heartbeat Period
    Modify HB    ${XPATH_HBPeriod_EnterUP}
    Search gNB DMS Overriden Parameter    gNB Name
    Modify gNBName    ${XPATH_gNBNameUP}
    BuiltIn.Sleep   2s
    Save Overriden Parameter
    BuiltIn.Sleep   2s

Override DU HBPeriod and gNBName
    Search gNB DMS Overriden Parameter    Heartbeat Period
    Modify HB    ${XPATH_HBPeriod_EnterDU}
    Search gNB DMS Overriden Parameter    gNB Name
    Modify gNBName    ${XPATH_gNBNameDU}
    BuiltIn.Sleep   2s
    Save Overriden Parameter
    BuiltIn.Sleep   2s

Deleting CP HB Period and gNBName
    Search gNB DMS Overriden Parameter    Heartbeat Period
    Delete HBPeriod    ${XPATH_HBPeriod_EnterCP}
    Search gNB DMS Overriden Parameter    gNB Name
    Delete gNBName

Deleting UP HB Period and gNBName
    Search gNB DMS Overriden Parameter    Heartbeat Period
    Delete HBPeriod    ${XPATH_HBPeriod_EnterUP}
    Search gNB DMS Overriden Parameter    gNB Name
    Delete gNBName

Deleting DU HB Period and gNBName
    Search gNB DMS Overriden Parameter    Heartbeat Period
    Delete HBPeriod    ${XPATH_HBPeriod_EnterDU}
    Search gNB DMS Overriden Parameter    gNB Name
    Delete gNBName

Verify HB Provisioning details
    Open gNB Device PNP Page
    HB gNBName PnP Status Verify

Verify HB Provisioned page
    Search gNB Provision Parameter    Heartbeat Period
    Provisioned page verify HBPeriod
    Search gNB Provision Parameter    gNB Name
    Provisioned page verify gNBName

Verify gNBName Provisioning details
    Open gNB Device PNP Page
    verify delta provisioning text

Verify HB gNBName in device history CU
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page  ${DEVICE_HiSTORY_PARAMETER_CU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Device History CU gNBName Details   ${XPATH_HISTORY_PROVISIONING1}
    Device History CU HB Details    ${XPATH_HISTORY_PROVISIONING1}

Verify HB gNBName in device history UP
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page  ${DEVICE_HiSTORY_PARAMETER_CU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Device History CU gNBName Details   ${XPATH_HISTORY_UPPROVISIONING1}
    Device History CU HB Details    ${XPATH_HISTORY_UPPROVISIONING2}

Verify HB gNBName in device history DU
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page  ${DEVICE_HiSTORY_PARAMETER_DU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Device History DU gNBName Details   ${XPATH_HISTORY_UPPROVISIONING2}
    Device History DU HB Details    ${XPATH_HISTORY_UPPROVISIONING1}

#Import Entity Mapping file
 #   Open File Import Page
  #  Select and import Entity Mapping file

#Verify Operation History for Entity Mapping import
 #   [Arguments]  ${optype}
  #  BuiltIn.Sleep  50s
   # Open Operation History
    #BuiltIn.Sleep  20s
    #Search Operation Type in History  ${optype}
    #BuiltIn.Sleep  5s
    #Verify Operation History values for Entity Mapping import
    #BuiltIn.Sleep  2s

Verify X2C Param Delta in Provisioning Page
    BuiltIn.Sleep   5s
    Click Delta Param icon from Dashboard
    BuiltIn.Sleep   3s
    Search Delta Parameter in Provisioning Page  IP Address
    BuiltIn.Sleep   2s
    X2C Delta Provisioning Page
    BuiltIn.Sleep   2s
Verify X2C Delete Param Delta in Provisioning Page
    BuiltIn.Sleep   10s
    Click Delta Param icon from Dashboard
    BuiltIn.Sleep   3s
    Search Delta Parameter in Provisioning Page  X2 C
    BuiltIn.Sleep   2s
    X2C Delete Delta Provisioning Page
    BuiltIn.Sleep   2s

Verify Topology Navigation from dashboard
    BuiltIn.Sleep   2s
    Click CUUP device from Topology
    BuiltIn.Sleep   2s
    Click DU device from Topology
    BuiltIn.Sleep   2s
    Click CUCP device from Topology
    BuiltIn.Sleep   2s
    Click RP device from Topology
    BuiltIn.Sleep   2s
configure X2C and CA Params CU-CP
    [Documentation]  configure X2C and CA Params CU-CP

    [Arguments]      ${X2C_DMS_Overridden}      ${CA_DMS_Overridden}
    #Open gNB Overridden Params Page    ${DMS_DEVICE_URL}
    Update gNB Overriden Parameter    X2C IPSec Gateway Server    tabular    ${X2C_DMS_Overridden}
    Save Overriden Parameter

    Update gNB Overriden Parameter    CA IPSec Gateway Server    tabular    ${CA_DMS_Overridden}
    Save Overriden Parameter
Verify X2C SGW and CA Delta in CU-CP Provisioning Page
    BuiltIn.Sleep   5s
    Click Delta Param icon
    BuiltIn.Sleep   3s
    Search gNB Delta Parameter in Provisioning Page  Secgw
    BuiltIn.Sleep   2s
    X2C SGW and CA Param Delta Provisioning Page

Delete X2C and CA Params CU-CP
    BuiltIn.Sleep   2s
    Delete gNB DMS Overriden Parameter  X2C IPSec Gateway Server
    BuiltIn.Sleep  5s
    Click DMS Element   ${XPATH_ORP_PARAM_SAVE_BUTTON}
    Delete gNB DMS Overriden Parameter  CA IPSec Gateway Server
    BuiltIn.Sleep  5s
    Click DMS Element   ${XPATH_ORP_PARAM_SAVE_BUTTON}


Delete whitelst Params DU
    Open gNB Overridden Params Page    ${DEVICE_gNB_OVERIDDEN_PAGE_DU}
    BuiltIn.Sleep   2s
    Search gNB DMS Overriden Parameter     WhiteList
    Delete whitelist
    Save Overriden Parameter

Verify Delete Whitelist Configuration
    [Arguments]      ${DMS_URL}      ${value_whitelist}
    open gNB Provisioning Data    ${DMS_URL}
    Search GNB DMS Overriden Parameter   WhiteList
    Verify Delete provisioned Whitelist value gNB    ${value_whitelist}

CUCP Subscription and replay notifications on Device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page  ${DEVICE_HiSTORY_PARAMETER_CU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Verify CUCP and replay Notification Subscription Value in History  ${event_type}

CUUP Subscription and replay notifications on Device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page  ${DEVICE_HiSTORY_PARAMETER_CU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Verify CUUP and replay Notification Subscription Value in History  ${event_type}

DU Subscription and replay notifications on Device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page  ${DEVICE_HiSTORY_PARAMETER_CU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Verify DU and replay Notification Subscription Value in History  ${event_type}

DU Replay notification value in Device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page  ${DEVICE_HiSTORY_PARAMETER_DU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Select Device History Items per Page
    DU Replay notification in Device History

Verify UserDefinedFlag
    Open gNB Device PNP Page
    Select and Verify DMS Activation Flag

Verify Last Established time
    ${Time}=    Dashboard page login    ${DEVICE_gNB_DASHBOARD_PAGE_CU}
    Log    ${Time}
    [Return]     ${Time}

Configure ves value in Device console and reboot
    Open gNB Overridden Parameter Page
    Delete gNB DMS VES Overriden Parameter    VES
    Save gNB Overriden Parameter
    Reboot gNB Device
    Search gNB CP DMS Overriden Parameter    VES
    #update DMS ves values cucp     http://10.211.1.11:7001/eventListener/v21    admin123   admin1234
    update DMS ves values cucp     ${url_ves_DMS_value1}    ${Username_ves_DMS_value1}    ${Password_ves_DMS_value1}
    Save gNB Overriden Parameter

Verify gNB provisioned value for ves after reboot
    [arguments]  ${DEVICE_gNB_PROVISIONING_DATA_PAGE}
    Open gNB Provisioning Data    ${DEVICE_gNB_PROVISIONING_DATA_PAGE}
    Search gNB CP DMS Overriden Parameter     VES
    Verify ves provisioned value after reboot

Verify Device Console Server Time
    ${DeviceConsole_server_time}=    Get Device cnsole server time
    Log   ${DeviceConsole_server_time}
    [Return]     ${DeviceConsole_server_time}


Verify Replan required tag
    Replan required tag CP

Verify Replan required tag UP
    Replan required tag UP