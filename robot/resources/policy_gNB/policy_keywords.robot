*** Settings ***
Library  ../user_keywords/window_operations.py
Resource  ../common/ui_common.robot
Resource  page/Policy_helper.robot
Resource  ../device_history/device_history_page_keywords.robot

*** Variables ***
${UploadFiletest}           css=[type='file']
${AddPolicy_CUCP}          ${EXECDIR}${CU_CP_POLICY_LOCATION}
${AddPolicy_CUUP}          ${EXECDIR}${CU_UP_POLICY_LOCATION}
${AddPolicy_DU}            ${EXECDIR}${DU_POLICY_LOCATION}


*** Keywords ***
Import CP Device Policy
    [Documentation]  CP Device policy import
    CP Device Policy Import

Import UP Device Policy
    [Documentation]  UP Device policy import
    UP Device Policy Import

Import DU Device Policy
    [Documentation]  DU Device policy import
    DU Device Policy Import




Delete EnableAutomaticRPKeyCertsDown created policy
    [arguments]  ${Policy_Name}
    #Open Realdevice Devicy Policy Page
    Delete the Realdevice Policy      ${Policy_Name}

Create SPV On Demand DevicePolicy for policy EnableAutomaticRPKeyCertsDown
   Add ondemand Policy for Cert    ${Cert_policy_name}    ${XPATH_DP_DEVICEOPERATION_SPV}
   Execute the Realdevice Policy          ${Cert_policy_name}
   #Validate response in Device History       Tabular     1 hour         PROVISIONING    ${Cert_policy_name}
   BuiltIn.Sleep   15s
   Verify Realdevice Success msg      ${Cert_policy_name}

Create GPV On Demand DevicePolicy for policy EnableAutomaticRPKeyCertsDown
   Add ondemand Policy for Cert    ${Cert_policy_name_GPV}    ${XPATH_DP_DEVICEOPERATION_GPV}
   Execute the Realdevice Policy          ${Cert_policy_name_GPV}
   #Validate response in Device History       Tabular     1 hour         PROVISIONING    ${Cert_policy_name_GPV}
   BuiltIn.Sleep   15s
   Verify Realdevice Success msg      ${Cert_policy_name_GPV}

Create On Demand Get Configured Data
   [Arguments]     ${Policy_Page}
   Delete VNF Policy    ${Policy_Page}    ${OnDemand_policy_name_GCD}
   Add ondemand Policy    ${OnDemand_policy_name_GCD}    ${XPATH_DP_DEVICEOPERATION_GCD}
   Execute the Get Configured Data Policy    ${Policy_Page}    ${OnDemand_policy_name_GCD}
   BuiltIn.Sleep   15s
   Verify VNF Success msg    ${Policy_Page}    ${OnDemand_policy_name_GCD}

Create On Demand Get Operational Data
   [Arguments]     ${Policy_Page}
   Delete VNF Policy    ${Policy_Page}    ${OnDemand_policy_name_GOD}
   Add ondemand Policy    ${OnDemand_policy_name_GOD}    ${XPATH_DP_DEVICEOPERATION_GOD}
   Execute the Get Configured Data Policy    ${Policy_Page}    ${OnDemand_policy_name_GOD}
   BuiltIn.Sleep   15s
   Verify VNF Success msg    ${Policy_Page}    ${OnDemand_policy_name_GOD}

Edit configuration Scheduled policy
   [Arguments]     ${Policy_Page}
   Delete VNF Policy    ${Policy_Page}    ${Schedule_policy_name}
   Add Schedule Policy    ${Schedule_policy_name}    ${XPATH_DP_DEVICEOPERATION_Editconfig}
   Execute the Get Configured Data Policy    ${Policy_Page}    ${Schedule_policy_name}
   BuiltIn.Sleep   180s
   Open Vnf Policy Page    ${Policy_Page}
   Verify VNF Success msg    ${Policy_Page}    ${Schedule_policy_name}

Verify device history for Policy Results
    [Arguments]     ${Created_Policy_name}    ${url_history}
    Validate Policy response in Device History       Tabular     1 hour         PROVISIONING    ${Created_Policy_name}    ${url_history}

Create and execute Event type policy
   [Arguments]     ${Policy_Page}
   Delete VNF Policy    ${Policy_Page}    ${EventType_policy_name_GOD}
   Add EventType Policy    ${EventType_policy_name_GOD}    ${XPATH_DP_DEVICEOPERATION_GOD}
   BuiltIn.Sleep   15s

Create GPV On Demand DevicePolicy for policy EnableBanner
   Add ondemand Policy for EnableBanner    ${EnableBanner_policy_name_GPV}    ${XPATH_DP_DEVICEOPERATION_GPV}
   #Execute the Realdevice Policy          ${EnableBanner_policy_name_GPV}
   #Validate response in Device History       Tabular     1 hour         PROVISIONING    ${Cert_policy_name_GPV}
   BuiltIn.Sleep   15s
   Verify Realdevice Success msg      ${EnableBanner_policy_name_GPV}

Verify EnableBanner GPV in device history
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open Real Device History Page
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Select Device History Items per Page
    Verify EnableBanner GPV details in history
