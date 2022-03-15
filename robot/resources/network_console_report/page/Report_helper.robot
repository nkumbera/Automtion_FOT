*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Variables           Report_ui_controls.py
Library             String
Library             OperatingSystem

*** Variables ***
${HOST}                ${SERVER_IP}
${USERNAME}            ${SERVER_USERNAME}
${PASSWORD}            ${SERVER_PASSWORD}


*** Keywords ***
Open Reports Page
    [Documentation]  Open Reports page
    go to   ${DMS_Network_PAGE_URL}
    Wait Until Page Contains Element  ${XPATH_REPORT_TABLE}  timeout=${BROWSER_ELEMENT_TIMEOUT}

OneCell BC Master Report
      [Arguments]    ${Export_File_Name}
      BuiltIn.Sleep  5s
      Input Text    ${XPATH_REPORT_NAME1_FILTERBOX}  ${Export_File_Name}
      BuiltIn.Sleep  3s

OneCell BC Device Status
      BuiltIn.Sleep  5s
      Input Text    ${XPATH_REPORT_NAME1_FILTERBOX}  BC Device Status
      BuiltIn.Sleep  3s

OneCell Device License
      BuiltIn.Sleep  5s
      Input Text    ${XPATH_REPORT_NAME1_FILTERBOX}  Device License
      BuiltIn.Sleep  3s

OneCell RP5100 Device Status
      BuiltIn.Sleep  5s
      Input Text    ${XPATH_REPORT_NAME1_FILTERBOX}  RP5100 Device Status
      BuiltIn.Sleep  3s

OneCell RP Device Status
      BuiltIn.Sleep  5s
      Input Text    ${XPATH_REPORT_NAME1_FILTERBOX}  RP Device Status
      BuiltIn.Sleep  3s

OneCell BC Delta Device Config
      BuiltIn.Sleep  5s
      Input Text    ${XPATH_REPORT_NAME1_FILTERBOX}  BC Delta Device Config
      BuiltIn.Sleep  3s

OneCell RP Delta Device Config
      BuiltIn.Sleep  5s
      Input Text    ${XPATH_REPORT_NAME1_FILTERBOX}  RP Delta Device Config
      BuiltIn.Sleep  3s

OneCell RP Master Device Config
      BuiltIn.Sleep  5s
      Input Text    ${XPATH_REPORT_NAME1_FILTERBOX}  RP Master Device Config
      BuiltIn.Sleep  3s

OneCell GoldStandard Compliance
      BuiltIn.Sleep  5s
      Input Text    ${XPATH_REPORT_NAME1_FILTERBOX}  GoldStandard Compliance
      BuiltIn.Sleep  3s

OneCell RP5100 Delta Device Config
      BuiltIn.Sleep  5s
      Input Text    ${XPATH_REPORT_NAME1_FILTERBOX}  RP5100 Delta Device Config
      BuiltIn.Sleep  3s

OneCell RP5100 Master Device Config
      BuiltIn.Sleep  5s
      Input Text    ${XPATH_REPORT_NAME1_FILTERBOX}  RP5100 Master Device Config
      BuiltIn.Sleep  3s

ONECELL5G CUCP Device Config
      BuiltIn.Sleep  5s
      Input Text    ${XPATH_REPORT_NAME}  ONECELL5G CUCP Device Config
      BuiltIn.Sleep  3s

ONECELL5G CUCP Device Status
      BuiltIn.Sleep  5s
      Input Text    ${XPATH_REPORT_NAME}  ONECELL5G CUCP Device Status
      BuiltIn.Sleep  3s

ONECELL5G Device Config
      [Arguments]  ${VNF_Device_type}
      BuiltIn.Sleep  5s
      Input Text    ${XPATH_REPORT_NAME}  ${VNF_Device_type}
      BuiltIn.Sleep  3s

ONECELL5G CUUP Device Config
      BuiltIn.Sleep  5s
      Input Text    ${XPATH_REPORT_NAME}  ONECELL5G CUUP Device Config
      BuiltIn.Sleep  3s

ONECELL5G CUUP Device Status
      BuiltIn.Sleep  5s
      Input Text    ${XPATH_REPORT_NAME}  ONECELL5G CUUP Device Status
      BuiltIn.Sleep  3s

ONECELL5G DU Device Config
      BuiltIn.Sleep  5s
      Input Text    ${XPATH_REPORT_NAME}  ONECELL5G DU Device Config
      BuiltIn.Sleep  3s

ONECELL5G DU Device Status
      BuiltIn.Sleep  5s
      Input Text    ${XPATH_REPORT_NAME}  ONECELL5G DU Device Status
      BuiltIn.Sleep  3s

ONECELL RP5200 Device Status
      BuiltIn.Sleep  5s
      Input Text    ${XPATH_REPORT_NAME}  ONECELL RP5200 Device Status
      BuiltIn.Sleep  3s

Export Report
    [Documentation]     Export Report
    BuiltIn.Sleep  10s
    Wait Until Page Contains Element  id=NC_Reports_ExportButton  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Click DMS Element  id=NC_Reports_ExportButton
    Wait Until Page Contains Element  id=NC_Reports_Window_Ok  timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  10s
    Click DMS Element  id=NC_Reports_Window_Ok


Export Confirm
    [Documentation]     confirm the export dialog
    Wait Until Page Contains Element  id=NC_Reports_Window_Ok  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Click DMS Element  id=NC_Reports_Window_Ok

Apply Filter
      [Documentation]     Apply the filter
      Wait Until Page Contains Element  id =NC_Reports_ApplyFilter  timeout=${BROWSER_ELEMENT_TIMEOUT}
      BuiltIn.Sleep  5s
      click dms element  id =NC_Reports_ApplyFilter

Click CheckBox
      [Documentation]     Click the radio button
      Wait Until Page Contains Element  id = NC_Reports_ChkBox_  timeout=${BROWSER_ELEMENT_TIMEOUT}
      BuiltIn.Sleep  5s
      click dms element  id = NC_Reports_ChkBox_

Select toggle button
     click dms element  id = NC_Reports_ToggleButton_6
     click dms element  id = NC_Reports_Window_Ok

Enable toggle button
      [Documentation]    Enable the toggle button
      #Wait Until Element Is Enabled  id = NC_Reports_ToggleButton_6  timeout=${BROWSER_ELEMENT_TIMEOUT}
      #Element Should Be Enabled    id = NC_Reports_ToggleButton_6
      #${value}      Get Text   id = NC_Reports_ToggleButton_6
      #Log         ${value}
      #${select_value}          Element Should Be Disabled    id = NC_Reports_ToggleButton_6
      #Log      ${select_value}
      #${value}        runKeywordAndExpectError  Toggle Button \'id = NC_Reports_ToggleButton_6\' is not selected.  click dms element  id = NC_Reports_ToggleButton_6    click dms element  id = NC_Reports_Window_Ok
      #Log           ${value}
      #Toggle Button Should Be Selected         id = NC_Reports_ToggleButton_6
      #${value}=          Get Text           ${TOOL_TIP_TEXT}
      #Log           ${value}
      #${value}=          Get Value          ${TOOL_TIP_TEXT}
      #Log           ${value}
      BuiltIn.Sleep  3s
      ${value}=                 Run Keyword And Return Status         Element Should Be Enabled       id = NC_Reports_ToggleButton_6
      Log           ${value}
      Run Keyword If    ${value} == False         Select toggle button
      #click dms element  id = NC_Reports_ToggleButton_6
      #click dms element  id = NC_Reports_Window_Ok


Disable toggle button
      [Documentation]    Disable the toggle button
      Wait Until Element Is Enabled  id = NC_Reports_ToggleButton_6  timeout=${BROWSER_ELEMENT_TIMEOUT}
      BuiltIn.Sleep  5s
      click dms element  id = NC_Reports_ToggleButton_6
      click dms element  id = NC_Reports_Window_Ok
      Element Should Be Enabled   id = NC_Reports_ToggleButton_6


Operational History Navigate
     [Documentation]    Go to Operation History Page
     Wait Until Element Is Enabled  id = NC_DMSHeader_Operation_History_Button  timeout=${BROWSER_ELEMENT_TIMEOUT}
     BuiltIn.Sleep  5s
     click dms element  id = NC_DMSHeader_Operation_History_Button

Operational History Apply Filter Master device config
     [Documentation]    Apply the filter in Operation History Page
     [Arguments]       ${Filter_Name}
     BuiltIn.Sleep  6s
     Input Text     ${XPATH_RESOURCE_NAME_FILTER}      ${Filter_Name}
     BuiltIn.Sleep  5s
     click dms element  id = DC_OperationHistory_ApplyFilter_Button
     BuiltIn.Sleep  5s

Operational History Apply Filter Master device status
     [Documentation]    Apply the filter in Operation History Page
     BuiltIn.Sleep  5s
     Input Text     ${XPATH_RESOURCE_NAME_FILTER}      Master-device-status
     BuiltIn.Sleep  3s
     click dms element  id = DC_OperationHistory_ApplyFilter_Button
     BuiltIn.Sleep  3s

Operational History Apply Filter Device License
     [Documentation]    Apply the filter in Operation History Page
     BuiltIn.Sleep  5s
     Input Text     ${XPATH_RESOURCE_NAME_FILTER}      LicenseInUse
     BuiltIn.Sleep  3s
     click dms element  id = DC_OperationHistory_ApplyFilter_Button
     BuiltIn.Sleep  3s

Operational History Apply Filter RP5100 Device Status
     [Documentation]    Apply the filter in Operation History Page
     BuiltIn.Sleep  5s
     #Input Text     ${XPATH_RESOURCE_NAME_FILTER}      NGRadio_RFModule_Master-device-status
     Input Text     ${XPATH_RESOURCE_NAME_FILTER}      ONECELL_RU51_RFModule_Master-device-status
     BuiltIn.Sleep  3s
     click dms element  id = DC_OperationHistory_ApplyFilter_Button
     BuiltIn.Sleep  3s

Operational History Apply Filter RP Device Status
     [Documentation]    Apply the filter in Operation History Page
     BuiltIn.Sleep  7s
     Input Text     ${XPATH_RESOURCE_NAME_FILTER}      Radio_Master-device-status
     BuiltIn.Sleep  3s
     click dms element  id = DC_OperationHistory_ApplyFilter_Button
     BuiltIn.Sleep  3s

Operational History Apply Filter BC Delta Device Config
     [Documentation]    Apply the filter in Operation History Page
     BuiltIn.Sleep  5s
     Input Text     ${XPATH_RESOURCE_NAME_FILTER}      Cntrl_Delta-device-config
     BuiltIn.Sleep  3s
     click dms element  id = DC_OperationHistory_ApplyFilter_Button
     BuiltIn.Sleep  3s

Operational History Apply Filter RP Delta Device Config
     [Documentation]    Apply the filter in Operation History Page
     BuiltIn.Sleep  5s
     Input Text     ${XPATH_RESOURCE_NAME_FILTER}      Radio_Delta-device-config
     BuiltIn.Sleep  3s
     click dms element  id = DC_OperationHistory_ApplyFilter_Button
     BuiltIn.Sleep  3s

Operational History Apply Filter RP Master Device Config
     [Documentation]    Apply the filter in Operation History Page
     BuiltIn.Sleep  5s
     Input Text     ${XPATH_RESOURCE_NAME_FILTER}      Radio_Master-device-config
     BuiltIn.Sleep  3s
     click dms element  id = DC_OperationHistory_ApplyFilter_Button
     BuiltIn.Sleep  3s

Operational History Apply Filter GoldStandard Compliance
     [Documentation]    Apply the filter in Operation History Page
     BuiltIn.Sleep  5s
     Input Text     ${XPATH_RESOURCE_NAME_FILTER}      goldstandard
     BuiltIn.Sleep  3s
     click dms element  id = DC_OperationHistory_ApplyFilter_Button
     BuiltIn.Sleep  3s

Operational History Apply Filter RP5100 Delta Device Config
     [Documentation]    Apply the filter in Operation History Page
     BuiltIn.Sleep  5s
     #Input Text     ${XPATH_RESOURCE_NAME_FILTER}      NGRadio_RFModule_Delta-device-config
     Input Text     ${XPATH_RESOURCE_NAME_FILTER}      ONECELL_RU51_RFModule_Delta-device-config
     BuiltIn.Sleep  3s
     click dms element  id = DC_OperationHistory_ApplyFilter_Button
     BuiltIn.Sleep  3s

Operational History Apply Filter RP5100 Master Device Config
     [Documentation]    Apply the filter in Operation History Page
     BuiltIn.Sleep  5s
#     Input Text     ${XPATH_RESOURCE_NAME_FILTER}      NGRadio_RFModule_Master-device-config
     Input Text     ${XPATH_RESOURCE_NAME_FILTER}      ONECELL_RU51_RFModule_Master-device-config
     BuiltIn.Sleep  3s
     click dms element  id = DC_OperationHistory_ApplyFilter_Button
     BuiltIn.Sleep  3s

Operational History Apply Filter ONECELL5G CUCP Device Config
    [Documentation]    Apply the filter in Operation History Page
     BuiltIn.Sleep  4s
     Input Text     ${XPATH_RESOURCENAME}      CUCP-Config
     BuiltIn.Sleep  3s
     click dms element  id = DC_OperationHistory_ApplyFilter_Button
     BuiltIn.Sleep  3s

Operational History Apply Filter ONECELL5G Device Status
    [Documentation]    Apply the filter in Operation History Page
    [Arguments]  ${VNF_type-status}
     BuiltIn.Sleep  4s
     Input Text     ${XPATH_RESOURCENAME}      ${VNF_type-status}
     BuiltIn.Sleep  3s
     click dms element  id = DC_OperationHistory_ApplyFilter_Button
     BuiltIn.Sleep  3s

Operational History Apply Filter ONECELL5G CUUP Device Config
    [Documentation]    Apply the filter in Operation History Page
     BuiltIn.Sleep  4s
     Input Text     ${XPATH_RESOURCENAME}      CUUP-Config
     BuiltIn.Sleep  3s
     click dms element  id = DC_OperationHistory_ApplyFilter_Button
     BuiltIn.Sleep  3s


Operational History Apply Filter ONECELL5G DU Device Config
    [Documentation]    Apply the filter in Operation History Page
     BuiltIn.Sleep  4s
     Input Text     ${XPATH_RESOURCENAME}      DU-Config
     BuiltIn.Sleep  3s
     click dms element  id = DC_OperationHistory_ApplyFilter_Button
     BuiltIn.Sleep  3s

Operational History Download BC Master Report File
     [Documentation]    Download the Report file in History Page
     click dms element    ${XPATH_OPERATIONAL_HISTORY_REPORT}
     BuiltIn.Sleep  5s
     ${BC_Master_File_Name}    get text     ${XPATH_OPERATIONAL_HISTORY_REPORT}
     Log    ${BC_Master_File_Name}
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_COMPLETE}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_SUCCESS}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     ${value}        Get Text     ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Log             ${value}
     #Should Contain    ${value}      ${DOWNLOAD_COMPLETE_VALUE_BC_MASTER}
     ${success_value}        Get Text     ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     Log             ${success_value}
     Should Contain    ${success_value}      ${DOWNLOAD_SUCCESS_VALUE}
     [Return]    ${BC_Master_File_Name}

Operational History Download BC Device Status Report File
     [Documentation]    Download the Report file in History Page
     click dms element    ${XPATH_OPERATIONAL_HISTORY_REPORT}
     BuiltIn.Sleep  5s
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_COMPLETE}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_SUCCESS}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     ${value}        Get Text     ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Log             ${value}
     Should Contain    ${value}      ${DOWNLOAD_COMPLETE_VALUE_MASTER_DEVICE_STATUS}
     ${success_value}        Get Text     ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     Log             ${success_value}
     Should Contain    ${success_value}      ${DOWNLOAD_SUCCESS_VALUE}

Operational History Download LicenseInUse Report File
     [Documentation]    Download the Report file in History Page
     BuiltIn.Sleep  5s
     click dms element    ${XPATH_OPERATIONAL_HISTORY_REPORT}
     BuiltIn.Sleep  7s
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_COMPLETE}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_SUCCESS}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     ${value}        Get Text     ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Log             ${value}
     Should Contain    ${value}      ${DOWNLOAD_COMPLETE_VALUE_LICENSE}
     ${success_value}        Get Text     ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     Log             ${success_value}
     Should Contain    ${success_value}      ${DOWNLOAD_SUCCESS_VALUE}

Operational History Download RP5100 Device Status Report File
     [Documentation]    Download the Report file in History Page
     click dms element    ${XPATH_OPERATIONAL_HISTORY_REPORT}
     BuiltIn.Sleep  10s
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_COMPLETE}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_SUCCESS}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     ${value}        Get Text     ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Log             ${value}
     Should Contain    ${value}      ${DOWNLOAD_COMPLETE_VALUE_RP5100_DEVICE_STATUS}
     ${success_value}        Get Text     ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     Log             ${success_value}
     Should Contain    ${success_value}      ${DOWNLOAD_SUCCESS_VALUE}

Operational History Download RP Device Status Report File
     [Documentation]    Download the Report file in History Page
     click dms element    ${XPATH_OPERATIONAL_HISTORY_REPORT}
     BuiltIn.Sleep  5s
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_COMPLETE}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_SUCCESS}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     ${value}        Get Text     ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Log             ${value}
     Should Contain    ${value}      ${DOWNLOAD_COMPLETE_VALUE_RP_DEVICE_STATUS}
     ${success_value}        Get Text     ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     Log             ${success_value}
     Should Contain    ${success_value}      ${DOWNLOAD_SUCCESS_VALUE}

Operational History Download BC Delta Device Report File
     [Documentation]    Download the Report file in History Page
     BuiltIn.Sleep  7s
     click dms element    ${XPATH_OPERATIONAL_HISTORY_REPORT}
     BuiltIn.Sleep  7s
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_COMPLETE}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_SUCCESS}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     ${value}        Get Text     ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Log             ${value}
     Should Contain    ${value}      ${DOWNLOAD_COMPLETE_VALUE_BC_DELTA_DEVICE_CONFIG}
     ${success_value}        Get Text     ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     Log             ${success_value}
     Should Contain    ${success_value}      ${DOWNLOAD_SUCCESS_VALUE}

Operational History Download RP Delta Device Report File
     [Documentation]    Download the Report file in History Page
     click dms element    ${XPATH_OPERATIONAL_HISTORY_REPORT}
     BuiltIn.Sleep  5s
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_COMPLETE}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_SUCCESS}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     ${value}        Get Text     ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Log             ${value}
     Should Contain    ${value}      ${DOWNLOAD_COMPLETE_VALUE_RP_DELTA_DEVICE_CONFIG}
     ${success_value}        Get Text     ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     Log             ${success_value}
     Should Contain    ${success_value}      ${DOWNLOAD_SUCCESS_VALUE}

Operational History Download RP Master Device Report File
     [Documentation]    Download the Report file in History Page
     click dms element    ${XPATH_OPERATIONAL_HISTORY_REPORT}
     BuiltIn.Sleep  5s
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_COMPLETE}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_SUCCESS}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     ${value}        Get Text     ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Log             ${value}
     Should Contain    ${value}      ${DOWNLOAD_COMPLETE_VALUE_RP_MASTER_DEVICE_CONFIG}
     ${success_value}        Get Text     ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     Log             ${success_value}
     Should Contain    ${success_value}      ${DOWNLOAD_SUCCESS_VALUE}

Operational History Download GoldStandard Compliance Report File
     [Documentation]    Download the Report file in History Page
     click dms element    ${XPATH_OPERATIONAL_HISTORY_REPORT}
     BuiltIn.Sleep  5s
     #Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_COMPLETE}    timeout=20s
     #Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     #Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_SUCCESS}    timeout=20s
     #Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     ${value}        Get Text     ${DMS_OPERATION_HISTORY_TABLE_GOLD_STANDARD}
     Log             ${value}
     Should Contain    ${value}      ${DOWNLOAD_COMPLETE_VALUE_GoldStandard}
     #${success_value}        Get Text     ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     #Log             ${success_value}
     #Should Contain    ${success_value}      ${DOWNLOAD_SUCCESS_VALUE}

Operational History Download RP5100 Delta Device Config Report File
     [Documentation]    Download the Report file in History Page
     BuiltIn.Sleep  5s
     click dms element    ${XPATH_OPERATIONAL_HISTORY_REPORT}
     #BuiltIn.Sleep  5s
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_COMPLETE}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_SUCCESS}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     ${value}        Get Text     ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Log             ${value}
     Should Contain    ${value}      ${DOWNLOAD_COMPLETE_VALUE_RP5100_DELTA_DEVICE_CONFIG}
     ${success_value}        Get Text     ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     Log             ${success_value}
     Should Contain    ${success_value}      ${DOWNLOAD_SUCCESS_VALUE}

Operational History Download RP5100 Master Device Config Report File
     [Documentation]    Download the Report file in History Page
     click dms element    ${XPATH_OPERATIONAL_HISTORY_REPORT}
     BuiltIn.Sleep  5s
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_COMPLETE}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_SUCCESS}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     ${value}        Get Text     ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Log             ${value}
     Should Contain    ${value}      ${DOWNLOAD_COMPLETE_VALUE_RP5100_MASTER_DEVICE_CONFIG}
     ${success_value}        Get Text     ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     Log             ${success_value}
     Should Contain    ${success_value}      ${DOWNLOAD_SUCCESS_VALUE}

Operational History Download ONECELL5G CUCP Device Config Report File
    [Documentation]    Download the Report file in History Page
     click dms element    ${XPATH_OPERATIONAL_HISTORY_REPORT}
     BuiltIn.Sleep  4s
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_COMPLETE}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_SUCCESS}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     ${value}        Get Text     ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Log             ${value}
     Should Contain    ${value}      ${DOWNLOAD_COMPLETE_VALUE_ONECELL5G_CUCP_DEVICE_CONFIG}
     ${success_value}        Get Text     ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     Log             ${success_value}
     Should Contain    ${success_value}      ${DOWNLOAD_SUCCESS_VALUE}

Operational History Download ONECELL5G CUCP Device Report File
    [Documentation]    Download the Report file in History Page
    [Arguments]  ${download_complete}  ${download_success}
     click dms element    ${XPATH_OPERATIONAL_HISTORY_REPORT}
     BuiltIn.Sleep  4s
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_COMPLETE}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_SUCCESS}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     ${value}        Get Text     ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Log             ${value}
     #Should Contain    ${value}      ${DOWNLOAD_COMPLETE_VALUE_ONECELL5G_CUCP_DEVICE_CONFIG}
     Should Contain    ${value}      ${download_complete}
     ${success_value}        Get Text     ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     Log             ${success_value}
     Should Contain    ${success_value}      ${download_success}

Operational History Download ONECELL5G CUUP Device Config Report File
    [Documentation]    Download the Report file in History Page
     click dms element    ${XPATH_OPERATIONAL_HISTORY_REPORT}
     BuiltIn.Sleep  4s
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_COMPLETE}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_SUCCESS}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     ${value}        Get Text     ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Log             ${value}
     Should Contain    ${value}      ${DOWNLOAD_COMPLETE_VALUE_ONECELL5G_CUUP_DEVICE_CONFIG}
     ${success_value}        Get Text     ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     Log             ${success_value}
     Should Contain    ${success_value}      ${DOWNLOAD_SUCCESS_VALUE}

Operational History Download ONECELL5G DU Device Config Report File
    [Documentation]    Download the Report file in History Page
     click dms element    ${XPATH_OPERATIONAL_HISTORY_REPORT}
     BuiltIn.Sleep  4s
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_COMPLETE}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Wait Until Page Contains Element  ${XPATH_REPORT_DOWNLOAD_SUCCESS}    timeout=20s
     Wait Until Element Is Visible  ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     ${value}        Get Text     ${XPATH_REPORT_DOWNLOAD_COMPLETE}
     Log             ${value}
     Should Contain    ${value}      ${DOWNLOAD_COMPLETE_VALUE_ONECELL5G_DU_DEVICE_CONFIG}
     ${success_value}        Get Text     ${XPATH_REPORT_DOWNLOAD_SUCCESS}
     Log             ${success_value}
     Should Contain    ${success_value}      ${DOWNLOAD_SUCCESS_VALUE}

Copy File To Location
    [Documentation]    Copy the files to the Specified location
    #Copy Files     ${FILE_COPY_FROM_LOCATION}  ${FILE_COPY_TO_LOCATION}
    [Arguments]     ${FILE_To_COPY}
    Copy File     ${FILE_COPY_FROM_LOCATION}${FILE_To_COPY}  ${EXECDIR}\\robot\\report_files


Open Device List
    go to   ${Device_list_URL}

Radio Point Blacklist filter Select
    [Documentation]  Select device type and software version
    #[Arguments]  ${device_type}  ${Filter_Name}
    BuiltIn.Sleep  5s
    Click DMS Element   ${SEARCH_OPTION}
    #BuiltIn.Sleep  5s
    #Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  15s
    Press Keys    ${XPATH_DEVICE_LIST_FILTER_COMBO}  CTRL+a+BACKSPACE
    BuiltIn.Sleep  10s
    Input Text  ${XPATH_DEVICE_LIST_FILTER_COMBO}   ${LIST_VALUE_RADIO}
    BuiltIn.Sleep  10s
    Click DMS Element     ${XAPTH_LIST_ELEMENT}
    BuiltIn.Sleep  5s
    Click DMS Element   ${DEVICE_TYPE_COMBO}
    BuiltIn.Sleep  5s
    Click DMS Element   ${DEVICE_LIST_OPTION}
    BuiltIn.Sleep  5s
    Input DMS Text  ${Device_List_User_Option}   ${BLACK_LIST_MAC_ID}
    BuiltIn.Sleep  5s
    Click DMS Element   ${Device_List_Apply_Filter}
    BuiltIn.Sleep  5s
    Click DMS Element    ${RP_CHECKBOX}
    BuiltIn.Sleep  10s
    Click DMS Element    ${Blacklist_button}
    BuiltIn.Sleep  5s
    Click DMS Element    ${Blacklist_confirm_button}
    BuiltIn.Sleep  5s

Remove RP from blacklist
    [Documentation]  Select device type and software version
    #[Arguments]  ${device_type}  ${Filter_Name}
    BuiltIn.Sleep  15s
    Click DMS Element   ${SEARCH_OPTION}
    BuiltIn.Sleep  15s
    Press Keys    ${XPATH_DEVICE_LIST_FILTER_COMBO}  CTRL+a+BACKSPACE
    BuiltIn.Sleep  15s
    Input Text  ${XPATH_DEVICE_LIST_FILTER_COMBO}   ${LIST_VALUE_RADIO}
    BuiltIn.Sleep  10s
    Click DMS Element     ${XAPTH_LIST_ELEMENT}
    BuiltIn.Sleep  5s
    Click DMS Element   ${DEVICE_TYPE_COMBO}
    BuiltIn.Sleep  5s
    Click DMS Element   ${DEVICE_LIST_OPTION}
    BuiltIn.Sleep  5s
    Input DMS Text  ${Device_List_User_Option}   ${BLACK_LIST_MAC_ID}
    BuiltIn.Sleep  5s
    Click DMS Element   ${Device_List_Apply_Filter}
    BuiltIn.Sleep  5s
    Click DMS Element    ${RP_CHECKBOX}
    BuiltIn.Sleep  10s
    Click DMS Element    ${Remove_Blacklist_button}
    BuiltIn.Sleep  5s
    Click DMS Element    ${Blacklist_confirm_button}
    BuiltIn.Sleep  5s

Open Operation History tab
    BuiltIn.Sleep  10s
    click dms element    ${Operation_history_button}
    BuiltIn.Sleep  5s

Verify Blacklist
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${XPATH_OPERATION_TABLE_INPUT}
    BuiltIn.Sleep  5s
    Input DMS Text    ${XPATH_OPERATION_TABLE_INPUT}    Device Blacklist
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${XPATH_OPERATION_APPLY_FILTER}
    BuiltIn.Sleep  5s
    click dms button    ${XPATH_OPERATION_APPLY_FILTER}
    BuiltIn.Sleep  5s
    ${Operation_type}    Get DMS Element Text    ${Operation_type_text}
    Log     ${Operation_type}
    ${Operation_status}  Get DMS Element Text    ${Operation_type_status}
    Log     ${Operation_status}
    Should Contain    ${Operation_type}        Device Blacklist
    Should Contain    ${Operation_status}      Success

Verify Blacklist Removal
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${XPATH_OPERATION_TABLE_INPUT}
    BuiltIn.Sleep  5s
    Input DMS Text    ${XPATH_OPERATION_TABLE_INPUT}    Remove Device Blacklist
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${XPATH_OPERATION_APPLY_FILTER}
    BuiltIn.Sleep  5s
    click dms button    ${XPATH_OPERATION_APPLY_FILTER}
    BuiltIn.Sleep  5s
    ${Operation_type}    Get DMS Element Text    ${Operation_type_text}
    Log     ${Operation_type}
    ${Operation_status}  Get DMS Element Text    ${Operation_type_status}
    Log     ${Operation_status}
    Should Contain    ${Operation_type}        Remove Device Blacklist
    Should Contain    ${Operation_status}      Success

Edit ONECELL5G VNF Device Config Report
    [Documentation]  Edit device Config Report with current time
    [Arguments]  ${VNF_Device_types}
    BuiltIn.Sleep  5s
    Scroll Element Into View  ${XPATH_EDIT_REPORT_BUTTON}
    BuiltIn.Sleep  5s
    click dms button    ${XPATH_EDIT_REPORT_BUTTON}
    BuiltIn.Sleep  5s

    ${Current Time} =    get Text     ${XPATH_SERVER_TIME}
    #${Current Time}=    set variable    Server Time: 2022-01-06 18:37 UTC
    Log    ${Current Time}
    ${split value}    Split String    ${Current Time}
    Log     ${split value}
    Log     ${split value}[0]
    Log     ${split value}[1]
    Log     ${split value}[2]
    Log     ${split value}[3]
    Log     ${split value}[4]
    ${pre}	${post} =	Split String	${split value}[3]	:	1
    Log     ${pre}
    Log     ${post}
    Log     int(${post})
    ${new value}=    Evaluate   int('${post}') + 3

    Log    ${new value}

    ${new_value_old}=    set variable    ${new_value}
    #${pre_old}=    set variable    ${pre}


    ${pre}=    Evaluate   int('${pre}') + 0
    Log    ${pre}
    ${pre_old}=    set variable    ${pre}
    ${len_pre}=     Evaluate   int(math.log10(${pre})) + 1
    Log  ${len_pre}
    #${pre}=      Run keyword if  int('${len_pre}') <= 1    Catenate    0${pre}

    ${pre}=     Run keyword if  int(${new_value}) >= 60    Evaluate   int('${pre}') + 1
    ...  ELSE   set variable   ${pre_old}
    Log     ${pre}
    ${len_pre}=     Evaluate   int(math.log10(${pre})) + 1
    Log  ${len_pre}

    ${pre}=      Run keyword if  int('${len_pre}') <= 1    Catenate    0${pre}
    ...  ELSE   set variable   ${pre}

    ${new_value}=     Run keyword if  int(${new_value}) >= 60    Evaluate   int('${new_value}') - 60
    ...  ELSE   set variable   ${new_value_old}
    Log     ${new_value}
    ${new_value}=    Run keyword if  ${new_value} == 0    set variable    01
    ...  ELSE   set variable   ${new_value}
    ${new_value}=    Evaluate   int('${new_value}') + 0
    Log    ${new_value}

    ${len}=     Evaluate   int(math.log10(${new_value})) + 1
    Log  ${len}


    #${len_pre}=     Evaluate   int(math.log10(${pre})) + 1
    #Log  ${len_pre}



    ${new date}=     Run keyword if  int(${len}) == 1    Catenate     ${split value}[2]  ${pre}:0${new_value}
    ...  ELSE    Catenate     ${split value}[2]  ${pre}:${new_value}
    Log     ${new date}

    BuiltIn.Sleep  5s
    Clear Element Text     ${XPATH_START_TIME}
    BuiltIn.Sleep  5s
    Input DMS Text      ${XPATH_START_TIME}      ${new date}
    BuiltIn.Sleep  5s
    click dms button    ${XPATH_SAVE_REPORT_BUTTON}
    BuiltIn.Sleep  5s
    ONECELL5G Device Config   ${VNF_Device_types}
    Apply Filter
    BuiltIn.Sleep  5s
    ${value}        Get Text     ${XPATH_REPORT_START_TIME}
    Log             ${value}
    Should Contain    ${value}    ${new date}


OneCell 5G GoldStandard Compliance
      BuiltIn.Sleep  5s
      Input Text    ${XPATH_REPORT_NAME1_FILTERBOX}  ONECELL5G GoldStandard Compliance
      BuiltIn.Sleep  3s


Verify file content Gold Standard
    [Arguments]     ${Path}    ${arg1}    ${arg2}
    #${BC_content}      Read and match file content1    ${Path}    ${arg1}    ${arg2}
    File Should Not Be Empty     ${Path}
    ${value_argument1}=    Grep File     ${Path}    ${arg1}
    ${value_argument2}=    Grep File     ${Path}    ${arg2}
    Log    ${value_argument1}
    Log    ${value_argument2}
    should contain any    ${value_argument1}    Site Location	gNBId	Device Type	DeviceID	Attribute	Deviation: Yes, No, ANC, ANA	GSValue	DMS Value

Verify BC Master Report Content
    [Arguments]     ${Path}    ${arg1}    ${arg2}
    #${BC_content}      Read and match file content1    ${Path}    ${arg1}    ${arg2}
    File Should Not Be Empty     ${Path}
    ${value_argument1}=    Grep File     ${Path}    ${arg1}
    ${value_argument2}=    Grep File     ${Path}    ${arg2}
    should contain any   ${value_argument1}   Serial Number	 Latitude	Longitude	S/W version	H/W version	DeviceClass	CSFB Mode	eNodeB ID	ReferenceCellID	TAC	TACList	RootSequenceIndex	PLMNIDs	PrimaryPLMNID	1x ARFCN	1x BandClass	1x PNOffset	1x CID	DLBandwidth	EARFCNDL	ULBandwidth	EARFCNUL	PhyCellID	RsTxPower	Timing source	PTP server	REMBandList	REMPLMNList	REMCarrierDLChannelList	UARFCNDL List	LocalTimeZone	LTENbrCID	LTENbrEutraCarrierARFCN	LTENbrPLMNID	LTENbrPhyCellID	LTENbrRSTxPower	LTENbrTAC	VoIPEnabled	EmergencyPolicy	MaxTxPower	X2 Status	eNodeB Name	Cell Name	Cell Mode	Cell ID	Cell Identity	Number of Sectors	Sector Instance	CAEnabled
    should contain any    ${value_argument2}    DXE70257	DXE70257_9R_1_B1	eNB

Verify BC Device Status Content
   [Arguments]     ${Path}    ${arg1}    ${arg2}
    #${BC_content}      Read and match file content1    ${Path}    ${arg1}    ${arg2}
    File Should Not Be Empty     ${Path}
    ${value_argument1}=    Grep File     ${Path}    ${arg1}
    ${value_argument2}=    Grep File     ${Path}    ${arg2}
    #Log    ${BC_content}
    should contain any    ${value_argument1}    Serial_Number	Device_State	Last_Contact_Time	Failure_Reason	Product SKU	OperStatus	RfTxStatus	eNodeB Name	Operator Name	Cell Name	Sector Instance
    should contain any    ${value_argument2}    OneCellBC	1	0	DXE70257	testoperator12	DXE70257_9R_1_B1	1

Verify License File Content
    [Arguments]     ${Path}    ${arg1}    ${arg2}
    #${BC_content}      Read and match file content1    ${Path}    ${arg1}    ${arg2}
    File Should Not Be Empty     ${Path}
    ${value_argument1}=    Grep File     ${Path}    ${arg1}
    ${value_argument2}=    Grep File     ${Path}    ${arg2}
    #Log    ${BC_content}
    should contain any    ${value_argument1}    No license(s) present


Verify RP5100 Device Status Content
    [Arguments]     ${Path}    ${arg1}    ${arg2}
    #${BC_content}      Read and match file content1    ${Path}    ${arg1}    ${arg2}
    File Should Not Be Empty     ${Path}
    ${value_argument1}=    Grep File     ${Path}    ${arg1}
    ${value_argument2}=    Grep File     ${Path}    ${arg2}
    #Log    ${BC_content}
    should contain any    ${value_argument1}    Site Location	RP5100 Serial Number	SW Version	Cell Index	Sector Instance	RU IP Address	Device State	Discovery time	Admin State	RfTxStatus	BC Serial Number	BC eNodeB Name	DU VNFID	ControlDataConnectionStatus
    should contain any    ${value_argument2}   Automation_Venue    0005B9423AB2_0005B9519AA1_1	6.0.00.064		1	10.208.75.118	up	2016-10-03T09:51:57	LOCKED	ON	0005B9423AB2	DXE70257		1
	should contain any    ${value_argument2}    0005B97A13_0005B951D651_1	6.0.00.064		1	10.208.75.118	disabled	2016-10-03T09:51:57	LOCKED	0	0005B97A13	DXE70257		1
	should contain any    ${value_argument2}    drop2-3031du1_0005B9514245_1	6.0.00.055	1		10.212.53.111

Verify RP Device Status Content
    [Arguments]     ${Path}    ${arg1}    ${arg2}
    #${BC_content}      Read and match file content1    ${Path}    ${arg1}    ${arg2}
    File Should Not Be Empty     ${Path}
    ${value_argument1}=    Grep File     ${Path}    ${arg1}
    ${value_argument2}=    Grep File     ${Path}    ${arg2}
    #Log    ${BC_content}
    should contain any    ${value_argument1}    RP Serial Number	BC Serial Number	Device State	Discovery time	Admin Status	RFTxState	ControlDataConnectionStatus	Product SKU	BC eNodeB Name	Sector Instance
    should contain any    ${value_argument2}   	LOCKED	 OFF	1		DXE70257	1

Verify BC Delta Device Config Content
    [Arguments]     ${Path}    ${arg1}    ${arg2}
    #${BC_content}      Read and match file content1    ${Path}    ${arg1}    ${arg2}
    File Should Not Be Empty     ${Path}
    ${value_argument1}=    Grep File     ${Path}    ${arg1}
    ${value_argument2}=    Grep File     ${Path}    ${arg2}
    #Log    ${BC_content}
    should contain any    ${value_argument1}    Serial Number	Latitude	Longitude	S/W version	H/W version	DeviceClass	CSFB Mode	eNodeB ID	ReferenceCellID	TAC	TACList	RootSequenceIndex	PLMNIDs	PrimaryPLMNID	1x ARFCN	1x BandClass	1x PNOffset	1x CID	DLBandwidth	EARFCNDL	ULBandwidth	EARFCNUL	PhyCellID	RsTxPower	Timing source	PTP server	REMBandList	REMPLMNList	REMCarrierDLChannelList	UARFCNDL List	LocalTimeZone	LTENbrCID	LTENbrEutraCarrierARFCN	LTENbrPLMNID	LTENbrPhyCellID	LTENbrRSTxPower	LTENbrTAC	VoIPEnabled	EmergencyPolicy	MaxTxPower	X2 Status	eNodeB Name	Cell Name	Cell Mode	Cell ID	Cell Identity	Number of Sectors	Sector Instance	CAEnabled	S1 SigLink Server List	S1 SigLink Status	SecGW Server1	SecGW Server2	SecGW Server3	SecGW2 Server1	SecGW2 Server2	SecGW2 Server3	CA SecGW
    should contain any    ${value_argument2}   	eNB

Verify RP Delta Device Config Content
    [Arguments]     ${Path}    ${arg1}    ${arg2}
    #${BC_content}      Read and match file content1    ${Path}    ${arg1}    ${arg2}
    File Should Not Be Empty     ${Path}
    ${value_argument1}=    Grep File     ${Path}    ${arg1}
    ${value_argument2}=    Grep File     ${Path}    ${arg2}
    #Log    ${BC_content}
    should contain any    ${value_argument1}    RP Serial Number	RP IP address	S/W version	H/W version	Location Name	RfTxPower	RP type	BandsSupported ID	Latitude Sign	Degrees Of Latitude	Degrees Of Longitude	Direction Of Altitude	Altitude	Antenna Type	BC Serial Number	Sector Instance
    should contain any    ${value_argument2}   	0005B9ABB01	10.208.75.102	4.5.00.125		Bellandur::Bellandur	15::21	Spare::Spare		North	1.3934376239776	0.0016712902307	Height	512	Internal	0005B97A15	2

Verify RP Master Device Config Content
    [Arguments]     ${Path}    ${arg1}    ${arg2}
    #${BC_content}      Read and match file content1    ${Path}    ${arg1}    ${arg2}
    File Should Not Be Empty     ${Path}
    ${value_argument1}=    Grep File     ${Path}    ${arg1}
    ${value_argument2}=    Grep File     ${Path}    ${arg2}
    #Log    ${BC_content}
    should contain any    ${value_argument1}    RP Serial Number	RP IP address	S/W version	H/W version	Location Name	RfTxPower	RP type	BandsSupported ID	Latitude Sign	Degrees Of Latitude	Degrees Of Longitude	Direction Of Altitude	Altitude	Antenna Type	BC Serial Number	Sector Instance
    should contain any    ${value_argument2}   	0005B9ABB01	10.208.75.101	4.5.00.125		Bellandur::Bellandur	15::21	Spare::Spare		North	1.3934376239776	0.0016712902307	Depth	512	External	0005B97A15	2

Verify RP5100 Delta Device Config Content
    [Arguments]     ${Path}    ${arg1}    ${arg2}
    #${BC_content}      Read and match file content1    ${Path}    ${arg1}    ${arg2}
    File Should Not Be Empty     ${Path}
    ${value_argument1}=    Grep File     ${Path}    ${arg1}
    ${value_argument2}=    Grep File     ${Path}    ${arg2}
    #Log    ${BC_content}
    should contain any    ${value_argument1}    RP5100 Serial Number	RP5100 IP address	S/W version	H/W version	Location Name	RfTxPower	RP type	BandsSupported	Latitude Sign	Degrees Of Latitude	Degrees Of Longitude	Direction Of Altitude	Altitude	Antenna Type	BC Serial Number	Sector Instance
    should contain any    ${value_argument2}   	North		Height	0	Internal

Verify RP5100 Master Device Config Content
    [Arguments]     ${Path}    ${arg1}    ${arg2}
    #${BC_content}      Read and match file content1    ${Path}    ${arg1}    ${arg2}
    File Should Not Be Empty     ${Path}
    ${value_argument1}=    Grep File     ${Path}    ${arg1}
    ${value_argument2}=    Grep File     ${Path}    ${arg2}
    #Log    ${BC_content}
    should contain any    ${value_argument1}    RP5100 Serial Number	RP5100 IP address	S/W version	H/W version	Location Name	RfTxPower	RP type	BandsSupported	Latitude Sign	Degrees Of Latitude	Degrees Of Longitude	Direction Of Altitude	Altitude	Antenna Type	BC Serial Number	Sector Instance
    should contain any    ${value_argument2}   	North		Height	0	Internal

Copy GoldStandard Compliance File Locally
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    Write       find /xmldb/appdata/dms/reports/goldstandard/ -name "*.txt" | tail -1 | cut -d "/" -f 7
    ${file}     Read Until    .txt
    ${gold_std_file_name}    SSHLibrary.Get File     /xmldb/appdata/dms/reports/goldstandard/${file}
    Move File     ${EXECDIR}/${file}      ${EXECDIR}\\robot\\report_files

Copy 4g GoldStandard Compliance File Locally
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    Write       ls -ltr /xmldb/appdata/dms/reports/goldstandard/0005B94238A0-GoldStandardComplianceReport*.csv | tail -1 | cut -d "/" -f 7
    ${file}     Read Until    .csv
    ${gold_std_file_name}    SSHLibrary.Get File     /xmldb/appdata/dms/reports/goldstandard/${file}
    Move File     ${EXECDIR}/${file}      ${EXECDIR}\\robot\\report_files
    [Return]   ${file}

Verify 4g Gold GoldStandard Compliance Report content
    [Arguments]     ${Path}    ${arg1}    ${arg2}
    #${BC_content}      Read and match file content1    ${Path}    ${arg1}    ${arg2}
    File Should Not Be Empty     ${Path}
    ${value_argument1}=    Grep File     ${Path}    ${arg1}
    ${value_argument2}=    Grep File     ${Path}    ${arg2}
    Log    ${value_argument2}
    should contain any    ${value_argument1}    Gold Standard Attribute	Deviation From GSV	Gold Standard Value	Device Configured Value
    should contain any    ${value_argument2}   	Device.IPsec.Enable	No	"true"	"true"

Copy 5g GoldStandard Compliance File Locally
    Open Connection     ${HOST}
    Login               ${USERNAME}        ${PASSWORD}
    Write       ls -ltr /xmldb/appdata/dms/reports/goldstandard/Automation_Venue*.txt | tail -1 | cut -d "/" -f 7
    ${file}     Read Until    .txt
    ${gold_std_file_name}    SSHLibrary.Get File     /xmldb/appdata/dms/reports/goldstandard/${file}
    Move File     ${EXECDIR}/${file}      ${EXECDIR}\\robot\\report_files
    [Return]   ${file}

Verify 5g Gold GoldStandard Compliance Report content
    [Arguments]     ${Path}    ${arg1}    ${arg2}
    #${BC_content}      Read and match file content1    ${Path}    ${arg1}    ${arg2}
    File Should Not Be Empty     ${Path}
    ${value_argument1}=    Grep File     ${Path}    ${arg1}
    ${value_argument2}=    Grep File     ${Path}    ${arg2}
    Log    ${value_argument2}
    should contain any    ${value_argument1}    Site Location	gNBId	Device Type	DeviceID	Attribute	Deviation: Yes, No, ANC, ANA	GSValue	DMS Value
    should contain any    ${value_argument2}   	Automation_Venue        2051    CUCP    ipsec2-2051cucp1        _3gpp-common-managed-element:ManagedElement[1]/_3gpp-nr-nrm-gnbcucpfunction:GNBCUCPFunction[1]/attributes/gNBId Yes     "1016"  "2051"
