*** Settings ***
Library             pyautogui
Resource            ../common/ui_common.robot
Resource            page/heartbeat_helper.robot
Resource            ../dashboard/page/dashboard_page_helper.robot

*** Variables ***

*** Keywords ***
Device HeartBeat Status CU_CP and DU
    [Documentation]  HeartBeat Status
    Log  Complete HeartBeat status
    Dashboard HeartBeat Trigger CU_CP and DU

Device HeartBeat Status CU_UP
    [Documentation]  HeartBeat Status
    Log  Complete HeartBeat status
    Dashboard HeartBeat Trigger CU_UP

Verify the missing heart beat count
    [Documentation]   Missing heartbeat
    Log  verify the missing heartbeat count
    Verifying HB details
	
Open HB Monitor Job for CUCP
    [Documentation]  Monitoring HB Timer for CUCP
    Verifying HB details
    #Stop DDLG VES job for CUCP
    #Wait for 2 mins
    #Start DDLG VES job for CUCP
    #Wait for 3 mins
    Get current HB details
    Compare current HB details with earlier HB details

Open HB Monitor Job for CUUP
    [Documentation]  Monitoring HB Timer for CUUP
    Verifying HB details
    #Stop DDLG VES job for CUUP
    #Wait for 2 mins
    #Start DDLG VES job for CUUP
    #Wait for 3 mins
    Get current HB details
    Compare current HB details with earlier HB details

Open HB Monitor Job for DU
    [Documentation]  Monitoring HB Timer for DU
    Verifying HB details
    #Stop DDLG VES job for DU
    #Wait for 2 mins
    #Start DDLG VES job for DU
    #Wait for 3 mins
    Get current HB details
    Compare current HB details with earlier HB details
	