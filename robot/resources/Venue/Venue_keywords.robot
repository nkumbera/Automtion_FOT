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


*** Variables ***



*** Keywords ***


Import Venue file
    Open File Import Page
    Select and import Venue file

Verify Operation History for Venue import
    [Arguments]  ${optype}     ${Venue_name}
    BuiltIn.Sleep  50s
    Open Operation History
    BuiltIn.Sleep  20s
    Search Operation Type in History  ${optype}
    BuiltIn.Sleep  5s
    Verify Operation History values for Venue import     ${Venue_name}
    BuiltIn.Sleep  2s

Verify Venue in Enterprise View page
    BuiltIn.Sleep  2s

    Open Enterprise View page
    BuiltIn.Sleep  2s
    Search Venue name  Automation_Venue
    BuiltIn.Sleep  10s
    Verify Device in Venue page

Verify updated service area and replan status in venue

    BuiltIn.Sleep  2s
    Open Enterprise View page
    BuiltIn.Sleep  2s
    Search Venue name  Automation_Venue
    BuiltIn.Sleep  2s
    Verify updated service area and replan status
    BuiltIn.Sleep  2s

Enterprise view Venue Selection
    [Arguments]  ${Venue_Name}
    Open Enterprise View Page
    BuiltIn.Sleep  15s
    Search Venue name    ${Venue_Name}


Confiure Leaf and List parameters Topology View DU
    [arguments]      ${ves_value}
    Open Venue Overridden Param
    Select the device and software type    ${Device_type_Du}    ${XAPTH_Device_type_LIST_ELEMENT_DU}
    Update Overridden Parameter  DU Node    VES    scalar    ${ves_value}
    Save VENUE DMS Overriden Parameter

configure ves param in Topology
    [arguments]      ${url_ves}    ${Username_ves}    ${Password_ves}
    Open Venue Overridden Param
    Select the device and software type    ${Device_type_CUCP}    ${XAPTH_Device_type_LIST_ELEMENT_CUCP}
    Search gNB CP DMS Overriden Parameter    VES
    update ves values cucp     ${url_ves}    ${Username_ves}    ${Password_ves}
    Save VENUE DMS Overriden Parameter

configure ves param in Topology cuup
    [arguments]      ${url_ves}    ${Username_ves}    ${Password_ves}
    Open Venue Overridden Param
    Select the device and software type    ${Device_type_CUUP}    ${XAPTH_Device_type_LIST_ELEMENT_CUUP}
    Search gNB CP DMS Overriden Parameter    VES
    update ves values cuup     ${url_ves}    ${Username_ves}    ${Password_ves}
    Save VENUE DMS Overriden Parameter

Confiure Leaf and List parameters Topology View CUCP
    [arguments]      ${ves_value}
    Open Venue Overridden Param
    Select the device and software type    ${Device_type_CUCP}    ${XAPTH_Device_type_LIST_ELEMENT_CUCP}
    Update gNB Overriden Parameter    VES    scalar    ${ves_value}
    Save VENUE DMS Overriden Parameter


Confiure Leaf and List parameters Topology View CUUP
    [arguments]    ${ves_value}
    Open Venue Overridden Param
    Select the device and software type    ${Device_type_CUUP}    ${XAPTH_Device_type_LIST_ELEMENT_CUUP}
    Update gNB Overriden Parameter    VES    scalar    ${ves_value}
    Save VENUE DMS Overriden Parameter

Verify the gNB provisioned value
    [arguments]  ${DEVICE_gNB_PROVISIONING_DATA_PAGE}
    Open gNB Provisioning Data    ${DEVICE_gNB_PROVISIONING_DATA_PAGE}
    Search DMS Overriden Parameter    DU Node    VES
    Verify Venue provisioned value


Verify CP gNB provisioned value
    [arguments]  ${DEVICE_gNB_PROVISIONING_DATA_PAGE}
    Open gNB Provisioning Data    ${DEVICE_gNB_PROVISIONING_DATA_PAGE}
    Search GNB CP DMS Overriden Parameter     VES
    Verify Venue provisioned value


Verify SO-Tool Venue in Enterprise View page
    [arguments]    ${Venue_name_input}
    BuiltIn.Sleep  2s

    Open Enterprise View page
    BuiltIn.Sleep  2s
    Search Venue name    ${Venue_name_input}
    BuiltIn.Sleep  2s
    Verify Building and Floor details


#Export Venue from Enterprise View page
    #Open Enterprise View Page
    #BuiltIn.Sleep  15s
    #Search Venue name    Automation_Venue
    #Export the Venue
    #Verify Notificaton Status    Download completed    Success

Verify Add CP from floor
    Add CP from venue floor

Verify Add UP from floor
    Add UP from venue floor

Verify Add DU from floor
    Add DU from venue floor

Delete DMS GUI Parameter
    [Arguments]     ${dms_url}
    Open gNB Overridden Page    ${dms_url}
    Delete gNB DMS VES Overriden Parameter    VES
    Save gNB Overriden Parameter
    Reboot gNB Device

Configure tabular param for BC device
    [arguments]    ${PLMN_PARAM}
    Open Venue Overridden Param
    Select the device and software type    ${Device_type_BC}    ${XAPTH_Device_type_LIST_ELEMENT_BC}
    Update Overridden Parameter  Sector 1  PLMN  tabular  ${PLMN_PARAM}
    Save VENUE DMS Overriden Parameter


Verify Enable and Disable of RPTx Off alarm flag from Enterprise GUI
    [arguments]    ${Venue_name_input}
    Open Enterprise View page
    BuiltIn.Sleep  2s
    Search Venue name    ${Venue_name_input}
    BuiltIn.Sleep  2s
    Verify RPTxOff Flag status in venue page


Export Venue from Enterprise View page
    Open Enterprise View Page
    BuiltIn.Sleep  15s
    Search Venue name    Automation_Venue
    BuiltIn.Sleep  5s
    Export the Venue
    BuiltIn.Sleep  10s
    Verify Venue Export Notificaton Status
    #Verify Downloaded Venue File in Local System

Export GSC Report for all gNB in Venue
    BuiltIn.Sleep  5s
    Open Enterprise View Page
    BuiltIn.Sleep  10s
    Search Venue name    Automation_Venue
    BuiltIn.Sleep  5s
    Generate GSC Report for all gNB

Export GSC Report for a gNB in Venue
    BuiltIn.Sleep  5s
    Open Enterprise View Page
    BuiltIn.Sleep  10s
    Search Venue name    Automation_Venue
    BuiltIn.Sleep  5s
    Generate GSC Report for a gNB

Verify Operation History for GSC Report
    [Arguments]  ${optype}
    BuiltIn.Sleep  50s
    Open Operation History
    BuiltIn.Sleep  20s
    Search Operation Type in History  ${optype}
    BuiltIn.Sleep  5s
    Verify Operation History values for GSC Report
    BuiltIn.Sleep  2s

Verify Topology Details from CUCP
    Verify device count and status from CUCP dashboard
    Verify CUCP MAP Topology Details
Verify Topology Details from CUUP
    Verify device count and status from CUUP dashboard
    Verify CUUP MAP Topology Details

Verify Topology Details from DU
    Verify device count and status from DU dashboard
    Verify DU MAP Topology Details