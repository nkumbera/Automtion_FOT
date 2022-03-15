*** Settings ***
#Library             DateTime
#Resource            page/dashboard_page_helper.robot
#Resource            ../dashboard/device_operation.robot
Resource            ../overwrridden_params/overwrridden_params.robot
#Resource            ../notification/notification_helper.robot
Resource            ../common/ui_common.robot
#Resource            ../pnp/pnp_keywords.robot
#Resource            ../operational_rp_params/rp_params_keywords.robot
Resource            ../Import/Import_helper.robot
Resource            page/Venue_helper.robot
#Variables           testdata/timingSource_testdata.py
#Variables           testdata/timingSource_testdata.py
Resource            page/SO_Tool_helper.robot


*** Variables ***


*** Keywords ***
Perform Single Click operation to deploy DMS config
    BuiltIn.Sleep  5s
    Search Venue name in sotool  drop2
    BuiltIn.Sleep  2s
    Perform Deploy DMS Config in Summary and Export Page


