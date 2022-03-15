*** Settings ***
Resource            page/overwrite_params_helper.robot
Resource            ../provisioning/provisioning_keywords.robot
Variables           testdata/overridden_testdata.py
#Resource            ../page/bulk_configuration_helper.robot
#Resource            ../page/device_history/device_history_page_keywords.robot
#Variables           testdata/bulk_configure_testdata.py
Resource           ../resources/device_history/device_history_page_keywords.robot
Resource           ../resources/pnp/pnp_keywords.robot


*** Variables ***


*** Keywords ***
Update Overwirte Param Carrier Aggregation
    [Documentation]  Update Overwirte Param Carrier Aggregation
    Open Overridden Params Page
    ${downlink_ca_enable} =  Update Carrier Aggregation Downlink
    Verify Provisioning Status  Downlink CA Enable  ${downlink_ca_enable}

Update Mandatory Params
    [Documentation]  Update Mandatory Params In Respective Sector
    [Arguments]  ${sector}
    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  RF  scalar  ${RF_PARAM_DICT1}
    Update Overridden Parameter  ${sector}  PLMN  tabular  ${PLMN_PARAM_DICT1}
    Save Overriden Parameter
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}
    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  RF  scalar  ${RF_PARAM_DICT}
    Save DMS Overriden Parameter
    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  PLMN  tabular  ${PLMN_PARAM_DICT}
    Save DMS Overriden Parameter

Update Optional Params
    [Documentation]  Update Optional Params In Respective Sector
    [Arguments]  ${sector}
    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  eCSFB  scalar  ${ECSFB_PARAM_DICT1}
    Save Overriden Parameter
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}
    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  eCSFB  scalar  ${ECSFB_PARAM_DICT}
    Save DMS Overriden Parameter

Update Scalar Params
    [Documentation]  Update Scalar Params In Respective Sector
    [Arguments]  ${sector}
    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  RF  scalar  ${RF_PARAM_DICT1}
    Update Overridden Parameter  ${sector}  eCSFB  scalar  ${ECSFB_PARAM_DICT1}
    Save Overriden Parameter
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}
    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  RF  scalar  ${RF_PARAM_DICT}
    Save DMS Overriden Parameter
    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  eCSFB  scalar  ${ECSFB_PARAM_DICT}
    Save DMS Overriden Parameter

Update Tabular Params
    [Documentation]  Update Tabular Params In Respective Sector
    [Arguments]  ${sector}

    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  PLMN  tabular  ${PLMN_PARAM_DICT1}
    Update Overridden Parameter  ${sector}  LTE  tabular  ${LTE_PARAM_DICT1}
    Save Overriden Parameter
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}

    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  PLMN  tabular  ${PLMN_PARAM_DICT}
    Save DMS Overriden Parameter
    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  LTE  tabular  ${LTE_PARAM_DICT}
    Save DMS Overriden Parameter

Update eNodeB Mandatory Params
    [Documentation]  Update Mandatory Params In eNodeB Sector
    Open Overridden Params Page
    Update Overridden Parameter  eNodeB  Core Network Parameter  scalar  ${CNP_PARAM_DICT1}
    Save Overriden Parameter
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}

    Open Overridden Params Page
    Update Overridden Parameter  eNodeB  Core Network Parameter  scalar  ${CNP_PARAM_DICT}
    Save DMS Overriden Parameter

Update eNodeB Optional Params
    [Documentation]  Update Optional Params In eNodeB Sector

    Open Overridden Params Page
    Update Overridden Parameter  eNodeB  Carrier Aggregation  scalar  ${CA_PARAM_DICT1}
    Save Overriden Parameter
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}


    Open Overridden Params Page
    Update Overridden Parameter  eNodeB  Carrier Aggregation  scalar  ${CA_PARAM_DICT}
    Save DMS Overriden Parameter

Update eNodeB Scalar Params
    [Documentation]  Update Scalar Params In eNodeB Sector

    Open Overridden Params Page
    #Update Overridden Parameter  eNodeB  LTE Neighbor List  scalar  ${LTE_NL_PARAM_DICT1}
    Update Overridden Parameter  eNodeB  LTE X2 Configuration  scalar  ${LTE_NL_PARAM_DICT1}
    Save Overriden Parameter
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}

    Open Overridden Params Page
    #BuiltIn.Sleep  5s
    #${true_false}=  Get Value  ${XPATH_TRIGGER_CONFIG_VALUE}
    #${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 'TRUE'   Update Overridden Parameter  eNodeB  LTE Neighbor List  scalar  ${LTE_NL_PARAM_DICT}
    #...  ELSE  Update Overridden Parameter  eNodeB  LTE Neighbor List  scalar  ${LTE_NL_PARAM_DICT1}
    #Log  Setting Value to ${true_false}
    #Update Overridden Parameter  eNodeB  LTE Neighbor List  scalar  ${LTE_NL_PARAM_DICT}
    Update Overridden Parameter  eNodeB  LTE X2 Configuration  scalar  ${LTE_NL_PARAM_DICT}
    Save DMS Overriden Parameter

Update Delta DAS Driver Params
    [Documentation]  Update delta DAS Driver params value
    [Arguments]  ${sector}

    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  DAS  scalar  ${DAS_PARAM_DICT1}
    Save Overriden Parameter
    Replan Device
    BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}


    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  DAS  scalar  ${DAS_PARAM_DICT}
    Save DMS Overriden Parameter

Update Delta QAM Params
    [Documentation]  Update delta DL256QAM and UL64QAM params value
    [Arguments]  ${sector}

    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  QAM  scalar  ${QAM_PARAM_DICT1}
    Save Overriden Parameter
    Replan Device
    BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}

    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  QAM  scalar  ${QAM_PARAM_DICT}
    Save DMS Overriden Parameter

Update Delta NGRP Params
    [Documentation]  Update delta NGRP params value
    [Arguments]  ${sector}

    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  RP5000  scalar  ${RP5000_SCALAR_PARAM_DICT1}
    Save Overriden Parameter
    Replan Device
    BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}


    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  RP5000  scalar  ${RP5000_SCALAR_PARAM_DICT}
    Save DMS Overriden Parameter

Update Delta RP5000 Params
    [Documentation]  Update delta RP5000 params value
    [Arguments]  ${sector}

    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  Band Reservation   tabular  ${RP5000_TABULAR_PARAM_DICT1}
    Save Overriden Parameter
    Replan Device
    BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}


    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  Band Reservation   tabular  ${RP5000_TABULAR_PARAM_DICT}
    Save DMS Overriden Parameter

Update WhiteList RPs
    [Documentation]  Update Whitelist
    [Arguments]   ${sector_data}
    Open Overridden Params Page
    Insert PR WhiteList  ${sector_data}
    Verify Provisioning Status  WhiteListed Radio Units  ${sector_data}

Update gNB WhiteList RPs
    [Documentation]  Update Whitelist
    [Arguments]   ${sector_data}
    Open gNB Overridden Params Page    ${DEVICE_gNB_OVERIDDEN_PAGE_DU}
    Insert gNB RP WhiteList  ${sector_data}
    #Verify Provisioning Status  WhiteListed Radio Units  ${sector_data}

Delete WhiteList RPs
    Open Overridden Params Page
    Delete PR WhiteList
    Verify Provisioning Status  WhiteListed Radio Units  NONE

Delete parameters in sector1
    #[Arguments]  ${sector}
    Open Overridden Params Page
    Update Overridden Parameter  Sector 1  RF  scalar  ${RF_PARAM_DICT1}
    #Update Overridden Parameter  ${sector}  PLMN  tabular  ${PLMN_PARAM_DICT1}
    Save DMS Overriden Parameter
    Replan Device
    BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}
    #Verify Delta Provisioning Status
    Delete mandatory parameters in sector1

Delete parameters in sector2
    [Documentation]  Delete sector2
    [Arguments]  ${sector}
    Open Overridden Params Page
    #Update Overridden Parameter  ${sector}  eCSFB  scalar  ${ECSFB_PARAM_DICT1}
    #Save DMS Overriden Parameter
    #Replan Device
    #BuiltIn.Sleep  30s
    #Delete optional parameters in sector2

Delete param in sector_2
    Open Overridden Params Page
    Update Overridden Parameter  Sector 2  eCSFB  scalar  ${ECSFB_PARAM_DICT2}
    Save Overriden Parameter
    Replan Device
    BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}
    Delete optional parameters in sector2


Delete parameters in enodeB
    Open Overridden Params Page
    #Update Carrier Aggregation Downlink
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_OWP_CARRIER_AGGRE_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_OWP_FILTER_DROPDOWN_BUTTON}
    BuiltIn.Sleep  5s
    ${true_false}=  Get Value  ${XPATH_OWP_DOWNLINK_CA_VALUE_TO_GET}
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 'TRUE'   set variable   TRUE
    ...  ELSE  set variable  TRUE
    Log  Setting Value to ${true_false}
    ${xpath_string} =  Format String   ${XPATH_OWP_DOWNLINK_CA_VALUE}  value=${value_to_set}
    Log   Xpath ${xpath_string}
    Click DMS Element  ${xpath_string}
    Wait Until Element Is Not Visible   ${xpath_string}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_OWP_DEVICE_CONFIG_SAVE}
    Wait Until Element Is Enabled  ${XPATH_OWP_CARRIER_AGGRE_BUTTON}  ${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  5s
    Replan Device
    BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}
    Delete Optional parameters in enodeB

Update Admin Status
    [Documentation]  Update Mandatory Params In eNodeB Sector
    [Arguments]  ${sector}
    Open Overridden Params Page
    Update Overridden Parameter  Sector 1  Admin State   scalar  ${ADMIN_STATUS_DICT1}
    Save DMS Overriden Parameter
    Replan Device
    BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}

    Open Overridden Params Page
    Update Overridden Parameter  Sector 1  Admin State  scalar  ${ADMIN_STATUS_DICT}
    Save DMS Overriden Parameter
    Verify Delta Provisioning Status
    Verify Device Replan Status

Decrease eNodeB NoOfSector Parameter
    [Documentation]  Update sector Params In eNodeB
    Open Overridden Params Page
    Decrease NoOfSector Parameter  eNodeB  Sector Configuration   scalar
    Save Overriden Parameter
    Replan Device with Confirm
    BuiltIn.Sleep   ${REAl_DEVICE_RESET_TIMEOUT}

Increase eNodeB NoOfSector Parameter
    [Documentation]  Update sector Params In eNodeB
    Open Overridden Params Page
    Increase NoOfSector Parameter  eNodeB  Sector Configuration  scalar
    Save Overriden Parameter
    Replan Device with Confirm
    BuiltIn.Sleep   ${REAl_DEVICE_RESET_TIMEOUT}

Update eNodeB sector Params
    [Documentation]  Update sector Params In eNodeB
    Open Overridden Params Page
    Decrease NoOfSector Parameter   eNodeB  Sector Configuration  scalar
    Save Overriden Parameter
    Replan Device with Confirm
    #Replan Device
    BuiltIn.Sleep   ${REAl_DEVICE_RESET_TIMEOUT}

    Open Overridden Params Page
    Increase NoOfSector Parameter  eNodeB  Sector Configuration  scalar
    Save Overriden Parameter
    Replan Device with Confirm
    BuiltIn.Sleep   ${REAl_DEVICE_RESET_TIMEOUT}
    BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}

Update Carrier Aggregation
    Open Overridden Params Page
    #Update Carrier Aggregation Downlink
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_OWP_CARRIER_AGGRE_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_OWP_FILTER_DROPDOWN_BUTTON}
    BuiltIn.Sleep  5s
    ${true_false}=  Get Value  ${XPATH_OWP_DOWNLINK_CA_VALUE_TO_GET}
    ${value_to_set}=  RUN KEYWORD IF  '${true_false}' == 'TRUE'   set variable   TRUE
    ...  ELSE  set variable  TRUE
    Log  Setting Value to ${true_false}
    ${xpath_string} =  Format String   ${XPATH_OWP_DOWNLINK_CA_VALUE}  value=${value_to_set}
    Log   Xpath ${xpath_string}
    Click DMS Element  ${xpath_string}
    Wait Until Element Is Not Visible   ${xpath_string}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  5s
    Click DMS Element  ${ID_OWP_DEVICE_CONFIG_SAVE}
    Wait Until Element Is Enabled  ${XPATH_OWP_CARRIER_AGGRE_BUTTON}  ${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  5s
    Replan Device
    BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}

Update Sector Admin Status
    [Documentation]  Update Mandatory Params In eNodeB Sector
    [Arguments]  ${sector}    ${ADMIN_STATUS}
    ${ADMIN_STATUS1}=    set variable         ${ADMIN_STATUS}
    ${ADMIN_STATUS_DICTIONARY}    Create Dictionary    Admin State    ${ADMIN_STATUS1}
    ${type_ADMIN_STATUS_DICTIONARY}    Evaluate    type($ADMIN_STATUS_DICTIONARY)
    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  Admin State   scalar  ${ADMIN_STATUS_DICTIONARY}
    Save Overriden Parameter
    Replan Device
    BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}

Update Sector Cell Parameter
    Open Overridden Params Page
    #Update Overridden Parameter  Sector 1    RF Parameters Sector      scalar     ${CELL_VALUE}
    #Update Overridden Parameter  Sector 1    RF Parameters Sector      scalar     ${CELL_VALUE}
    Update Cell Identity    Sector 1    Cell Identity    ${cell_value_input}
    Save DMS Overriden Parameter
    Replan Device
    BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}

    Update Cell Identity    Sector 1    Cell Identity    ${cell_value_input}
    Save DMS Overriden Parameter
    Replan Device
    BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}


Update Tabular ACB Params
    [Documentation]  Update Tabular Params In Respective Sector
    [Arguments]  ${sector}

    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  PLMN  tabular  ${PLMN_PARAM_DICT1}
    Save DMS Overriden Parameter
    Replan Device
    BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}

    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  PLMN  tabular  ${PLMN_PARAM_DICT}
    Configure ACB
    Save DMS Overriden Parameter
    Verify Delta Provisioning Status
    Replan Device
    BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}


Update Tabular Params MultiBand and FreqBand
    [Documentation]  Update Tabular Params MultiBand and FreqBand In Sector 1
    [Arguments]  ${sector}

    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  LTE  tabular  ${LTE_PARAM_Multi_Fre_Band_DICT1}
    Update Multiband FALSE
    Save Overriden Parameter
    Replan Device
    BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}

    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  LTE  tabular  ${LTE_PARAM_Multi_Fre_Band_DICT}
    Update Multiband TRUE
    Save DMS Overriden Parameter

Update SPS Params
    [Documentation]  Update SPS Params
    [Arguments]  ${sector}

    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  SPS Parameters  scalar  ${SPS_Param_Dict_1}
    Save Overriden Parameter
    Replan Device
    BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}


    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  SPS Parameters  scalar  ${SPS_Param_Dict}
    Save DMS Overriden Parameter

Configure and Verify enodeb sector1 sector2 Param
    Open Overridden Params Page
    Update Overridden Parameter  eNodeB  Band Reservation   tabular  ${RP5000_TABULAR_PARAM_DICT1}
    Save Overriden Parameter
    Update Cell Identity    Sector 1    Cell Identity    ${cell_value_input}
    Save Overriden Parameter
    Update Overridden Parameter  Sector 2  RF  scalar  ${RF_PARAM_DICT1}
    Save Overriden Parameter
    Replan Device
    BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}

    Search DMS Overriden Parameter  eNodeB  Band Reservation
    BuiltIn.Sleep   2s
    Verify BandRseervation
    Search DMS Overriden Parameter  Sector 1    Cell Identity
    BuiltIn.Sleep   2s
    Verify Cell Identity
    Search DMS Overriden Parameter  Sector 2    Downlink Bandwidth
    BuiltIn.Sleep   2s
    Verify Frequency

    Search DMS Overriden Parameter  eNodeB  ${RP5000_PART_NO1}
    BuiltIn.Sleep   2s
    Verify BandRseervation Value
    Search DMS Overriden Parameter  Sector 1    ${cell_value_input}
    BuiltIn.Sleep   2s
    Verify Cell Identity Value
    Search DMS Overriden Parameter  Sector 2     ${DownlinkBandwidth1}
    BuiltIn.Sleep   2s
    Verify Frequency Value


Verify Blacklist Configured in PnP
    Open Device PNP Page
    Click enodeB Optional Conf Param
    Verify Blacklist Value

Update scalar Cat-M1 Params
    [Documentation]  Update Scalar Params In Respective Sector
    [Arguments]  ${sector}

    Open Overridden Params Page
    Update Overridden Parameter  ${sector}    CatM1    scalar    ${CATM1_DICT1}
    Save Overriden Parameter
    Replan Device
    BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}

    Open Overridden Params Page
    Update Overridden Parameter  ${sector}     CatM1    scalar    ${CATM1_DICT}
    Save DMS Overriden Parameter
    Verify Delta Provisioning Status
    Replan Device
    BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}

Update SPID Param
    [Documentation]  Update SPID param value
    [Arguments]  ${sector}
    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  SPID  scalar  ${SPID_PARAM_DICT1}
    Save Overriden Parameter
    BuiltIn.Sleep   2s
    Replan Device
    BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}

    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  SPID  scalar  ${SPID_PARAM_DICT}
    Save DMS Overriden Parameter
    BuiltIn.Sleep   2s

Verify SPID Param Value in Overridden Page
    Open Overridden Params Page
    BuiltIn.Sleep   3s
    Search DMS Overriden Parameter  eNodeB  SPID
    BuiltIn.Sleep   2s
    Verify SPID Param Value
    BuiltIn.Sleep   2s

Verify SPID Param Delta in Provisioning Page
    Open Provisioning Status
    click Delta param
    BuiltIn.Sleep   3s
    Search Delta Parameter in Provisioning Page  SPID
    BuiltIn.Sleep   2s
    SPID Value and Source Provisioning Page
    BuiltIn.Sleep   2s

Verify SPID Param in Provisioned Page
    BuiltIn.Sleep   3s
    Open Provisioned Data
    BuiltIn.Sleep   3s
    Search Provision Parameter  eNodeB  SPID
    BuiltIn.Sleep   2s
    SPID Value and Source in Provisioned Page
    BuiltIn.Sleep   2s

Verify SPID Configured in PnP Status
    Open Device PNP Page
    BuiltIn.Sleep   10s
    Click enodeB Optional Param
    BuiltIn.Sleep   5s
    Verify SPID Value in PnP Status
    BuiltIn.Sleep   5s

Update MIMO Param
    [Documentation]  Update MIMO param value
    [Arguments]  ${sector}
    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  MIMO  scalar  ${MIMO_PARAM_DICT1}
    Save Overriden Parameter
    BuiltIn.Sleep   2s
    Replan Device
    BuiltIn.Sleep   ${REAL_DEVICE_REPLAN_TIMEOUT}

    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  MIMO  scalar  ${MIMO_PARAM_DICT}
    Save DMS Overriden Parameter
    BuiltIn.Sleep   2s

Verify MIMO Param Value in Overridden Page
    Open Overridden Params Page
    BuiltIn.Sleep   3s
    Search DMS Overriden Parameter  Sector 1  MIMO
    BuiltIn.Sleep   2s
    Verify MIMO Param Value
    BuiltIn.Sleep   2s

Verify MIMO Param Delta in Provisioning Page
   Open Provisioning Status
    click Delta param
    BuiltIn.Sleep   3s
    Search Delta Parameter in Provisioning Page  MIMO
    BuiltIn.Sleep   2s
    MIMO Value and Source Provisioning Page
    BuiltIn.Sleep   2s

Verify MIMO Param in Provisioned Page
    BuiltIn.Sleep   3s
    Open Provisioned Data
    BuiltIn.Sleep   3s
    Search Provision Parameter  Sector 1  MIMO
    BuiltIn.Sleep   2s
    MIMO Value and Source in Provisioned Page
    BuiltIn.Sleep   2s

Verify MIMO Configured in PnP Status
    Open Device PNP Page
    BuiltIn.Sleep   4s
    Click Sector 1 Optional Param
    BuiltIn.Sleep   2s
    Verify MIMO Value in PnP Status
    BuiltIn.Sleep   2s

Verify DMS Overriden Params page Navigation
    Dashboard DMS Overriedn Params Status

Add DMS Overriden Parameter ENDCEnable Keywords
    Open Overridden Params Page
    Update Overridden Parameter  eNodeB  EN-DC  scalar  ${ENDCEnable_PARAM_DICT}
    Save Overriden Parameter


Add DMS Overriden Parameter ENDCX2 Keywords
    Open Overridden Params Page
    Update Overridden Parameter  eNodeB  EN-DC  scalar  ${ENDCX2_PARAM_DICT}
    Save Overriden Parameter

Update ENDC Param
    [Arguments]  ${sector}
    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  EN-DC  scalar  ${ENDCEnable_PARAM_DICT}
    Update Overridden Parameter  ${sector}  EN-DC  scalar  ${ENDCX2_PARAM_DICT}
    Save Overriden Parameter

Delete DMS Overriden Parameter ENDCEnable Keywords
    Open Overridden Params Page
    Delete DMS Overriden Parameter ENDCEnable Helper

Delete DMS Overriden Parameter ENDCX2 Keywords
    Open Overridden Params Page
    Delete DMS Overriden Parameter ENDCX2 Helper


Verify ENDCEnable Param Value in Overridden Page
    Open Overridden Params Page
    BuiltIn.Sleep   3s
    Search DMS Overriden Parameter  eNodeB  ENDC
    BuiltIn.Sleep   2s
    Verify ENDCEnable Param Value
    BuiltIn.Sleep   2s

Verify ENDCEnable Param Delta in Provisioning Page
    Open Provisioning Status
    click Delta param
    BuiltIn.Sleep   3s
    Search Delta Parameter in Provisioning Page  ENDC
    BuiltIn.Sleep   2s
    ENDCEnable Value and Source Provisioning Page
    BuiltIn.Sleep   2s

Verify ENDCEnable Configured in PnP Status
    Open Device PNP Page
    BuiltIn.Sleep   10s
    Click enodeB Optional Param
    BuiltIn.Sleep   5s
    Verify ENDCEnable Value in PnP Status
    BuiltIn.Sleep   5s

Verify ENDCEnable Param in Provisioned Page
    BuiltIn.Sleep   3s
    Open Provisioned Data
    BuiltIn.Sleep   3s
    Search Provision Parameter  eNodeB  ENDC
    BuiltIn.Sleep   2s
    ENDCEnable Value and Source in Provisioned Page
    BuiltIn.Sleep   2s


Update Physical Cell ID
    [Documentation]  Update Physical Cell ID
    [Arguments]  ${sector}
    Open Overridden Params Page
    Update Overridden Parameter  ${sector}  RF  scalar  ${RF_Physical_Cell_ID}
    Save Overriden Parameter
    Update Overridden Parameter  ${sector}  RF  scalar  ${RF_Physical_Cell_ID1}
    Save Overriden Parameter
    Verify Delta Provisioning Status
    Replan Device

Update S1 Signal Link Server List
    [Documentation]  S1 Signal Link Server List
    Open Overridden Params Page
    S1SigServerList_Value  ${S1SignalLinkServerList}
    Save Overriden Parameter
    S1SigServerList_Value  ${S1SignalLinkServerList1}
    Save Overriden Parameter
    Verify Delta Provisioning Status
    Replan Device
    #DC_S1SigServerList_Value_TextArea

Update File Server Details
    Open Overridden Params Page
    Search DMS Overriden Parameter  eNodeB    File Transfer
    Delete Enhanced File Transfer
    Update File Tansfer with Different File Type
    Update Enhanced File Transfer
    Save File Transfer changes

Update File Logs
    Open Overridden Params Page
    Search DMS Overriden Parameter  eNodeB    File Transfer
    Delete Activity Log
    Save File Transfer changes
    Replan Device
    Search DMS Overriden Parameter  eNodeB    File Transfer
    Select Activiy Log
    Save File Transfer changes
    Replan Device

Verify Provisioning log value
   BuiltIn.Sleep   3s
    Open Provisioned Data
    BuiltIn.Sleep   3s
    Search Provision Parameter  eNodeB    File Transfer
    Verify File Transfer Log value

Verify Provisioning File Type value
   BuiltIn.Sleep   3s
    Open Provisioned Data
    BuiltIn.Sleep   3s
    Search Provision Parameter  eNodeB    File Transfer
    Verify File Type value