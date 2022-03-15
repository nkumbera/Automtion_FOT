*** Settings ***
#Library             DateTime
#Resource            page/dashboard_page_helper.robot
#Resource            ../dashboard/device_operation.robot
#Resource            ../overwrridden_params/overwrridden_params.robot
#Resource            ../notification/notification_helper.robot
Resource            ../common/ui_common.robot
#Resource            ../pnp/pnp_keywords.robot
#Resource            ../operational_rp_params/rp_params_keywords.robot
Resource            ../Import/Import_helper.robot
Resource            page/EntityMapping_helper.robot
#Variables           testdata/timingSource_testdata.py
#Variables           testdata/timingSource_testdata.py


*** Variables ***



*** Keywords ***


Import Entity Mapping file
    Open File Import Page
    Select and import Entity Mapping file

Verify Operation History for Entity Mapping import
    [Arguments]  ${optype}
    BuiltIn.Sleep  50s
    Open Operation History
    BuiltIn.Sleep  20s
    Search Operation Type in History  ${optype}
    BuiltIn.Sleep  5s
    Verify Operation History values for Entity Mapping import
    BuiltIn.Sleep  2s

Verify X2C Param Delta in Provisioning Page
    BuiltIn.Sleep   5s
    Click Delta Param Entity Mapping
    BuiltIn.Sleep   3s
    Search X2C Delta Parameter in Provisioning Page  IP Address
    BuiltIn.Sleep   2s
    X2C Delta Provisioning Page
    BuiltIn.Sleep   2s
Verify X2C Delete Param Delta in Provisioning Page
    BuiltIn.Sleep   10s
    Click Delta Param Entity Mapping
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