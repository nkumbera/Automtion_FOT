*** Settings ***
Documentation    DMS Bulk Configuration Test Suite
#Suite Setup         DMS UI Login    # Login DMS Network Console UI with AdminUser
#Suite Setup         DMS Network Console UI Login
Suite Teardown      DMS UI Logout    # Logging off
Resource            ../resources/common/ui_common.robot
Resource            ../resources/dashboard/dashboard_keywords.robot
Resource            ../resources/bulk_configuration/bulk_configuration_keywords.robot
Library             String
Test Teardown       DMS Network Console UI Logout


*** Test Cases ***
Bulk Configure DMS Overridden Parameters
    [Documentation]  Bulk Configuration Override for eNodeB, Sector 1 and Sector 2 parameters
    [Tags]   bulk_configure_override_param     Phase2    bulk_configure    regression    working
    DMS Network Console UI Login
    Bulk Configure pre-requsite
    Bulk Configure DMS Overridden Parameters
    Verify Delta Provisioning Status From List Of Device

Bulk Configuration of Network Related Params
    [Documentation]  Bulk Configuration Override, Provisioning of Network Related Params  on Ondemand  Network Related Proactive Replan
    [Tags]   bulk_configure_network_param      Phase2    bulk_configure    regression    working
    Network Param Prerequsite Configuration
    DMS Network Console UI Login
    Bulk Configure Select Device
    Verify Network Param Delta
    DMS Network Console UI Login
    Delete already created Network Proactive Job
    Initiate Network Proactive Job
    BuiltIn.Sleep  60s
    Verify Network Param Provisioing Status

Bulk Configuration of Device Related Params
    [Documentation]  Bulk Configuration Override, Provisioning of Network Related Params  on Ondemand  Network Related Proactive Replan
    [Tags]   bulk_configure_device_param  regression    Phase2    bulk_configure    working
    Device Param Prerequsite Configuration
    DMS Network Console UI Login
    Bulk Configure Param and Select Device
    Verify Device Param Delta
    DMS Network Console UI Login
    Delete already created Proactive Job
    Initiate Device Proactive Job
    Verify Device Param Provisioing Status

Bulk Reset for selected devices - with delta
    [Documentation]  Bulk Reset for selected devices - with delta
    [Tags]   bulk_reset  regression    Phase2    bulk_configure    working
    Pre-requsite for Multiple device
    DMS Network Console UI Login
    Bulk Configure Param and Select Bulk Device
    Verify Bulk Device Param Delta
    DMS Network Console UI Login
    Delete already created Reset Proactive Job
    Initiate Reset Proactive Job
    Verify Device Reset Reboot Param Provisioing Status

Bulk Reboot for devices
    [Documentation]  Bulk Reboot for selected devices - with delta
    [Tags]   bulk_reboot  regression    Phase2    bulk_configure    working
    Boot Pre-requsite for Multiple device
    DMS Network Console UI Login
    Reboot Bulk Configure Param and Select Bulk Device
    Verify Reboot Bulk Device Param Delta
    DMS Network Console UI Login
    Delete already created Reboot Proactive Job
    Initiate Reboot Proactive Job
    Verify Device Reboot Param Provisioing Status

Triggering of Reachability check
    [Documentation]  Rechability for selected devices - with delta
    [Tags]   bulk_rechability     Phase2    bulk_configure    regression    working
    DMS Network Console UI Login
    Delete already created Rechability Proactive Job
    Initiate Rechability Proactive Job
    BuiltIn.Sleep  600s
    Verify Device Rechability Status

Bulk Override Parameters for CUCP
    [Documentation]  Bulk Configuration Override for CUCP Device Type
    [Tags]   bulk_override_param_cucp     bulk_configure    bulk_configure_5g    regression    regression_6.0
    DMS Network Console UI Login
    Bulk Configure pre-requsites for CUCP
    Bulk Configure DMS Overridden Parameters for CUCP
    Verify Delta Provisioning Status From List Of CUCP VNFs

Bulk Override Parameters for CUUP
    [Documentation]  Bulk Configuration Override for CUUP Device Type
    [Tags]   bulk_override_param_cuup     bulk_configure    bulk_configure_5g    regression    regression_6.0
    DMS Network Console UI Login
    Bulk Configure pre-requsites for CUUP
    Bulk Configure DMS Overridden Parameters for CUUP
    Verify Delta Provisioning Status From List Of CUUP VNFs

Bulk Override Parameters for DU
    [Documentation]  Bulk Configuration Override for DU Device Type
    [Tags]   bulk_override_param_du     bulk_configure    bulk_configure_5g    regression    regression_6.0
    DMS Network Console UI Login
    Bulk Configure pre-requsites for DU
    Bulk Configure DMS Overridden Parameters for DU
    Verify Delta Provisioning Status From List Of DU VNFs


