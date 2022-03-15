*** Keywords ***
*** Settings ***
Library             pyautogui
Resource            ../common/ui_common.robot
Resource            page/proactivejob_helper.robot




*** Variables ***
*** Keywords ***
Open Proactive Provisioning Job Page
    [Documentation]  Navigating to Proactive Provisioning Job Page
    Proactive Provisioning Page Navigation

Open Proactive FR Job Page for CUCP
    [Documentation]  Navigating to Proactive Provisioning FR Job Page for CUCP
    CUCP FR Proactive_Job Verification
    CUCP Job Name Verification
    FR Job Operation Details
    FR Job Execution Details
    Edit FR Job Execution Details
    CUCP Device Type Verification
    FR Job Device Selection Criteria
    FR Job Failure Reasons Validation
    FR Job Edit Failure Reason Criteria
    Cancel the Changes

Open Proactive FR Job Page for CUUP
    [Documentation]  Navigating to Proactive Provisioning FR Job Page for CUCP
    CUUP FR Proactive_Job Verification
    CUUP Job Name Verification
    FR Job Operation Details
    FR Job Execution Details
    Edit FR Job Execution Details
    CUUP Device Type Verification
    FR Job Device Selection Criteria
    FR Job Failure Reasons Validation
    FR Job Edit Failure Reason Criteria
    Cancel the Changes

Open Proactive FR Job Page for DU
    [Documentation]  Navigating to Proactive Provisioning FR Job Page for CUCP
    DU FR Proactive_Job Verification
    DU Job Name Verification
    FR Job Operation Details
    FR Job Execution Details
    Edit FR Job Execution Details
    DU Device Type Verification
    FR Job Device Selection Criteria
    FR Job Failure Reasons Validation
    FR Job Edit Failure Reason Criteria
    Cancel the Changes

Add Scheduled End By Replan Proactive Job
    Open Proactive Provisioning Page
    Delete Existing Job    ${Replan_job_name_endby}
    Add gNB Endby Proactive job    ${Replan_job_name_endby}    ${Device_Operation_type}
    Add gNB Device for Proactive Job    ${CU_CP_DEVICE1_MACID}

Add Scheduled End After Replan Proactive Job
    Open Proactive Provisioning Page
    Delete Existing Job    ${Replan_job_name_endafter}
    Add gNB End After Proactive job    ${Replan_job_name_endafter}    ${Device_Operation_type}
    Add gNB Device for Proactive Job    ${CU_UP_DEVICE1_MACID}

Add Scheduled No End Date Replan Proactive Job
    Open Proactive Provisioning Page
    Delete Existing Job    ${Replan_job_name_noenddate}
    BuiltIn.Sleep  10s
    Add gNB no end date Proactive job    ${Replan_job_name_noenddate}    ${Device_Operation_type}
    Add gNB Device for Proactive Job    ${DU_DEVICE1_MACID}

Add Scheduled Run Immediately Replan Proactive Job
    [Arguments]  ${Device_name}   ${device_type}
    Open Proactive Provisioning Page
    Delete Existing Job    ${Replan_job_name_run_immediate}
    Add gNB run immediately Proactive job    ${Replan_job_name_run_immediate}    ${Device_Operation_type}    ${device_type}
    Add gNB Device for Proactive Job    ${Device_name}

Verify Proactive job execution Success
   [Arguments]     ${job_name}
   Open Proactive Provisioning Page
   Verify execution Status    ${job_name}

Configure value in Device console
    Open gNB Overridden Parameter Page
    Delete gNB DMS VES Overriden Parameter    VES
    Save VNF Overriden Parameter
    Replan gNB Device
    Search gNB DMS Overriden Parameter CP    VES
    update DMS ves values cucp     http://10.211.1.11:7001/eventListener/v20    admin   admin
    Save VNF Overriden Parameter

Verify the ves gNB provisioned value
    [arguments]  ${DEVICE_gNB_PROVISIONING_DATA_PAGE}
    Open gNB Provisioning Data    ${DEVICE_gNB_PROVISIONING_DATA_PAGE}
    Search DMS Overriden Parameter    DU Node    VES
    Verify ves provisioned value


Verify ves gNB provisioned value
    [arguments]  ${DEVICE_gNB_PROVISIONING_DATA_PAGE}
    Open gNB Provisioning Data    ${DEVICE_gNB_PROVISIONING_DATA_PAGE}
    Search gNB DMS Overriden Parameter CP     VES
    Verify ves provisioned value

Add Scheduled Run Immediately Reset Proactive Job
    [Arguments]  ${Device_name}   ${device_type}
    Open Proactive Provisioning Page
    Delete Existing Job    ${Reset_job_name_run_immediate}
    Add gNB run immediately Proactive job    ${Reset_job_name_run_immediate}    ${Reset_Operation_type}    ${device_type}
    Add gNB Device for Proactive Job    ${Device_name}

Add Scheduled End After Reboot Proactive Job
    [Arguments]    ${Device_filter}  ${device_type}
    Open Proactive Provisioning Page
    Delete Existing Job    ${Reboot_job_name_endafter}
    Add gNB End After Reboot Proactive job    ${Reboot_job_name_endafter}    Reboot    2   ${device_type}
    Select and Add gNB Filter Device for Proactive Job    ${Device_filter}


Add Scheduled CP Parallel Proactive Job
    [Arguments]  ${Device_name}   ${device_type}
    Open Proactive Provisioning Page
    Delete Existing Job    ${parallel_cp_job}
    #${schedule_time}    Select parallel schedule time
    #Add gNB no end date Parallel Proactive job    ${parallel_cp_job}    ${Device_Network_Operation_type}    ${device_type}   ${schedule_time}
    Add gNB no end date Parallel Proactive job    ${parallel_cp_job}    ${Device_Network_Operation_type}    ${device_type}
    Add gNB Device for Proactive Job    ${Device_name}

Add Scheduled UP Parallel Proactive Job
    [Arguments]  ${Device_name}   ${device_type}
    Open Proactive Provisioning Page
    Delete Existing Job    ${parallel_up_job}

    Add gNB no end date Parallel Proactive job UP device    ${parallel_up_job}    ${Device_Network_Operation_type}    ${device_type}
    Add gNB Device for Proactive Job    ${Device_name}