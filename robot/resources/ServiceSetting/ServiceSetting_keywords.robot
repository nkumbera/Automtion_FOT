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
#Variables           testdata/timingSource_testdata.py


*** Variables ***


*** Keywords ***
Import Service Setting file1
    Open File Import Page1
    Select and import file1

Verify Operation History for import
    BuiltIn.Sleep  100s
    Open Operation History
    BuiltIn.Sleep  20s
    Search Operation Type in History    SERVICE_SETTINGS
    Verify Operation History values

Select show advance option
    Open Overridden Params Page
    Search DMS Overriden Parameter    eNodeB     Profile
    Select advance option


Select Profile Association To Delete Existing Profile
    [arguments]   ${DMS_OVERRIDDEN_URL}
    Open gNB Overridden Params Page    ${DMS_OVERRIDDEN_URL}
    Search gNB DMS Overriden Parameter   Profile
    Delete Existing Profile
    Save Service Setting Parameter
    BuiltIn.Sleep  30s

   
	
Associate New Profile
    [arguments]   ${Profile_file_for_association}    ${DMS_OVERRIDDEN_URL}
    Open gNB Overridden Params Page    ${DMS_OVERRIDDEN_URL}
    Search gNB DMS Overriden Parameter   Profile
    BuiltIn.Sleep  10s
    Associate New one    ${Profile_file_for_association}
    BuiltIn.Sleep  10s
    Save Service Setting Parameter
    



Profile Association Teardown
    Open Overridden Params Page
    Search DMS Overriden Parameter    eNodeB     Profile
    Delete Existing Profile
    Save Service Setting Parameter
    Replan Device
    BuiltIn.Sleep  30s

Select Profile Association
    Open Overridden Params Page
    Search DMS Overriden Parameter    eNodeB     Profile
    Delete Existing Profile
    Save Service Setting Parameter
    Replan Device
    BuiltIn.Sleep  30s
    Search DMS Overriden Parameter    eNodeB     Profile
    BuiltIn.Sleep  10s
    New Profile Associate
    BuiltIn.Sleep  15s
    Save Service Setting Parameter
    BuiltIn.Sleep  15s
    #Replan Device
    #BuiltIn.Sleep  30s


Check for the Row Present
    [arguments]    ${DMS_OVERRIDDEN_URL}
    Open gNB Overridden Params Page    ${DMS_OVERRIDDEN_URL}
    Search gNB DMS Overriden Parameter   Profile
    Verify Profile Associated


Verify Operation History for ConfigChange import
    BuiltIn.Sleep  200s
    Open Operation History
    BuiltIn.Sleep  20s
    Search Operation Type in History    SERVICE_SETTINGS
    Verify Operation History values2

Profile Association Teardown2
    Open Overridden Params Page
    Search DMS Overriden Parameter    eNodeB     Profile
    Delete Existing Profile
    Save Service Setting Parameter

Associate 4.5 SS File
    Search DMS Overriden Parameter    eNodeB     Profile
    BuiltIn.Sleep  10s
    New Profile Associate1
    BuiltIn.Sleep  10s
    Save Service Setting Parameter

Select Profile Association for RDC
    [Arguments]     ${DEVICE_MACID_RDC}
    Open Overridden Params Page1    ${DEVICE_MACID_RDC}
    Search DMS Overriden Parameter    eNodeB     Profile
    Delete Existing Profile RDC
    Search DMS Overriden Parameter    eNodeB     Profile
    New Profile Associate for RDC
