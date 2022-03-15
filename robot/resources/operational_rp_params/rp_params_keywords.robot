*** Settings ***
Resource    page/rp_params_helper.robot
#Resource    ../slamd/slamd_keywords.robot
Resource    ../ddlg/ddlg_keywords.robot
Resource    page/provisioning_helper.robot
#Resource    ../Timing_source/page/timing_source_page_helper.robot
Library     String
#Variables   ../Timing_source/testdata/timingSource_testdata.py

*** Variables ***



*** Keywords ***
Verify Operational RP Params
    [Documentation]  Verify PR Type
    [Arguments]   ${pr_type}
    #Open Browser    ${SMALD_SIMULATOR}  Chrome  alias=${SIM_Window}
    Open ddlg
    Maximize Browser Window
    ${rp_identifier}=  Get Slamd RU Discovery Serial Number
    Close Browser
    Device console Login
    Open Operational RP Params
    ${device_link} =  Format String  ${XPATH_RP_PRRAMS_DEVICE_LINK}  device_name=${rp_identifier}
    Wait Until Page Contains Element  ${device_link}
    Click DMS Element  ${device_link}
    BuiltIn.Sleep  3s
    ${current_url}=  Get Location
    Log  ${current_url}
    Verify PR Dashboard PR2000 Text
    #Open PR Dashboard


#<img class="v-image v-widget cgrp-enclosur-logoimg v-image-cgrp-enclosur-logoimg" src="http://10.212.2.245:7001/deviceconsole/VAADIN/themes/deviceconsole/images/RP2000-cgrp-Indoor-icon.png" alt="" xpath="1">

Verify Enclosure Indoor
    [Documentation]  Verify RP Enclosure Indoor
    Open Overridden RP Params
    Enclosure Type Appy Filter
    Verify Enclosure Type


Modify RP Location Information
    [Documentation]  Modify RP Location Information
    Open RP Provisioned Data
    Check Location value present
    Open Overridden RP Params
    Edit Attribute Location



Modify RP Tx Power Information
    [Documentation]  Modify RP Tx Power Information
    Open RP Provisioned Data
    Check RP value present
    Open Overridd en RP Params
    Edit Attribute RP Tx Power




Modify RP Auto Tx Power Information
    [Documentation]  Modify RP Auto Tx Power Information
    Open Overridden RP Params
    ${Auto_Tx_Power_value} =  Update AutoTx Power
    Set Global Variable      ${Auto_Tx_Power_value}
    #${Auto_Tx_Power_value}   Convert To Lowercase         ${Auto_Tx_Power_value}
    ${XAPTH_PROV_NAME}      set variable   Auto TX Power Enable
    Log           ${Auto_Tx_Power_value}
    Open Provisioning Status
    Verify Name AND Value       ${XAPTH_PROV_NAME}    ${Auto_Tx_Power_value}


#Verify Provisioning Status
#   [Documentation]  Verify Provisioning Status
#   [arguments]   ${Auto_Tx_Power_enable}  ${Auto_Tx_Power_enable}
#   Open Provisioning Status
#   Verify Name AND Value  ${Auto_Tx_Power_enable}  ${Auto_Tx_Power_enable}

RP Nominal GPS Configuration
    [Documentation]  RP Nominal GPS Configuration
    Open Overridden RP Params
    Edit RP Params
    Update GPS Configuration
    Save GPS Configuration

RP Nominal GPS Configuration Teardown
    [Documentation]  RP Nominal GPS Configuration
    Open Overridden RP Params
    Edit RP Params
    Update GPS Configuration Teardown
    Save GPS Configuration

Delete WEBGUI Location Parameter
    Open Webgui overridden RP Param
    Delete RP Webgui Location Parameter

Delete WEBGUI Tx_Power Parameter
    Open Webgui overridden RP Param
    Delete RP Webgui Tx_power Parameter

Delete WEBGUI RP Nominal GPS Parameter
    Open Webgui overridden RP Param
    Delete RP Webgui Nominal GPS Parameter