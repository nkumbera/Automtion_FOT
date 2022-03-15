*** Settings ***
Library         String

*** Variables ***


*** Keywords ***
Open Alarms Page
    [Documentation]  Open Alarms Page
    ${page_url}=  Format String  ${DEVICE_ALARMS_PAGE}   dms_device_console=${DMS_UI_URL}   device_macid=${DEVICE3_MACID}