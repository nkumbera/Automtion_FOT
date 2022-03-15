*** Settings ***
Documentation    DMS Network Policy Test Suite
#Suite Setup         DMS UI Login    # Login DMS Network Console UI with AdminUser
#Suite Setup         DMS Network Console UI Login
Suite Teardown      DMS UI Logout    # Logging off
Resource            ../resources/common/ui_common.robot
Resource            ../resources/dashboard/dashboard_keywords.robot
Resource            ../resources/NetworkPolicy/NetworkPolicy_Keywords.robot
Library             String
Test Setup          DMS Network Console UI Login
Test Teardown       DMS Network Console UI Logout

*** Test Cases ***
OnDemand Entire Network
     [Documentation]   Network Policy On demand entire network
     [Tags]  onDemand_entire    networkPolicy     regression
     On Demand NetworkPolicy Update


Network Policy- GPV- Event Type- Bootstrap- Filter
    [Documentation]   Network Policy On demand entire network
    [Tags]  event_bootstrap    networkPolicy    regression
    Event BootStrap GPV Update

Network Policy- SPV- Event Type- Boot- Device Based
    [Documentation]   Network Policy On demand entire network
    [Tags]  event_boot   networkPolicy    regression
    Event Boot SPV Update

Network Policy-GPA- Event Type-All- Select Filter
    [Documentation]   Network Policy On demand entire network
    [Tags]  event_all   networkPolicy    regression
    Event All GPA Update

Network Policy-SPA- Event Type-Periodic- Device Based
    [Documentation]   Network Policy On demand entire network
    [Tags]  event_PI   networkPolicy    regression
    Event All Periodic Update


Network Policy-Add Object- OnDemand - Device Based
    [Documentation]   Network Policy On demand entire network
    [Tags]  onDemand_add  networkPolicy    regression     onDemand_add_np
    Add object OnDemand Update

Network Policy-Delete Object-Scheduled- Device Based
    [Documentation]   Network Policy On demand entire network
    [Tags]  scheduled_delete  networkPolicy    regression
    Delete object OnDemand Update

Create Import Export of BC Network Policies
     [Documentation]   Import Export of BC Network Policies
     [Tags]  TC_144_BC  MJ_R60    regression
     Import of BC Network Policies
     Export of BC Network Policies


Configuration of EnableBanner SPV Network Policy
    [Documentation]  Verify Configuration of EnableBanner SPV Network Policy
    [Tags]     EnableBanner_SPV_NP    regression    network_policy    regression_6.0
    #DMS Network Console UI Login
    Network console Login RealDevice
    Open RealDevice Network policy Configuration Page
    Create On Demand SPV Network Policy for EnableBanner
    Device console Login RealDevice
    Login with Real Device ID  ${Realdevicemacaddress}
    set global variable  ${DEVICE_MACID}  ${Realdevicemacaddress}
    #Delete EnableBanner created policy    EnableBanner_SPV
    Verify EnableBanner SPV in device history   Tabular  Last 1 hour  PROVISIONING
    Network console Login RealDevice
    Delete the Realdevice Policy   EnableBanner_SPV