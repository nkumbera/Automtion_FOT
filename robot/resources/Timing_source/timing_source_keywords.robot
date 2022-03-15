*** Settings ***
Library             DateTime
Resource            page/dashboard_page_helper.robot
Resource            ../dashboard/device_operation.robot
Resource            ../overwrridden_params/overwrridden_params.robot
Resource            ../notification/notification_helper.robot
Resource            ../common/ui_common.robot
Resource            ../pnp/pnp_keywords.robot
Resource            ../operational_rp_params/rp_params_keywords.robot
Resource            page/timing_source_page_helper.robot
Variables           testdata/timingSource_testdata.py


*** Variables ***



*** Keywords ***
Configure Nominal GPS
    [Documentation]  Configure Configure Nominal GPS
    #[Arguments]      ${Param}
    Open Timing Source Page
    Search Timing Parameter    Nominal GPS
    Update Timing Parameter    Nominal    Scalar    ${TIMING_SOURCE_DICT_1}
    Save DMS Timing Parameter
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}
    Open Timing Source Page
    Search Timing Parameter    Nominal GPS
    Update Timing Parameter    Nominal    Scalar    ${TIMING_SOURCE_DICT}
    Save DMS Timing Parameter
    Open Provisioned Data
    Verify Delta Provisioning Status


Update NTP Params
    Open Timing Source Page
    Search NTP Parameter    Timing
    Update Timing Parameter    Timing    Scalar    ${NTP_SERVER_DICT_1}
    Save Timing Parameter
    Replan Device
    BuiltIn.Sleep  ${REAL_DEVICE_REPLAN_TIMEOUT}
    Open Timing Source Page
    Search NTP Parameter    Timing
    Update Timing Parameter    Timing    Scalar    ${NTP_SERVER_DICT}
    Save DMS Timing Parameter


#Validate Nominal GPS WEBGUI Overridden Param
#    Open WebGUI Console
#    Validate WebGUI Overridden Params Nominal GPS

#Delete Nominal GPS Webgui params
#    Open WebGUI Console
#    Delete overridden param Nominal GPS
