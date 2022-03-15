
*** Settings ***
Library             String
Variables           ServiceSetting_ui_controls.py
Resource           ../resources/ServiceSetting/testdata/ServiceSetting_testdata.py
#Library             String
Variables           SO_Tool_ui_controls.py
Variables           ../testdata/Import_testdata.py
Resource           ../resources/device_history/device_history_page_keywords.robot
Variables           device_history_ui_controls.py

*** Variables ***
${UploadFiletest}           css=[type='file']
${AddFile}           ${NETCONF_FILE_LOCATION}
${AddMountFile}      ${EXECDIR}${MOUNT_UMANAGED_FILE_LOCATION}


*** Keywords ***


Search Venue name in sotool
    [Arguments]  ${venue_name}
    BuiltIn.Sleep  3s
    Scroll Element Into View  ${VENUE_HIGHCHARTS_BAR_BUTTON}
    BuiltIn.Sleep  13s
    #Click DMS Element  ${ADD_VENUE_BUTTON}
    #BuiltIn.Sleep  13s
    Click DMS Element    ${VENUE_HIGHCHARTS_BAR_BUTTON}
    #Wait Until Page Contains Element  ${CUSTOMER_INFORMATION_VIEW_HEADER}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  5s
    Click DMS Element  ${SEARCH_SOTOOL_VENUE_NAME}
    BuiltIn.Sleep  5s
    Input Text  ${SEARCH_SOTOOL_VENUE_NAME}  ${venue_name}
    BuiltIn.Sleep  5s
    Click DMS Element  ${VENUE_EXPORT_BUTTON}
    BuiltIn.Sleep  10s
    log    ${venue_name}


Perform Deploy DMS Config in Summary and Export Page
    BuiltIn.Sleep  3s
    Click DMS Element  ${DEPLOY_DMS_CONFIG_BUTTON}
    BuiltIn.Sleep  10s
    Wait Until Page Contains Element  ${XPATH_DEPLOY_DOWNLOAD_SUCCESS}    timeout=50s
    Wait Until Element Is Visible  ${XPATH_DEPLOY_DOWNLOAD_SUCCESS}       timeout=50s
    ${success_value}        Get Text     ${XPATH_DEPLOY_DOWNLOAD_SUCCESS}
    Log             ${success_value}
    Should Contain    ${success_value}      	Deploy DMS Config Status - Success

    ${success_value1}        Get Text     ${XPATH_DEPLOY_CONFIG_SUCCESS}
    Log             ${success_value1}
    Should Contain    ${success_value1}       "venue":"SUCCESS","entitymapping":"SUCCESS","netconf":"SUCCESS","servicesetting":"SUCCESS"