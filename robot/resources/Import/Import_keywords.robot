*** Settings ***
#Library             DateTime
#Resource            page/dashboard_page_helper.robot
#Resource            ../dashboard/device_operation.robot
Resource            ../resources/overwrridden_params/overwrridden_params.robot
#Resource            ../notification/notification_helper.robot
Resource            ../resources/common/ui_common.robot
#Resource            ../pnp/pnp_keywords.robot
#Resource            ../operational_rp_params/rp_params_keywords.robot
Resource            ../resources/ServiceSetting/page/ServiceSetting_helper.robot
#Library             DateTime
#Resource            page/dashboard_page_helper.robot
#Resource            ../dashboard/device_operation.robot
Resource            ../resources/overwrridden_params/overwrridden_params.robot
#Resource            ../notification/notification_helper.robot
Resource            ../resources/common/ui_common.robot
#Resource            ../pnp/pnp_keywords.robot
#Resource            ../operational_rp_params/rp_params_keywords.robot
Resource            page/Import_helper.robot
#Variables           testdata/timingSource_testdata.py
#Variables           testdata/timingSource_testdata.py
Resource             ../resources/device_history/device_history_page_keywords.robot
Resource             ../resources/History_page/history_page_keywords.robot


*** Variables ***



*** Keywords ***
Import Netconf Mount file
    Open File Import Page
    Select and import file

Verify Operation History for Netconf Mount file import
    [Arguments]  ${optype}    ${netconfmount_name}
    BuiltIn.Sleep  50s
    Open Operation History
    BuiltIn.Sleep  20s
    Search Operation Type in History  ${optype}
    BuiltIn.Sleep  5s
    Verify Operation History values for Netconf Mount import     ${netconfmount_name}
    BuiltIn.Sleep  2s

Import Entity Mapping file
    Open File Import Page
    Select and import entity mapping file

Verify Operation History for Entity Mapping file import
    [Arguments]  ${optype}      ${device-entity_name}
    BuiltIn.Sleep  50s
    Open Operation History
    BuiltIn.Sleep  20s
    Search Operation Type in History  ${optype}
    BuiltIn.Sleep  5s
    Verify Operation History values for Entity Mapping import with all device      ${device-entity_name}
    BuiltIn.Sleep  2s

Verify Operation History for Unmanaged Netconf Mount file import
    [Arguments]  ${optype}
    BuiltIn.Sleep  50s
    Open Operation History
    BuiltIn.Sleep  20s
    Search Operation Type in History  ${optype}
    BuiltIn.Sleep  5s
    Verify Operation History values for Unmanaged Netconf Mount import
    BuiltIn.Sleep  2s

Verify unmanaged CU device history
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page  ${DEVICE_HiSTORY_PARAMETER_CU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Device History VNF Details

Verify unmanaged DU device history
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page  ${DEVICE_HiSTORY_PARAMETER_DU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Device History DU Details

Import Service Setting file
    Open File Import Page
    Select and import Service Setting file

Verify Operation History for CUCP Service Setting import
    [Arguments]  ${optype}
    BuiltIn.Sleep  50s
    Open Operation History
    BuiltIn.Sleep  20s
    Search Operation Type in History  ${optype}
    BuiltIn.Sleep  5s
    Verify Operation History values for CUCP Service Setting import
    BuiltIn.Sleep  2s


Verify Operation History for CUUP Service Setting import
    [Arguments]  ${optype}
    BuiltIn.Sleep  50s
    Open Operation History
    BuiltIn.Sleep  20s
    Search Operation Type in History  ${optype}
    BuiltIn.Sleep  5s
    Verify Operation History values for CUUP Service Setting import
    BuiltIn.Sleep  2s

Verify Operation History for DU Service Setting import
    [Arguments]  ${optype}
    BuiltIn.Sleep  50s
    Open Operation History
    BuiltIn.Sleep  20s
    Search Operation Type in History  ${optype}
    BuiltIn.Sleep  5s
    Verify Operation History values for DU Service Setting import
    BuiltIn.Sleep  2s

Select show advance option1
    Open Overridden Params Page
    Search DMS Overriden Parameter    eNodeB     Profile
    Select advance option


#Select Profile Association
#    Open Overridden Params Page
#    Search DMS Overriden Parameter    eNodeB     Profile
#    Delete Existing Profile
#    Save Service Setting Parameter
#    Replan Device
#    BuiltIn.Sleep  30s
#    Search DMS Overriden Parameter    eNodeB     Profile
#    BuiltIn.Sleep  10s
#    Associate New one
#    BuiltIn.Sleep  10s
#    Save Service Setting Parameter
    #Replan Device
    #BuiltIn.Sleep  30s


Profile Association Teardown1
    Open Overridden Params Page
    Search DMS Overriden Parameter    eNodeB     Profile
    Delete Existing Profile
    Save Service Setting Parameter
    Replan Device
    BuiltIn.Sleep  30s

Import Factory file
    Open File Import Page
    Select and import Factory file


Verify Operation History for factory import
    [Arguments]     ${optype}
    BuiltIn.Sleep  50s
    Open Operation History
     BuiltIn.Sleep  20s
     Search Operation Type in History  ${optype}
    BuiltIn.Sleep  5s
    Verify Operation History factory import values

Verify Operation History for Service Setting import from SO_Tool
    [Arguments]  ${optype}    ${ServiceSetting_name}
    BuiltIn.Sleep  50s
    Open Operation History
    BuiltIn.Sleep  20s
    Search Operation Type in History  ${optype}
    BuiltIn.Sleep  5s
    Verify Operation History values for Service Setting import from so_tool    ${ServiceSetting_name}
    BuiltIn.Sleep  2s

Verify Operation History for Netconf Mount file auto import
    [Arguments]  ${optype}  ${keyword_import_filename}
    BuiltIn.Sleep  50s
    Open Operation History
    BuiltIn.Sleep  20s
    Search Operation Type in History  ${optype}
    BuiltIn.Sleep  5s
    Verify Operation History values for Netconf Mount auto import  ${keyword_import_filename}
    BuiltIn.Sleep  2s

Schedule Import Service Setting file
    Open Schedule Import Page
    Schedule ODF Import
    click dms element      ${SCHEDULE_IMPORT_SAVE_BUTTON}
    BuiltIn.Sleep  50s

Verify Device State in Device Dashboard
    Verify Device State in Dashboard