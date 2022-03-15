
*** Settings ***
Library             pyautogui
Resource            ../common/ui_common.robot
Resource            page/firmwareupgrade_helper.robot
Variables            testdata/firmwareupgrade_testdata.py
Resource             ../resources/History_page/history_page_keywords.robot
Resource             ../resources/Import/Import_keywords.robot
Resource             ../resources/ProactiveJob/proactivejob_keywords.robot




*** Variables ***
*** Keywords ***
Open Firmware Upgrade Image creation Page
    [Documentation]  Navigating to Firmware Upgrade Image creation page
    Firmware Upgrade Image Page Navigation

Create URL based non-split RP only Image
    Add URL based Firmware Upgrade
    Verify Added Image in Firmware Image page

Delete URL based non-split RP only Image
    Delete Firmware Image

Open Firmware Upgrade Manage Page
    [Documentation]  Navigating to Firmware Upgrade Manage page
    Firmware Upgrade Manage Page Navigation

Create RP5100 Firmware Upgrade Job
    Schedule RP Only Firmware Upgrade Job

    Verify RP Firmware Job Status  Finished

Verify FIrmware Upgrade in device History
    [Arguments]  ${tab_type}  ${time_option}  ${event_type}
    Open gNB Device History Page  ${DEVICE_HiSTORY_PARAMETER_CU}
    Select Tabular Tab  ${tab_type}
    Select Time Option  ${time_option}
    Select Event Category and Click on Show Button  ${event_type}
    Select Device History Items per Page
    Verify Firmware Upgrade details in history

Delete Firmware Upgrade Job
    Delete Firmware Job

