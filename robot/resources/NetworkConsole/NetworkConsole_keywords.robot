*** Settings ***
#Library             DateTime
#Resource            page/dashboard_page_helper.robot
#Resource            ../dashboard/device_operation.robot
Resource            ../overwrridden_params/overwrridden_params.robot
#Resource            ../notification/notification_helper.robot
Resource            ../common/ui_common.robot
#Resource            ../pnp/pnp_keywords.robot
#Resource            ../operational_rp_params/rp_params_keywords.robot
Resource            page/ServiceSetting_helper.robot
#Library             DateTime
#Resource            page/dashboard_page_helper.robot
#Resource            ../dashboard/device_operation.robot
Resource            ../overwrridden_params/overwrridden_params.robot
#Resource            ../notification/notification_helper.robot
Resource            ../common/ui_common.robot
#Resource            ../pnp/pnp_keywords.robot
#Resource            ../operational_rp_params/rp_params_keywords.robot
Resource            page/Import_helper.robot
#Variables           testdata/timingSource_testdata.py
#Variables           testdata/timingSource_testdata.py
Resource            ../NetworkConsole/NetworkConsole.robot
Resource            ../NetworkConsole/Page/NetworkConsole_helper.robot

*** Variables ***



*** Keywords ***

Open Service Package Page
   Login Service Package


Edit Service Package for CU
   Edit CU Package

Edit Service Package for DU
   Edit DU Package

Search Parameter
   Search Service Package Parameter

Change Flag To False
   Disable and Generate Alarm

Change Flag To True
    Enable and Clear Alarm

Change Flag To False CU_UP
   Disable and Generate Alarm CU_UP

Change Flag To True CU_UP
    Enable and Clear Alarm CU_UP

Save Changes
  Save Service Package Changes

Time Evaluation
   Get Current Time

Open System Alarm Page
   Open System Alaram

Clear All Alarms
   [Arguments]    ${device_mac}
   Clear All Alarms Generated on Device    ${device_mac}

Check for non-Existence of Alarm
    [Arguments]    ${device_mac}
    Verify Alarm not to be present    ${device_mac}

Check for Existence of Alarm
    [Arguments]    ${device_mac}
    Verify Alarm to be present    ${device_mac}

Check Heatbeat value
    VERIFY HEARTBEAT LABEL

Check for Existence of Failure Alarm
     [Arguments]    ${device_mac}    ${EVENT_TYPE}
     Verify FAILURE Alarm to be present    ${device_mac}    ${EVENT_TYPE}

Netconf connection Status
    [Arguments]    ${Status}
    Verify Netconf Status    ${Status}

