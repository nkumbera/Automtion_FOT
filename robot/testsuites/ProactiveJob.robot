*** Settings ***
*** Settings ***
Documentation       SoTool Test Scripts
#Suite Setup         DMS UI Login    # Login DMS UI with AdminUser
#Suite Setup         Device console Login
#Suite Teardown      DMS UI Logout    # Logging off
Resource            ../resources/common/ui_common.robot
Resource            ../resources/ProactiveJob/proactivejob_keywords.robot
Resource            ../resources/overwrridden_params_gNB/overwrridden_params.robot
Resource            ../resources/dashboard_6.0/dashboard_keywords.robot
Library             String
Test Teardown       DMS Network Console UI Logout


*** Variables ***
*** Test Cases ***
Verify Proactive Failure Recovery Job for CUCP
    [Tags]    CUCP_FR_Job     ProactiveFRJob    regression    working    regression_6.0
    DMS Network Console UI Login
    BuiltIn.Sleep  10s
    Open Proactive Provisioning Job Page
    Open Proactive FR Job Page for CUCP
    BuiltIn.Sleep  5s
    DMS Network Console UI Logout

Verify Proactive Failure Recovery Job for CUUP
    [Tags]    CUUP_FR_Job     ProactiveFRJob    regression    working    regression_6.0
    DMS Network Console UI Login
    BuiltIn.Sleep  10s
    Open Proactive Provisioning Job Page
    Open Proactive FR Job Page for CUUP
    BuiltIn.Sleep  5s
    DMS Network Console UI Logout

Verify Proactive Failure Recovery Job for DU
    [Tags]    DU_FR_Job     ProactiveFRJob    regression    working    regression_6.0
    DMS Network Console UI Login
    BuiltIn.Sleep  10s
    Open Proactive Provisioning Job Page
    Open Proactive FR Job Page for DU
    BuiltIn.Sleep  5s
    DMS Network Console UI Logout


Creation of Proactive Replan Job using schedule Daily with End by date option for CU-CP
    [Tags]    procative_replan_endby    regression    Proactive_replan    regression_6.0
    Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Configure value in Device console
    DMS Network Console UI Login
    BuiltIn.Sleep  10s
    Add Scheduled End By Replan Proactive Job
    BuiltIn.Sleep  180s
    Verify Proactive job execution Success    ${Replan_job_name_endby}
    Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Verify ves gNB provisioned value    ${DEVICE_PROVSIONED_DATA_CUCP}

Creation of Proactive Replan Job using schedule Daily with End After option for CUUP
    [Tags]    procative_replan_endafter   regression    Proactive_replan    regression_6.0
    Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Configure value in Device console
    DMS Network Console UI Login
    BuiltIn.Sleep  10s
    Add Scheduled End After Replan Proactive Job
    BuiltIn.Sleep  180s
    Verify Proactive job execution Success    ${Replan_job_name_endafter}
    Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Verify ves gNB provisioned value    ${DEVICE_PROVSIONED_DATA_CUCP}


Creation of Proactive Replan Job using schedule Daily with no End date option for DU
    [Tags]    procative_replan_noenddate   regression    Proactive_replan    regression_6.0
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Configure value in Device console
    DMS Network Console UI Login
    BuiltIn.Sleep  10s
    Add Scheduled No End Date Replan Proactive Job
    BuiltIn.Sleep  180s
    Verify Proactive job execution Success    ${Replan_job_name_noenddate}
    Device console Login
    Login with gNB Device ID  ${DU_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${DU_DEVICE1_MACID}
    Verify ves gNB provisioned value    ${DEVICE_gNB_PROVISIONING_DATA_PAGE}


Creation of Proactive Replan Job using Run Immediatly option for CU-CP
    [Tags]    procative_replan_runimmediately_cucp   regression    Proactive_replan    regression_6.0
    Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Configure value in Device console
    DMS Network Console UI Login
    BuiltIn.Sleep  10s
    Add Scheduled Run Immediately Replan Proactive Job    ${CU_CP_DEVICE1_MACID}    CP
    BuiltIn.Sleep  180s
    Verify Proactive job execution Success    ${Replan_job_name_run_immediate}
    Device console Login
    Login with gNB Device ID  ${CU_CP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_CP_DEVICE1_MACID}
    Verify ves gNB provisioned value    ${DEVICE_PROVSIONED_DATA_CUCP}


Creation of Proactive Replan Job using Run Immediatly option for CU-UP
    [Tags]    procative_replan_runimmediately_cuup   regression    Proactive_replan    regression_6.0
    Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Configure value in Device console
    DMS Network Console UI Login
    BuiltIn.Sleep  10s
    Add Scheduled Run Immediately Replan Proactive Job    ${CU_UP_DEVICE1_MACID}    UP
    BuiltIn.Sleep  180s
    Verify Proactive job execution Success    ${Replan_job_name_run_immediate}
    Device console Login
    Login with gNB Device ID  ${CU_UP_DEVICE1_MACID}
    set global variable  ${DEVICE_MACID}  ${CU_UP_DEVICE1_MACID}
    Verify ves gNB provisioned value    ${DEVICE_PROVSIONED_DATA_CUCP}
Creation of Proactive Replan Job using Run Immediatly option for DU
    [Tags]    procative_replan_runimmediately_du   regression    Proactive_replan    regression_6.0
    Device console Login
    Login with gNB Device ID  ${DU_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    Configure value in Device console
    DMS Network Console UI Login
    BuiltIn.Sleep  10s
    Add Scheduled Run Immediately Replan Proactive Job    ${DU_VENUE_DEVICE1}    DU
    BuiltIn.Sleep  180s
    Verify Proactive job execution Success    ${Replan_job_name_run_immediate}
    Device console Login
    Login with gNB Device ID  ${DU_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    Verify the ves gNB provisioned value   ${DEVICE_PROVSIONED_DATA_CUCP}

Creation of Proactive Replan Job using Run Immediatly with Reset option for CU-CP
    [Tags]    procative_replan_reset_cucp   regression    Proactive_replan     regression_6.0
    Device console Login
    Login with gNB Device ID  ${CU_CP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    Configure value in Device console
    DMS Network Console UI Login
    BuiltIn.Sleep  10s
    Add Scheduled Run Immediately Reset Proactive Job    ${CU_CP_VENUE_DEVICE1}    CP
    BuiltIn.Sleep  180s
    Verify Proactive job execution Success    ${Reset_job_name_run_immediate}
    Device console Login
    Login with gNB Device ID  ${CU_CP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    Verify ves gNB provisioned value    ${DEVICE_PROVSIONED_DATA_CUCP}

Creation of Proactive Replan Job using Run Immediatly with Reset option for CU-UP
    [Tags]    procative_replan_reset_cuup   regression    Proactive_replan    regression_6.0
    Device console Login
    Login with gNB Device ID  ${CU_UP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_UP_VENUE_DEVICE1}
    Configure value in Device console
    DMS Network Console UI Login
    BuiltIn.Sleep  10s
    Add Scheduled Run Immediately Reset Proactive Job    ${CU_UP_VENUE_DEVICE1}    UP
    BuiltIn.Sleep  180s
    Verify Proactive job execution Success    ${Reset_job_name_run_immediate}
    Device console Login
    Login with gNB Device ID  ${CU_UP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_UP_VENUE_DEVICE1}
    Verify ves gNB provisioned value    ${DEVICE_PROVSIONED_DATA_CUCP}

Creation of Proactive Replan Job using Run Immediatly with Reset option for DU
    [Tags]    procative_replan_reset_du   regression    Proactive_replan    regression_6.0
    Device console Login
    Login with gNB Device ID  ${DU_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    Configure value in Device console
    DMS Network Console UI Login
    BuiltIn.Sleep  10s
    Add Scheduled Run Immediately Reset Proactive Job    ${DU_VENUE_DEVICE1}    DU
    BuiltIn.Sleep  180s
    Verify Proactive job execution Success    ${Reset_job_name_run_immediate}
    Device console Login
    Login with gNB Device ID  ${DU_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    Verify ves gNB provisioned value    ${DEVICE_PROVSIONED_DATA_CUCP}

Creation of Proactive Replan Job using schedule Daily with Reboot option for CUUP
    [Tags]    procative_replan_endafter_cuup   regression    Proactive_replan    procative_replan_cuup_reboot    regression_6.0
    Device console Login
    Login with gNB Device ID  ${CU_UP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_UP_VENUE_DEVICE1}
    Configure value in Device console
    DMS Network Console UI Login
    BuiltIn.Sleep  10s
    Add Scheduled End After Reboot Proactive Job    ipsec_up_filter    UP
    BuiltIn.Sleep  180s
    Verify Proactive job execution Success    ${Reboot_job_name_endafter}
    Device console Login
    Login with gNB Device ID  ${CU_UP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_UP_VENUE_DEVICE1}
    Verify ves gNB provisioned value    ${DEVICE_PROVSIONED_DATA_CUCP}

Creation of Proactive Replan Job using schedule Daily with Reboot option for CUCP
    [Tags]    procative_replan_endafter_cucp   regression    Proactive_replan    procative_replan_cuup_reboot     regression_6.0
    Device console Login
    Login with gNB Device ID  ${CU_CP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    Configure value in Device console
    DMS Network Console UI Login
    BuiltIn.Sleep  10s
    Add Scheduled End After Reboot Proactive Job    ipsec_cp_filter    CP
    BuiltIn.Sleep  180s
    Verify Proactive job execution Success    ${Reboot_job_name_endafter}
    Device console Login
    Login with gNB Device ID  ${CU_CP_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${CU_CP_VENUE_DEVICE1}
    Verify ves gNB provisioned value    ${DEVICE_PROVSIONED_DATA_CUCP}

Creation of Proactive Replan Job using schedule Daily with Reboot option for DU
    [Tags]    procative_replan_endafter_du   regression    Proactive_replan    procative_replan_cuup_reboot    regression_6.0
    Device console Login
    Login with gNB Device ID  ${DU_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    Configure value in Device console
    DMS Network Console UI Login
    BuiltIn.Sleep  10s
    Add Scheduled End After Reboot Proactive Job    ipsec_du_filter    DU
    BuiltIn.Sleep  180s
    Verify Proactive job execution Success    ${Reboot_job_name_endafter}
    Device console Login
    Login with gNB Device ID  ${DU_VENUE_DEVICE1}
    set global variable  ${DEVICE_MACID}  ${DU_VENUE_DEVICE1}
    Verify ves gNB provisioned value    ${DEVICE_PROVSIONED_DATA_CUCP}

Parallel Execution of Proactive Replan Jobs for CP/UP/DU
    [Tags]    procative_replan_parallel    Proactive_replan    regression_6.0
    DMS Network Console UI Login
    BuiltIn.Sleep  10s
    Add Scheduled CP Parallel Proactive Job    ${CU_CP_VENUE_DEVICE1}    CP
    Add Scheduled UP Parallel Proactive Job    ${CU_UP_VENUE_DEVICE1}    UP