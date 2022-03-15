*** Settings ***
Library  ../user_keywords/window_operations.py
Resource  ../common/ui_common.robot
Resource  page/Policy_helper.robot
Resource  ../device_history/device_history_page_keywords.robot

*** Variables ***

*** Keywords ***
Import Config Files
    [Documentation]  Importing the config file
    Log  Import log file
    Click Element  ID_MENU_ACTION
    Wait Until Page Contains Element  id=DC_Menu_deviceaction_ID  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Click Element  id=DC_Menu_deviceaction_ID
    Reload Page
    Wait Until Page Contains Element  id=DC_Dashboard_Header  timeout=${BROWSER_ELEMENT_TIMEOUT}
    #inputfile

On Demand DevicePolicy Update
    [Documentation]   Adding the device policy update for GPV on Demand
    Log   Add Policy for GPV on Demand
    Delete the Policy           Test_onDemand
    Add Device Policy for GPV On Demand    Test_onDemand
    Validate response in Device History       Tabular     1 hour         PROVISIONING     Test_onDemand
    Verify the Success msg      Test_onDemand


Scheduled DevicePolicy Update
     [Documentation]   Adding the device policy update for SPV Scheduled
     Log   Add policy for SPV scheduled
     Delete the Policy           Test_Scheduled
     Add Device Policy for SPV Scheduled     Test_Scheduled
     BuiltIn.Sleep   180s
     Execute the Policy          Test_Scheduled
     Validate response in Device History       Tabular     1 hour         PROVISIONING    Test_Scheduled
     Verify the Success msg      Test_Scheduled


GPA all event type device policy update
     [Documentation]   Adding the device policy update for event type-All
     Log   Add policy for Event type all-GPA
     Delete the Policy           Test_EventType
     Add Device Policy for GPA Event Type All      Test_EventType
     #Validate response in Device History      Tabular     1 hour         PROVISIONING     Test_EventType
    # Verify the Success msg      Test_EventType


SPA periodic event type device policy update
     [Documentation]   Adding the device policy update for event type-Periodic SPA
     Log   Add policy for Event type periodic-SPA
     Delete the Policy           Test_EventType_Periodic
     Add Device Policy for SPA Event Type Periodic      Test_EventType_Periodic
    # Validate response in Device History       Tabular     1 hour         PROVISIONING    Test_EventType_Periodic
    # Verify the Success msg      Test_EventType_Periodic



Add Object in Boot event type device policy update
     [Documentation]   Adding the device policy update for event type-Boot Add Object
     Log   Add policy for Event type Boot-Add Object
     Delete the Policy           Test_Add_Object_Boot
     Add Device Policy for Add Object in Event Type Boot      Test_Add_Object_Boot
    # Validate response in Device History       Tabular     1 hour         PROVISIONING     Test_Add_Object_Boot
    # Verify the Success msg      Test_Add_Object_Boot


Add Object in BootStrap event type device policy update
     [Documentation]   Adding the device policy update for event type-BootStrap Add Object
     Log   Add policy for Event type BootStrap-Add Object
     Delete the Policy           Test_Add_Object_BootStrap
     Add Device Policy for Add Object in Event Type BootStrap      Test_Add_Object_BootStrap
   #  Validate response in Device History       Tabular     1 hour         PROVISIONING    Test_Add_Object_BootStrap
   #  Verify the Success msg      Test_Add_Object_BootStrap


Import Device Policy
    [Documentation]  Device Policy import
    Device Policy Import


Clone Device Policy
    [Documentation]  Device policy clone
    Device Policy Clone


Export Device Policy
    [Documentation]  Device policy export
    Device Policy Export

