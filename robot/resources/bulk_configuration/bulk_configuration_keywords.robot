*** Settings ***
Resource            page/bulk_configuration_helper.robot
Resource            ../provisioning/provisioning_keywords.robot
Variables           testdata/bulk_configure_testdata.py

*** Variables ***


*** Keywords ***

Bulk Configure pre-requsite
    Switch To DMS Network Console Window
    Open Bulk Device Configuration Page
    #Select Device Type and Software Version  0005B9-LTE_Enterprise_C-RANSC_Cntrl    From 4.5.0 and up to 4.5.*
    #Select Device Type and Software Version  0005B9-LTE_Enterprise_C-RANSC_Cntrl    From 5.5.0 and up to 5.5.*
    Select Device Type and Software Version  0005B9-LTE_Enterprise_C-RANSC_Cntrl    From 5.5.0 and up to 6.0.0
    Update Overridden Parameters For devices
    Select Device From Device List  ${BULK_CONFIG_DICT['Device Filter']}
    Replan the devices


Bulk Configure DMS Overridden Parameters
    [Documentation]  Bulk Configure DMS Overridden Parameters
    Switch To DMS Network Console Window
    Open Bulk Device Configuration Page
    #Select Device Type and Software Version  0005B9-LTE_Enterprise_C-RANSC_Cntrl    From 4.5.0 and up to 4.5.*
    #Select Device Type and Software Version  0005B9-LTE_Enterprise_C-RANSC_Cntrl    From 5.5.0 and up to 5.5.*
    Select Device Type and Software Version  0005B9-LTE_Enterprise_C-RANSC_Cntrl    From 5.5.0 and up to 6.0.0
    Update Overridden Parameters For All Sectors
    Select Device From Device List  ${BULK_CONFIG_DICT['Device Filter']}
    #Switch To DMS Window

Replan the devices
    [Documentation]  Verify Delta Provisioning Status From List Of Device
    #Switch To DMS Window
    #DMS UI Login
    Open Browser      ${DMS_UI_URL}     Chrome     alias=${DMS_Window}
    Maximize Browser Window
    Wait Until Page Contains Element        ${ID_DMS_LOGIN_USER}    timeout=${BROWSER_ELEMENT_TIMEOUT}
    Input Text     ${ID_DMS_LOGIN_USER}     ${DMS_UI_USER}
    Input Password     ${ID_DMS_LOGIN_PASSWORD}     ${DMS_UI_PASSWORD}
    Click Button      ${ID_DMS_LOGIN_SIGNIN}
    FOR    ${macid}    IN    @{BULK_CONFIG_DICT['Device MACID List']}
        set suite variable  ${DEVICE_MACID}  ${macid}
        Login with Device ID  ${macid}
        #Verify Delta Provisioning Status
        Replan Device
    END
    Close Browser


Verify Delta Provisioning Status From List Of Device
    [Documentation]  Verify Delta Provisioning Status From List Of Device
    #Switch To DMS Window
    #DMS UI Login
    Open Browser      ${DMS_UI_URL}     Chrome     alias=${DMS_Window}
    Maximize Browser Window
    Wait Until Page Contains Element        ${ID_DMS_LOGIN_USER}    timeout=${BROWSER_ELEMENT_TIMEOUT}
    Input Text     ${ID_DMS_LOGIN_USER}     ${DMS_UI_USER}
    Input Password     ${ID_DMS_LOGIN_PASSWORD}     ${DMS_UI_PASSWORD}
    Click Button      ${ID_DMS_LOGIN_SIGNIN}
    FOR    ${macid}    IN    @{BULK_CONFIG_DICT['Device MACID List']}
        set suite variable  ${DEVICE_MACID}  ${macid}
        Login with Device ID  ${macid}
        Verify Delta Provisioning Status
    END

Bulk Configure Select Device
    #Switch To DMS Network Console Window
    Open Bulk Device Configuration Page
    #Select Device Type and Software Version  0005B9-LTE_Enterprise_C-RANSC_Cntrl    From 4.5.0 and up to 4.5.*
    #Select Device Type and Software Version  0005B9-LTE_Enterprise_C-RANSC_Cntrl    From 5.5.0 and up to 5.5.*
    Select Device Type and Software Version  0005B9-LTE_Enterprise_C-RANSC_Cntrl    From 5.5.0 and up to 6.0.0
    Update Core Parameters For devices
    BuiltIn.Sleep  30s
    Add Device for configuration    ${Network_Param_config_mac}

Initiate Network Proactive Job
    Open Proactive job
    Create Proactive job    ${Network_Job_name}    ${Network_Operation_type}
    Add Device for configuration Proactive Job    ${Network_Param_config_mac}

Initiate Device Proactive Job
    Open Proactive job
    Create Proactive job    ${Device_Job_name}    ${Device_Operation_type}
    Add Device for configuration Proactive Job    ${Device_Param_config_mac}

Delete already created Proactive Job
    Open Proactive job
    Search Device Proactive job

Delete already created Network Proactive Job
     Open Proactive job
     Search Network Proactive job

Bulk Configure Param and Select Device
    Open Bulk Device Configuration Page
    #Select Device Type and Software Version  0005B9-LTE_Enterprise_C-RANSC_Cntrl    From 4.5.0 and up to 4.5.*
    #Select Device Type and Software Version  0005B9-LTE_Enterprise_C-RANSC_Cntrl    From 5.5.0 and up to 5.5.*
    Select Device Type and Software Version  0005B9-LTE_Enterprise_C-RANSC_Cntrl    From 5.5.0 and up to 6.0.0
    Update RF Parameters For devices
    Add Device for configuration     ${Device_Param_config_mac}

Verify Device Param Delta
    Device console Login
    Login with Device ID  ${Device_Param_config_mac}
    set suite variable  ${DEVICE_MACID}  ${Device_Param_config_mac}
    Verify Delta Provisioning Status

Verify Network Param Delta
    Device console Login
    Login with Device ID  ${Network_Param_config_mac}
    set suite variable  ${DEVICE_MACID}  ${Network_Param_config_mac}
    Verify Delta Provisioning Status

Device Param Prerequsite Configuration
    Device console Login
    Login with Device ID  ${Device_Param_config_mac}
    set suite variable  ${DEVICE_MACID}  ${Device_Param_config_mac}
    Open Overridden Params Page
    Update Overridden Parameter  Sector 1  RF  scalar  ${RF_PARAM_DICT}
    Save Overriden Parameter
    Replan Device
    BuiltIn.Sleep  30s

Network Param Prerequsite Configuration
    Device console Login
    Login with Device ID  ${Network_Param_config_mac}
    set suite variable  ${DEVICE_MACID}  ${Network_Param_config_mac}
    Open Overridden Params Page
    Update Overridden Parameter  eNodeB    Core    scalar  ${Core_Network_parameter_dict}
    Save Overriden Parameter
    Replan Device
    BuiltIn.Sleep  30s

Verify Device Param Provisioing Status
    Device console Login
    Login with Device ID  ${Device_Param_config_mac}
    set suite variable  ${DEVICE_MACID}  ${Device_Param_config_mac}
    Verify PNP Workflow Status
    Open Provisioned Data
    Verify Provisioned values    Sector 1     RF Parameters


Verify Network Param Provisioing Status
    Device console Login
    Login with Device ID  ${Network_Param_config_mac}
    set suite variable  ${DEVICE_MACID}  ${Network_Param_config_mac}
    Verify PNP Workflow Status
    Open Provisioned Data
    Verify Network Provisioned values    eNodeB     Core


Pre-requsite for Multiple device
     Log     ${Device MACID List}
     FOR    ${macid}    IN    @{BULK_CONFIG_DICT['Device MACID List']}
             Log    ${macid}
             Device console Login
             set suite variable  ${DEVICE_MACID}  ${macid}
             Login with Device ID  ${macid}
             Open Overridden Params Page
             Update Overridden Parameter  Sector 1  RF  scalar  ${RF_PARAM_DICT}
             Save Overriden Parameter
             Replan Device
             BuiltIn.Sleep  30s
     END

Boot Pre-requsite for Multiple device
     Log     ${Device MACID List Boot}
     FOR    ${macid}    IN    @{BULK_CONFIG_DICT_BOOT['Device MACID List Boot']}
             Log    ${macid}
             Device console Login
             set suite variable  ${DEVICE_MACID}  ${macid}
             Login with Device ID  ${macid}
             Open Overridden Params Page
             Update Overridden Parameter  Sector 1  RF  scalar  ${RF_PARAM_DICT}
             Save Overriden Parameter
             Replan Device
             BuiltIn.Sleep  30s
     END


Bulk Configure Param and Select Bulk Device
    Open Bulk Device Configuration Page
    #Select Device Type and Software Version  0005B9-LTE_Enterprise_C-RANSC_Cntrl    From 4.5.0 and up to 4.5.*
    #Select Device Type and Software Version  0005B9-LTE_Enterprise_C-RANSC_Cntrl    From 5.5.0 and up to 5.5.*
    Select Device Type and Software Version  0005B9-LTE_Enterprise_C-RANSC_Cntrl    From 5.5.0 and up to 6.0.0
    Update RF Parameters For devices
    Add Bulk Device for configuration

Verify Bulk Device Param Delta
    FOR    ${macid}    IN    @{BULK_CONFIG_DICT['Device MACID List']}
        Device console Login
        Login with Device ID  ${macid}
        set suite variable  ${DEVICE_MACID}  ${macid}
        Verify Delta Provisioning Status
    END

Verify Reboot Bulk Device Param Delta
    FOR    ${macid}    IN    @{BULK_CONFIG_DICT_BOOT['Device MACID List Boot']}
        Device console Login
        Login with Device ID  ${macid}
        set suite variable  ${DEVICE_MACID}  ${macid}
        Verify Delta Provisioning Status
    END


Delete already created Reset Proactive Job
    Open Proactive job
    Search Device Reset Proactive job    ${Reset_job_name}

Initiate Reset Proactive Job
    Open Proactive job
    Create Proactive job    ${Reset_job_name}    ${Reset_Opeartion_Type}
    Add Reset Reboot Device for configuration Proactive Job   ${DEVICE_MACID_LIST}

Delete already created Reboot Proactive Job
    Open Proactive job
    Search Device Reset Proactive job    ${Reboot_job_name}

Initiate Reboot Proactive Job
    Open Proactive job
    Create Proactive job    ${Reboot_job_name}    ${Reboot_Opeartion_Type}
    Add Reboot Device for configuration Proactive Job   ${DEVICE_MACID_LIST_BOOT}

Verify Device Reset Reboot Param Provisioing Status
    FOR    ${macid}    IN    @{BULK_CONFIG_DICT['Device MACID List']}
        Device console Login
        Login with Device ID  ${macid}
        set suite variable  ${DEVICE_MACID}  ${macid}
        Verify PNP Workflow Status
        Open Provisioned Data
        Verify Provisioned values    Sector 1     RF Parameters
    END

Reboot Bulk Configure Param and Select Bulk Device
    Open Bulk Device Configuration Page
    #Select Device Type and Software Version  0005B9-LTE_Enterprise_C-RANSC_Cntrl    From 4.5.0 and up to 4.5.*
    #Select Device Type and Software Version  0005B9-LTE_Enterprise_C-RANSC_Cntrl    From 5.5.0 and up to 5.5.*
    Select Device Type and Software Version  0005B9-LTE_Enterprise_C-RANSC_Cntrl    From 5.5.0 and up to 6.0.0
    Update RF Parameters For devices
    Add Bulk Device for Reboot configuration

Verify Device Reboot Param Provisioing Status
    FOR    ${macid}    IN    @{BULK_CONFIG_DICT_BOOT['Device MACID List Boot']}
        Device console Login
        Login with Device ID  ${macid}
        set suite variable  ${DEVICE_MACID}  ${macid}
        Verify PNP Workflow Status
        Open Provisioned Data
        Verify Provisioned values    Sector 1     RF Parameters
    END

Delete already created Rechability Proactive Job
    Open Proactive job
    Search Device Reset Proactive job    ${Rechability_job_name}

Initiate Rechability Proactive Job
    Open Proactive job
    Create Rechability Proactive job    ${Rechability_job_name}    ${Rechability_Opeartion_Type}
    #Add Device for configuration Proactive Job    ${REACHABILITY_DEVICE}
    Add Device for configuration Proactive Job    ${DEVICE21_MACID}

Verify Device Rechability Status
    Device console Login
    Login with Device ID  ${DEVICE21_MACID}
    set suite variable  ${DEVICE_MACID}  ${DEVICE21_MACID}
    Device console and Operation History reachability Verification
    Reachability Verification on Device History    Tabular  Last 1 hour  All

Bulk Configure pre-requsites for CUCP
    Switch To DMS Network Console Window
    Open Bulk Device Configuration Page
    Select Device Type and Software Version  0005B9-CS_ONECELL_CU-CP    From 6.0.0 and up to 6.0.*
    Update Overridden Parameters For CUCP VNFs
    Select Device From Device List  ${CUCP_BULK_CONFIG_DICT['Device Filter']}
    Replan the CUCP VNFs

Bulk Configure DMS Overridden Parameters for CUCP
    [Documentation]  Bulk Configure DMS Overridden Parameters
    Switch To DMS Network Console Window
    Open Bulk Device Configuration Page
    Select Device Type and Software Version  0005B9-CS_ONECELL_CU-CP    From 6.0.0 and up to 6.0.*
    Update Device Overridden Parameters For CUCP VNFs
    Select Device From Device List  ${BULK_CONFIG_DICT['Device Filter']}

Replan the CUCP VNFs
    [Documentation]  Verify Delta Provisioning Status From List Of Device
    #Switch To DMS Window
    #DMS UI Login
    Open Browser      ${DMS_UI_URL}     Chrome     alias=${DMS_Window}
    Maximize Browser Window
    Wait Until Page Contains Element        ${ID_DMS_LOGIN_USER}    timeout=${BROWSER_ELEMENT_TIMEOUT}
    Input Text     ${ID_DMS_LOGIN_USER}     ${DMS_UI_USER}
    Input Password     ${ID_DMS_LOGIN_PASSWORD}     ${DMS_UI_PASSWORD}
    Click Button      ${ID_DMS_LOGIN_SIGNIN}
    FOR    ${macid}    IN    @{CUCP_BULK_CONFIG_DICT['CUCP VNF List']}
        set suite variable  ${DEVICE_MACID}  ${macid}
        Login with gNB Device ID  ${macid}
        Verify 5G VNF Delta Provisioning Status  ${macid}
        Replan Device
    END
    Close Browser

Verify Delta Provisioning Status From List Of CUCP VNFs
    [Documentation]  Verify Delta Provisioning Status From List Of Devices
    #Switch To DMS Window
    #DMS UI Login
    Open Browser      ${DMS_UI_URL}     Chrome     alias=${DMS_Window}
    Maximize Browser Window
    Wait Until Page Contains Element        ${ID_DMS_LOGIN_USER}    timeout=${BROWSER_ELEMENT_TIMEOUT}
    Input Text     ${ID_DMS_LOGIN_USER}     ${DMS_UI_USER}
    Input Password     ${ID_DMS_LOGIN_PASSWORD}     ${DMS_UI_PASSWORD}
    Click Button      ${ID_DMS_LOGIN_SIGNIN}
    FOR    ${macid}    IN    @{CUCP_BULK_CONFIG_DICT['CUCP VNF List']}
        set suite variable  ${DEVICE_MACID}  ${macid}
        Login with gNB Device ID  ${macid}
        Verify 5G VNF Delta Provisioning Status  ${macid}
    END

Bulk Configure pre-requsites for CUUP
    Switch To DMS Network Console Window
    Open Bulk Device Configuration Page
    Select Device Type and Software Version  0005B9-CS_ONECELL_CU-UP    From 6.0.0 and up to 6.0.*
    Update Overridden Parameters For CUUP VNFs
    Select Device From Device List  ${CUUP_BULK_CONFIG_DICT['Device Filter']}
    Replan the CUUP VNFs

Bulk Configure DMS Overridden Parameters for CUUP
    [Documentation]  Bulk Configure DMS Overridden Parameters
    Switch To DMS Network Console Window
    Open Bulk Device Configuration Page
    Select Device Type and Software Version  0005B9-CS_ONECELL_CU-UP    From 6.0.0 and up to 6.0.*
    Update Device Overridden Parameters For CUUP VNFs
    Select Device From Device List  ${BULK_CONFIG_DICT['Device Filter']}

Replan the CUUP VNFs
    [Documentation]  Verify Delta Provisioning Status From List Of Device
    #Switch To DMS Window
    #DMS UI Login
    Open Browser      ${DMS_UI_URL}     Chrome     alias=${DMS_Window}
    Maximize Browser Window
    Wait Until Page Contains Element        ${ID_DMS_LOGIN_USER}    timeout=${BROWSER_ELEMENT_TIMEOUT}
    Input Text     ${ID_DMS_LOGIN_USER}     ${DMS_UI_USER}
    Input Password     ${ID_DMS_LOGIN_PASSWORD}     ${DMS_UI_PASSWORD}
    Click Button      ${ID_DMS_LOGIN_SIGNIN}
    FOR    ${macid}    IN    @{CUUP_BULK_CONFIG_DICT['CUUP VNF List']}
        set suite variable  ${DEVICE_MACID}  ${macid}
        Login with gNB Device ID  ${macid}
        Verify 5G VNF Delta Provisioning Status  ${macid}
        Replan Device
    END
    Close Browser

Verify Delta Provisioning Status From List Of CUUP VNFs
    [Documentation]  Verify Delta Provisioning Status From List Of Devices
    #Switch To DMS Window
    #DMS UI Login
    Open Browser      ${DMS_UI_URL}     Chrome     alias=${DMS_Window}
    Maximize Browser Window
    Wait Until Page Contains Element        ${ID_DMS_LOGIN_USER}    timeout=${BROWSER_ELEMENT_TIMEOUT}
    Input Text     ${ID_DMS_LOGIN_USER}     ${DMS_UI_USER}
    Input Password     ${ID_DMS_LOGIN_PASSWORD}     ${DMS_UI_PASSWORD}
    Click Button      ${ID_DMS_LOGIN_SIGNIN}
    FOR    ${macid}    IN    @{CUUP_BULK_CONFIG_DICT['CUUP VNF List']}
        set suite variable  ${DEVICE_MACID}  ${macid}
        Login with gNB Device ID  ${macid}
        Verify 5G VNF Delta Provisioning Status  ${macid}
    END

Bulk Configure pre-requsites for DU
    Switch To DMS Network Console Window
    Open Bulk Device Configuration Page
    Select Device Type and Software Version  0005B9-CS_ONECELL_DU    From 6.0.0 and up to 6.0.*
    Update Overridden Parameters For DU VNFs
    Select Device From Device List  ${DU_BULK_CONFIG_DICT['Device Filter']}
    Replan the DU VNFs

Bulk Configure DMS Overridden Parameters for DU
    [Documentation]  Bulk Configure DMS Overridden Parameters
    Switch To DMS Network Console Window
    Open Bulk Device Configuration Page
    Select Device Type and Software Version  0005B9-CS_ONECELL_DU    From 6.0.0 and up to 6.0.*
    Update Device Overridden Parameters For DU VNFs
    Select Device From Device List  ${BULK_CONFIG_DICT['Device Filter']}

Replan the DU VNFs
    [Documentation]  Verify Delta Provisioning Status From List Of Device
    #Switch To DMS Window
    #DMS UI Login
    Open Browser      ${DMS_UI_URL}     Chrome     alias=${DMS_Window}
    Maximize Browser Window
    Wait Until Page Contains Element        ${ID_DMS_LOGIN_USER}    timeout=${BROWSER_ELEMENT_TIMEOUT}
    Input Text     ${ID_DMS_LOGIN_USER}     ${DMS_UI_USER}
    Input Password     ${ID_DMS_LOGIN_PASSWORD}     ${DMS_UI_PASSWORD}
    Click Button      ${ID_DMS_LOGIN_SIGNIN}
    FOR    ${macid}    IN    @{DU_BULK_CONFIG_DICT['DU VNF List']}
        set suite variable  ${DEVICE_MACID}  ${macid}
        Login with gNB Device ID  ${macid}
        Verify 5G VNF Delta Provisioning Status  ${macid}
        Replan Device
    END
    Close Browser

Verify Delta Provisioning Status From List Of DU VNFs
    [Documentation]  Verify Delta Provisioning Status From List Of Devices
    #Switch To DMS Window
    #DMS UI Login
    Open Browser      ${DMS_UI_URL}     Chrome     alias=${DMS_Window}
    Maximize Browser Window
    Wait Until Page Contains Element        ${ID_DMS_LOGIN_USER}    timeout=${BROWSER_ELEMENT_TIMEOUT}
    Input Text     ${ID_DMS_LOGIN_USER}     ${DMS_UI_USER}
    Input Password     ${ID_DMS_LOGIN_PASSWORD}     ${DMS_UI_PASSWORD}
    Click Button      ${ID_DMS_LOGIN_SIGNIN}
    FOR    ${macid}    IN    @{DU_BULK_CONFIG_DICT['DU VNF List']}
        set suite variable  ${DEVICE_MACID}  ${macid}
        Login with gNB Device ID  ${macid}
        Verify 5G VNF Delta Provisioning Status  ${macid}
    END