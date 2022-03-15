*** Settings ***
Documentation       DMS Search device
Suite Teardown      DMS UI Logout    # Logging off
Resource            ../resources/common/ui_common.robot
Resource            ../resources/Search_Page/Search_Device.robot
Library             String


*** Test Cases ***
Search Device Using Friendly Name
    [Documentation]  Searching Device using the friendly name
    [Tags]   search_device_friendlyName     search_device    regression    sustenance6.0
    Device console Login
    search using friendly name
    DMS UI Logout

Search Device Using Cell Identity
    [Documentation]  Searching Device using the cell identity
    [Tags]   search_device_cellIdentity     search_device    regression    sustenance6.0
    Device console Login
    search using cell identity
    DMS UI Logout


Search Device Using NGRP
    [Documentation]  Searching Device using the NGRP Mac ID
    [Tags]   search_device_ngrp     search_device    regression    sustenance6.0
    Device console Login
    search using NGRP device
    DMS UI Logout

Search Device Using NGRP With Image Validation
    [Documentation]  Searching Device using the NGRP MACID with validation
    [Tags]   search_device_ngrp_validation     search_device    regression    working
    Device console Login
    search using NGRP device with validation
    DMS UI Logout


Search Device Using RP5100
    [Documentation]  Searching Device using the RP5100 Mac ID
    [Tags]   search_device_rp5100     search_device    regression    working    regression_6.0    sustenance6.0
    Device console Login
    search using RP5100 device
    DMS UI Logout

Search Device Using RP5200
    [Documentation]  Searching Device using the RP5200 Mac ID
    [Tags]   search_device_rp5200     search_device    regression    working    sustenance6.0
    Device console Login
    search using RP5200 device
    DMS UI Logout
gNB dashboard search using gNBid
    [Documentation]  Search gNB dashboard using gNBid
    [Tags]   search_gNBdashboard_using_gNBid    gNB_dashboard   regression    regression_6.0    sustenance6.0
    Device console Login
    Verify gNB dashboard search using gNBid     ${gNBid1}
    DMS UI Logout

gNB dashboard search using gNBName
    [Documentation]  Search gNB dashboard using gNBName
    [Tags]   search_gNBdashboard_using_gNBName  gNB_dashboard   regression    regression_6.0    sustenance6.0
    Device console Login
    Verify gNB dashboard search using gNBName
    DMS UI Logout

gNB dashboard search using gNBName with multiple cucp
    [Documentation]  Search gNB dashboard using gNBName with mutliple cucp
    [Tags]   search_gNBdashboard_using_gNBName_multiple_cucp    regression    regression_6.0    sustenance6.0
    Device console Login
    Verify gNB dashboard search using gNBName with multiple cucp
    DMS UI Logout

gNB dashboard from DU dashboard
    [Documentation]  gNB dashboard from DU dashboard
    [Tags]   gNB_dashboard_from_du      gNBdashboard_from_vnf   gNBdashboard_navigation     regression    regression_6.0    sustenance6.0
    Device console Login
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    search using du name    ${DEVICE_MACID}
    Navigate to gNB dashboard

gNB dashboard from CP dashboard
    [Documentation]  gNB dashboard from CP dashboard
    [Tags]   gNB_dashboard_from_cp      gNBdashboard_from_vnf   gNBdashboard_navigation     regression    regression_6.0    sustenance6.0
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    search using cu_cp name    ${DEVICE_MACID}
    Navigate to gNB dashboard

gNB dashboard from UP dashboard
    [Documentation]  gNB dashboard from UP dashboard
    [Tags]   gNB_dashboard_from_up      gNBdashboard_from_vnf   gNBdashboard_navigation     regression    regression_6.0    sustenance6.0
    Device console Login
    set global variable  ${DEVICE_MACID}  ${CU_UP_VENUE_DEVICE1}
    search using cu_up name    ${DEVICE_MACID}
    Navigate to gNB dashboard from UP

gNB dashboard service status
    [Documentation]  gNB dashboard service status when DU cell state is up
    [Tags]   gNB_dashboard_service_status   regression    regression_6.0
    Verify gNB dashboard service status

gNB dashboard verification
    [Documentation]  gNB dashboard verification
    [Tags]   gNB_dashboard_verification     regression    regression_6.0
    Device console Login
    Verify gNB dashboard search using gNBid     ${gNBid2}
    Verify gNB dashboard page