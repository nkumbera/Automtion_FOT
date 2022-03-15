*** Settings ***
Resource            page/NetworkPolicy_helper.robot
Resource            ../provisioning/provisioning_keywords.robot

*** Variables ***


*** Keywords ***
On Demand NetworkPolicy Update
    [Documentation]   Adding the network policy update for GPV on Demand
    Log   Add Policy for GPV on Demand
    #Delete the Policy           Test_onDemand
    Add Network Policy for GPV On Demand    Test_onDemand
    BuiltIn.Sleep   20s
    Verify the Success msg      Test_onDemand


Event BootStrap GPV Update
     [Documentation]   Adding the network policy update for GPV BootStrap
     Log   Add Policy for GPV BootStrap
     Add Network Policy for GPV in Event Type BootStrap      Test_Add_Object_BootStrap
    # Verify the Success msg      Test_Add_Object_BootStrap
     Delete the Policy           Test_Add_Object_BootStrap

Event Boot SPV Update
    [Documentation]   Adding the network policy update for SPV Boot
    Log   Add Policy for SPV Boot
    Add Network Policy for SPV in Event Type Boot      Test_Add_Object_Boot
   # Verify the Success msg      Test_Add_Object_Boot
    Delete the Policy           Test_Add_Object_Boot

Event All GPA Update
     [Documentation]   Adding the device policy update for event type-All
     Log   Add policy for Event type all-GPA
     Add Network Policy for GPA Event Type All      Test_EventType
    # Verify the Success msg      Test_EventType
     Delete the Policy           Test_EventType

Event All Periodic Update
     [Documentation]   Adding the network policy update for SPA
     Log   Add policy for Event type periodic-SPA
     Add Network Policy for SPA Event Type Periodic      Test_EventType_Periodic
    # Verify the Success msg      Test_EventType_Periodic
     Delete the Policy           Test_EventType_Periodic

Add object OnDemand Update
     [Documentation]   Adding the device policy update for OnDemand Add Object
     Log   Add policy for OnDemand-Add Object
     Add Device Policy for Add Object in OnDemand     Test_Add_Object_OnDemand
     BuiltIn.Sleep   20s
     Verify the Success msg      Test_Add_Object_OnDemand
     BuiltIn.Sleep   20s
     Delete the Policy           Test_Add_Object_OnDemand


Delete object OnDemand Update
     [Documentation]   Adding the device policy update for Scheduled Delete Object
     Log   Add policy for OnDemand-Delete Object
     Add Device Policy for Delete Object in Scheduled      Test_Delete_Object_Scheduled
     #Verify the Success msg      Test_Delete_Object_Scheduled
     Delete the Policy           Test_Delete_Object_Scheduled

Import of BC Network Policies
    [Documentation]   Import of BC Network Policies
    Log   Import of BC Network Policies
    Import Network Policies BC Schedule
    Verify BC Policy Import    TestImport_Schedule_BC
    Verify BC Policy Creation    TestImport_Schedule_BC
    Import Network Policies BC Event Type
    Verify BC Policy Import  TestImport_EventType_BC
    Verify BC Policy Creation  TestImport_EventType_BC
    Import Network Policies BC OnDemand
    Verify BC Policy Import  TestImport_OnDemand_BC
    Verify BC Policy Creation  TestImport_OnDemand_BC

Export of BC Network Policies
    [Documentation]   Export of BC Network Policies
    Log   Export of BC Network Policies
    Export Network Policies BC  TestImport_Schedule_BC
    Delete BC Network Policy  TestImport_Schedule_BC
    Export Network Policies BC  TestImport_EventType_BC
    Delete BC Network Policy  TestImport_EventType_BC
    Export Network Policies BC  TestImport_OnDemand_BC
    Delete BC Network Policy  TestImport_OnDemand_BC
Create On Demand SPV Network Policy for EnableBanner
   Add ondemand SPV Policy for EnableBanner    EnableBanner_SPV
   #Execute the Realdevice Policy          ${EnableBanner_policy_name_GPV}
   #Validate response in Device History       Tabular     1 hour         PROVISIONING    ${Cert_policy_name_GPV}
   BuiltIn.Sleep   10s
   Add Device for Network Policy
   #Verify Realdevice Success msg      ${EnableBanner_policy_name_GPV}

Verify EnableBanner SPV in device history
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open Real Device History Page
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Select Device History Items per Page
    Verify EnableBanner SPV details in history