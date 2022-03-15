*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Variables           device_list_ui_controls.py
Variables           ../testdata/device_list_testdata.py
Resource            ../../Search_Page/page/search_device_helper.robot
Variables           ../../Search_Page/page/search_device_ui_controls.py

*** Variables ***


*** Keywords ***
Open Device list
    [Documentation]  Device list page
     BuiltIn.Sleep  10s
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  12s

Show Search Options
    [Documentation]  Device list Show Search Option Button
    BuiltIn.Sleep  12s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  12s

Select Device Type Enter Filter name
    [Documentation]  Device Type and Filter name
    Input Text  ${XPATH_SELECT_DEVICE_TYPE}  All Device Types
    BuiltIn.Sleep  3s
    Input Text  ${XPATH_FILTER_NAME}  ${Filter_All}
    BuiltIn.Sleep  12s

Select MAC ID Enter Expression Value
    [Documentation]  MAC ID and Value
    Input Text  ${XPATH_DEVICE_FILTER_LIST_INPUT}  MAC ID/SERIAL NUMBER
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_EXPRESSION_VALUE}  ${Macid_1}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CREATE_FILTER_BUTTON}
    BuiltIn.Sleep  6s


Filter search and apply
    [Documentation]  search device list filter and apply
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${Filter_ToApply}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_APPLY_FILTER_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_APPLY_FILTER_OPTION}
    BuiltIn.Sleep  6s

Filter create contains macid
    [Documentation]  device list filter create contains macid
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  12s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  12s
    Input Text  ${XPATH_SELECT_DEVICE_TYPE}  All Device Types
    BuiltIn.Sleep  8s
    Input Text  ${XPATH_FILTER_NAME_ADD}  ${Filter_Contains}
    BuiltIn.Sleep  14s
    Input Text  ${XPATH_DEVICE_FILTER_LIST_INPUT}  MAC ID/SERIAL NUMBER
    BuiltIn.Sleep  14s
    Click DMS Element  ${XPATH_EQUALS_DROPDOWN}
    BuiltIn.Sleep  14s
    Click DMS Element  ${XPATH_CONTAINS}
    BuiltIn.Sleep  13s
    Input Text  ${XPATH_EXPRESSION_VALUE}  ${DEVICE_EXPRESSION}
    BuiltIn.Sleep  14s
    Click DMS Element  ${XPATH_CREATE_APPLY}
    BuiltIn.Sleep  16s

Filter Factory Serial number Onecell
    [Documentation]  filter creation factory serial number
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DEVICE_TYPE_SELECT}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_ONECELL}
    BuiltIn.Sleep  6s
    Input Text  ${XPATH_FILTER_NAME_ADD}  ${Filter_FactorySerial}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_FILTER_INPUT}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_NEXT_BUTTON}
    Click DMS Element  ${XPATH_NEXT_BUTTON1}
    Click DMS Element  ${XPATH_NEXT_BUTTON2}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_FACTORY_SERIAL}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_EQUALS_DROPDOWN}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_EQUALS}
    BuiltIn.Sleep  3s
    Input Text  ${XPATH_EXPRESSION_VALUE}  ${FactorySerial_Expression}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_CREATE_APPLY}
    BuiltIn.Sleep  8s

Filter Creation friendly name
    [Documentation]  filter create with friendly name
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DEVICE_TYPE_SELECT}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_ONECELL}
    BuiltIn.Sleep  6s
    Input Text  ${XPATH_FILTER_NAME_ADD}  ${Filter_FriendlyName}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_FILTER_INPUT}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_NEXT_BUTTON}
    Click DMS Element  ${XPATH_NEXT_BUTTON1}
    Click DMS Element  ${XPATH_NEXT_BUTTON2}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_FRIENDLY}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_EQUALS_DROPDOWN}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_EQUALS}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_EXPRESSION_VALUE}  ${FriendlyName_expression}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CREATE_APPLY}
    BuiltIn.Sleep  6s

filter creation with ngrp macid
    [Documentation]  filter create with friendly name
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_TYPE_SELECT}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_NGRP}
    BuiltIn.Sleep  6s
    Input Text  ${XPATH_FILTER_NAME_ADD}  ${Filter_ngrp}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_FILTER_INPUT}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_MACID}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_EQUALS_DROPDOWN}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_EQUALS}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_EXPRESSION_VALUE}  ${ngrp_Macid}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CREATE_APPLY}
    BuiltIn.Sleep  6s

filter creation with software version
    [Documentation]  filter create with software version
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DEVICE_TYPE_SELECT}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_ONECELL}
    BuiltIn.Sleep  6s
    Input Text  ${XPATH_FILTER_NAME_ADD}  ${Filter_Softwareversion}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_FILTER_INPUT}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_NEXT_ARROW}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_SOFTWARE_VERSION}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_EQUALS_DROPDOWN}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_GREATER_THAN_EQUAL}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_EXPRESSION_VALUE}  ${SofwtareVersion_expression}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CREATE_APPLY}
    BuiltIn.Sleep  6s

filter creation with enodeB name
    [Documentation]  filter create with enodeB name
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DEVICE_TYPE_SELECT}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_ONECELL}
    BuiltIn.Sleep  6s
    Input Text  ${XPATH_FILTER_NAME_ADD}  ${Filter_enodeB}
    #BuiltIn.Sleep  2s
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_FILTER_INPUT}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_NEXT_BUTTON}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_ENODEB_NAME}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_EQUALS_DROPDOWN}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_EQUALS}
    Input Text  ${XPATH_EXPRESSION_VALUE}  ${EnodeB_expression}
    Click DMS Element  ${XPATH_CREATE_APPLY}
    BuiltIn.Sleep  6s

filter creation with ngrp macid with venue name
    [Documentation]  filter create with friendly name
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DEVICE_TYPE_SELECT}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_NGRP}
    BuiltIn.Sleep  7s
    Input Text  ${XPATH_FILTER_NAME_ADD}  ${Filter_VenueName1}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_FILTER_INPUT}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_VENUE_NAME}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_EQUALS_DROPDOWN}
    BuiltIn.Sleep  1s
    Click DMS Element  ${XPATH_EQUALS}
    Input Text  ${XPATH_VENUE_EXPRESSION_VALUE}  ${Venue_Name}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_CREATE_FILTER_BUTTON}
    BuiltIn.Sleep  10s
    #Input Text  ${XPATH_ENTER_FILTER_NAME}  ${Filter_VenueName}
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}    ${Filter_VenueName1}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_FILTER_APPLY1}
    BuiltIn.Sleep  6s


filter creation with cgrp macid
    [Documentation]  filter create with cgrp macid
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  15s
    Press Keys    ${XPATH_DEVICE_LIST_FILTER_COMBO}  CTRL+a+BACKSPACE
    #Clear Element Text  ${XPATH_DEVICE_LIST_FILTER_COMBO}
    BuiltIn.Sleep  10s
    Input Text  ${XPATH_DEVICE_LIST_FILTER_COMBO}   ${LIST_VALUE_RADIO}
    BuiltIn.Sleep  10s
    Click DMS Element     ${XAPTH_LIST_ELEMENT}
    #Click DMS Element  ${XPATH_DEVICE_TYPE_SELECT}
    #BuiltIn.Sleep  3s
    #Click DMS Element  ${XPATH_DEVICE_CGRP}
    BuiltIn.Sleep  10s
    Input Text  ${XPATH_FILTER_NAME_ADD}  ${Filter_cgrp}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_FILTER_INPUT}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_MACID}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_EQUALS_DROPDOWN}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_EQUALS}
    Input Text  ${XPATH_EXPRESSION_VALUE}  ${cgrp_macid}
    Click DMS Element  ${XPATH_CREATE_APPLY}
    BuiltIn.Sleep  6s

filter creation with cgrp BC macid
    [Documentation]  filter create with cgrp BC macid
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  10s
    Press Keys    ${XPATH_DEVICE_LIST_FILTER_COMBO}  CTRL+a+BACKSPACE
    BuiltIn.Sleep  10s
    Input Text  ${XPATH_DEVICE_LIST_FILTER_COMBO}   ${LIST_VALUE_RADIO}
    BuiltIn.Sleep  10s
    Click DMS Element     ${XAPTH_LIST_ELEMENT}
    #Click DMS Element  ${XPATH_DEVICE_TYPE_SELECT}
    #BuiltIn.Sleep  3s
    #Click DMS Element  ${XPATH_DEVICE_CGRP}
    BuiltIn.Sleep  10s
    Input Text  ${XPATH_FILTER_NAME_ADD}  ${Filter_cgrp_BC}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_FILTER_INPUT}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_BC_MACID}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_EQUALS_DROPDOWN}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_EQUALS}
    Input Text  ${XPATH_EXPRESSION_VALUE}  ${cgrp_bc_macid}
    Click DMS Element  ${XPATH_CREATE_APPLY}
    BuiltIn.Sleep  6s

filter creation with NGRadio RFModule
    [Documentation]  filter create with cgrp BC macid
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  7s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  7s
    Click DMS Element  ${XPATH_DEVICE_TYPE_SELECT}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_NGRF}
    BuiltIn.Sleep  6s
    Input Text  ${XPATH_FILTER_NAME_ADD}  ${Filter_ngrp_RFmodule}
    #BuiltIn.Sleep  2s
    #Click DMS Element  ${XPATH_FILTER_INPUT}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_NGRADIO_DROPDOWN}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_RFMODULE_ID}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_EQUALS_DROPDOWN}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_CONTAINS}
    BuiltIn.Sleep  3s
    Input Text  ${XPATH_EXPRESSION_VALUE}  ${RFmodule_expression}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CREATE_APPLY}
    BuiltIn.Sleep  6s

Modify Created filter and Apply
    [Documentation]  Modify Created filter and Apply
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${Filter_to_modify}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_EDIT_FILTER_BUTTON}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_DROPDOWN}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_CONTAINS}
    BuiltIn.Sleep  3s
    Input Text  ${XPATH_EXPRESSION_EDIT}  ${edit_expression}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_PLUS_SIGN}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_MACID_SELECT}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_DROPDOWN1}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_SOFTWARE_VERSION}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_GREATER}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_GREATER1}
    BuiltIn.Sleep  3s
    Input Text  ${XPATH_VALUE}  ${SofwtareVersion_expression}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_SAVE_BUTTON}
    BuiltIn.Sleep  8s
    Wait Until Element Is Visible  ${XPATH_EDIT_FILTER_SUCCESS_MSG}
    ${value}        Get Text     ${XPATH_GET_SUCCESS_TEXT}
    Log             ${value}
    Should Contain    ${value}    Success
    BuiltIn.Sleep  3s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${Filter_to_modify}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_FILTER_APPLY1}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${Filter_to_modify}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_EDIT_AFTER_APPLY}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_MINUS_SIGN}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_DROPDOWN}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_EQUALS}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_EXPRESSION_VALUE1}  ${edit_back_expression}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_SAVE_BUTTON}
    BuiltIn.Sleep  6s

search Filter name and delete
    [Documentation]  Manage filter page and delete existing filter
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  4s
    @{ret_val} =  create list    ${Filter_All}   ${Filter_Contains}    ${Filter_FactorySerial}    ${Filter_FriendlyName}    ${Filter_ngrp}   ${Filter_cgrp}    ${Filter_cgrp_BC}    ${Filter_Softwareversion}    ${Filter_enodeB}    ${Filter_VenueName1}    ${Filter_ngrp_RFmodule}
    #@{ret_val} =  create list    ${Filter_All}   ${Filter_Contains}    ${Filter_FactorySerial}    ${Filter_FriendlyName}    ${Filter_ngrp}     ${Filter_Softwareversion}    ${Filter_enodeB}      ${Filter_VenueName1}    ${Filter_ngrp_RFmodule}    ${Filter_cgrp}    ${Filter_cgrp_BC}
    FOR  ${item}  IN  @{ret_val}
       log to console  Item: ${item}
        BuiltIn.Sleep  5s
        Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${item}
        BuiltIn.Sleep  4s
        Click DMS Element  ${XPATH_APPLY_FILTER}
        BuiltIn.Sleep  7s
        Click DMS Element  ${XPATH_DELETE_BUTTON}
        BuiltIn.Sleep  5s
        Click DMS Element  ${XPATH_CONFIRM_DELETE}
        BuiltIn.Sleep  7s
    END


CP Filter creation and verification
    [arguments]    ${Venue_Name}    ${Building_Name}    ${Floor_Name}    ${Software_Version}    ${Cell_Localid}
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  9s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_DEVICE_TYPE_SELECT}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_DEVICE_CP}
    BuiltIn.Sleep  8s
    Input Text  ${XPATH_FILTER_NAME}  ${CP_filter}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_MINUS}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_CREATE_APPLY}
    BuiltIn.Sleep  6s
    Wait Until Element Is Visible  ${XPATH_SUCCESS_MSG}
    ${value}        Get Text     ${XPATH_FILTER_CREATED_MSG}
    Log             ${value}
    Should Contain    ${value}    Filter created successfully
    BuiltIn.sleep    4s
    Input Text  ${XPATH_FILTER_CRITERIA1}  ${gnbid_expression}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_FILTER_LIST}
    BuiltIn.Sleep  3s
    ${value}        Get Text     ${XPATH_TABLE_ROW}
    Log             ${value}
    Should Contain    ${value}    ${Venue_Name}
    Should Contain    ${value}    ${Building_Name}
    Should Contain    ${value}    ${Floor_Name}
    Should Contain    ${value}    ${Software_Version}
    Should Contain    ${value}    ${Cell_Localid}
    BuiltIn.sleep    4s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_ENTER_FILTER_NAME}  ${CP_filter}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DELETE_BUTTON}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_CONFIRM_DELETE}
    BuiltIn.Sleep  8s




UP Filter creation and verification
    [arguments]    ${Venue_Name}    ${Building_Name}    ${Floor_Name}    ${Software_Version}
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  9s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_DEVICE_TYPE_SELECT}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_DEVICE_UP}
    BuiltIn.Sleep  8s
    Input Text  ${XPATH_FILTER_NAME}  ${UP_filter}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_MINUS}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_CREATE_APPLY}
    BuiltIn.Sleep  6s
    Wait Until Element Is Visible  ${XPATH_SUCCESS_MSG}
    ${value}        Get Text     ${XPATH_FILTER_CREATED_MSG}
    Log             ${value}
    Should Contain    ${value}    Filter created successfully
    BuiltIn.sleep    6s
    Input Text  ${XPATH_FILTER_CRITERIA1}  ${gnbid_expression}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_APPLY_FILTER_LIST}
    BuiltIn.Sleep  6s
    ${value}        Get Text     ${XPATH_TABLE_ROW}
    Log             ${value}
    Should Contain    ${value}    ${Venue_Name}
    Should Contain    ${value}    ${Building_Name}
    Should Contain    ${value}    ${Floor_Name}
    Should Contain    ${value}    ${Software_Version}
    #Should Contain    ${value}    ${Cell_Localid}
    BuiltIn.sleep    4s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  6s
    Input Text  ${XPATH_ENTER_FILTER_NAME}  ${UP_filter}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DELETE_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_CONFIRM_DELETE}
    BuiltIn.Sleep  8s


DU Filter creation and verification
    [arguments]    ${Venue_Name}    ${Building_Name}    ${Floor_Name}    ${Software_Version}
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  9s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DEVICE_TYPE_SELECT}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_DEVICE_DU}
    BuiltIn.Sleep  8s
    Input Text  ${XPATH_FILTER_NAME}  ${DU_filter}
    BuiltIn.Sleep  46
    Click DMS Element  ${XPATH_MINUS}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_CREATE_APPLY}
    BuiltIn.Sleep  5s
    Wait Until Element Is Visible  ${XPATH_SUCCESS_MSG}
    ${value}        Get Text     ${XPATH_FILTER_CREATED_MSG}
    Log             ${value}
    Should Contain    ${value}    Filter created successfully
    BuiltIn.sleep    4s
    Input Text  ${XPATH_FILTER_CRITERIA1}  ${gnbid_expression}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_FILTER_LIST}
    BuiltIn.Sleep  5s
    ${value}        Get Text     ${XPATH_TABLE_ROW}
    Log             ${value}
    Should Contain    ${value}    ${Venue_Name}
    Should Contain    ${value}    ${Building_Name}
    Should Contain    ${value}    ${Floor_Name}
    Should Contain    ${value}    ${Software_Version}
    #Should Contain    ${value}    ${Cell_Localid}
    BuiltIn.sleep    4s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_ENTER_FILTER_NAME}  ${DU_filter}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  8s
    Click DMS Element  ${XPATH_DELETE_BUTTON}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_CONFIRM_DELETE}
    BuiltIn.Sleep  8s


Modify CP Created filter and Apply
    [Documentation]  Modify CP Created filter and Apply
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${CP_Filter_edit}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_EDIT_FILTER_BUTTON}
    BuiltIn.Sleep  10s
    Input Text  ${XPATH_EXPRESSION_EDIT}  ${edit_cpexpression}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_PLUS_SIGN}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_NEXT_OPTION}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_NEXT1_OPTION}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_CELLLOCALID}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_DROPDOWN2}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_CONTAINS}
    BuiltIn.Sleep  3s
    Input Text  ${XPATH_ENTER_EXPRESSION2}  ${edit_cpexpression1}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_SAVE_BUTTON}
    BuiltIn.Sleep  8s
    Wait Until Element Is Visible  ${XPATH_EDIT_FILTER_SUCCESS_MSG}
    ${value}        Get Text     ${XPATH_GET_SUCCESS_TEXT}
    Log             ${value}
    Should Contain    ${value}    Success
    BuiltIn.Sleep  3s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${CP_Filter_edit}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_FILTER_APPLY_BUTTON}
    BuiltIn.Sleep  8s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  8s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${CP_Filter_edit}
    BuiltIn.Sleep  4s
    #BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_EDIT_FILTER_BUTTON}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_MINUS2}
    BuiltIn.Sleep  6s
    Input Text  ${XPATH_EXPRESSION_EDIT}  ${editback_cpexpression1}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_SAVE_BUTTON}
    BuiltIn.Sleep  8s
    Wait Until Element Is Visible  ${XPATH_EDIT_FILTER_SUCCESS_MSG}
    ${value}        Get Text     ${XPATH_GET_SUCCESS_TEXT}
    Log             ${value}
    Should Contain    ${value}    Success
    BuiltIn.Sleep  3s



Modify UP Created filter and Apply
    [Documentation]  Modify UP Created filter and Apply
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${UP_Filter_edit}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_EDIT_FILTER_BUTTON}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_PLUS_SIGN}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_NEXT_OPTION}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_REPLAN_STATUS}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_DROPDOWN2}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_NOT_EQUALS}
    BuiltIn.Sleep  3s
    Input Text  ${XPATH_ENTER_EXPRESSION2}  ${edit_upexpression1}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_SAVE_BUTTON}
    BuiltIn.Sleep  8s
    Wait Until Element Is Visible  ${XPATH_EDIT_FILTER_SUCCESS_MSG}
    ${value}        Get Text     ${XPATH_GET_SUCCESS_TEXT}
    Log             ${value}
    Should Contain    ${value}    Success
    BuiltIn.Sleep  3s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${UP_Filter_edit}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_FILTER_APPLY_BUTTON}
    BuiltIn.Sleep  8s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  8s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${UP_Filter_edit}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_EDIT_FILTER_BUTTON}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_MINUS_UP}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_SAVE_BUTTON}
    BuiltIn.Sleep  8s
    Wait Until Element Is Visible  ${XPATH_EDIT_FILTER_SUCCESS_MSG}
    ${value}        Get Text     ${XPATH_GET_SUCCESS_TEXT}
    Log             ${value}
    Should Contain    ${value}    Success
    BuiltIn.Sleep  3s




Modify DU Created filter and Apply
    [Documentation]  Modify DU Created filter and Apply
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${DU_Filter_edit}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_EDIT_FILTER_BUTTON}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_PLUS_SIGN}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_NEXT_OPTION}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_NEXT1_OPTION}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_SOFTWARE_VERSIONDU}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_DROPDOWN2}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_GREATER_THANEQUAL}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_ENTER_EXPRESSION2}  ${edit_duexpression1}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_SAVE_BUTTON}
    BuiltIn.Sleep  8s
    Wait Until Element Is Visible  ${XPATH_EDIT_FILTER_SUCCESS_MSG}
    ${value}        Get Text     ${XPATH_GET_SUCCESS_TEXT}
    Log             ${value}
    Should Contain    ${value}    Success
    BuiltIn.Sleep  3s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${DU_Filter_edit}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_FILTER_APPLY_BUTTON}
    BuiltIn.Sleep  8s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  8s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${DU_Filter_edit}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_EDIT_FILTER_BUTTON}
    BuiltIn.Sleep  10s
    Click DMS Element  ${XPATH_MINUS_UP}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_SAVE_BUTTON}
    BuiltIn.Sleep  8s
    Wait Until Element Is Visible  ${XPATH_EDIT_FILTER_SUCCESS_MSG}
    ${value}        Get Text     ${XPATH_GET_SUCCESS_TEXT}
    Log             ${value}
    Should Contain    ${value}    Success
    BuiltIn.Sleep  3s


Unmanage CP device from device list
    [Documentation]  Manage CP device from device list
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${CP_Add}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_FILTER_APPLY1}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_MODE_DROPDOWN}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_MANAGED}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_VNFID_SEARCH}  ${manage_cp}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_CONDITION}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CHECKBOX1}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_USER_UNAMANAGE}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CONFIRM_UNMANAGE}
    BuiltIn.Sleep  5s

Manage CP device from device list
    [Documentation]  Manage CP device from device list
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${CP_Add}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_FILTER_APPLY1}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_MODE_DROPDOWN}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_MODEUSER_UNMANAGED}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_VNFID_SEARCH}  ${manage_cp}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_CONDITION}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CHECKBOX1}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_MANAGE_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CONFIRM_MANAGE}
    BuiltIn.Sleep  5s


Unmanage UP device from device list
    [Documentation]  Manage UP device from device list
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${UP_Add}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_FILTER_APPLY1}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_MODE_DROPDOWN}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_MANAGED}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_VNFID_SEARCH}  ${manage_up}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_CONDITION}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CHECKBOX1}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_USER_UNAMANAGE}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CONFIRM_UNMANAGE}
    BuiltIn.Sleep  5s



Manage UP device from device list
    [Documentation]  Manage UP device from device list
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${UP_Add}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_FILTER_APPLY1}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_MODE_DROPDOWN}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_MODEUSER_UNMANAGED}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_VNFID_SEARCH}  ${manage_up}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_CONDITION}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CHECKBOX1}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_MANAGE_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CONFIRM_MANAGE}
    BuiltIn.Sleep  5s


Unmanage DU device from device list
    [Documentation]  Manage UP device from device list
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${DU_Add}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_FILTER_APPLY1}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_MODE_DROPDOWN}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_MANAGED}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_VNFID_SEARCH}  ${manage_du}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_CONDITION}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CHECKBOX1}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_USER_UNAMANAGE}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CONFIRM_UNMANAGE}
    BuiltIn.Sleep  5s


Manage DU device from device list
    [Documentation]  Manage DU device from device list
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${DU_Add}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_FILTER_APPLY1}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_MODE_DROPDOWN}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_MODEUSER_UNMANAGED}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_VNFID_SEARCH}  ${manage_du}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_CONDITION}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CHECKBOX1}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_MANAGE_BUTTON}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CONFIRM_MANAGE}
    BuiltIn.Sleep  5s



Add CP device from device list
    [Documentation]  Add CP device from device list
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${CP_Add}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_FILTER_APPLY1}
    BuiltIn.Sleep  7s
    Click DMS Element  ${XPATH_ADD_DEVICE_BUTTON}
    BuiltIn.Sleep  6s
    Input Text  ${XPATH_VNFID_ENTER}  ${CP_vnfid}
    BuiltIn.Sleep  3s
    Input Text  ${XPATH_ENTER_IPADDRESS}  ${CP_IP}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_CP_PORT}  ${CP_Port}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_CP_SOFTWARE_VERSION}  ${CP_SOFTWARE}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_USER}  ${CP_USER}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_PASSWORD}  ${CP_PASSWORD}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_CLICK}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_ADD_SAVE}
    BuiltIn.Sleep  4s
    Wait Until Element Is Visible  ${XPATH_SUCCESS}
    ${value}        Get Text     ${XPATH_SUCCESS}
    Log             ${value}
    Should Contain    ${value}    added successfully in to DMS.
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_VNFID_SEARCH}  ${CP_vnfid}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CHECKBOX1}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_DELETE_DEVICE}
    BuiltIn.Sleep  8s
    Click DMS Element  ${XPATH_CONFIRM_DELETE1}
    BuiltIn.Sleep  8s


Add UP device from device list
    [Documentation]  Add UP device from device list
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${UP_Add}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_FILTER_APPLY1}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ADD_DEVICE_BUTTON}
    BuiltIn.Sleep  6s
    Input Text  ${XPATH_VNFID_ENTER}  ${UP_vnfid}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_ENTER_IPADDRESS}  ${CP_IP}
    BuiltIn.Sleep  3s
    Input Text  ${XPATH_CP_PORT}  ${CP_Port}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_CP_SOFTWARE_VERSION}  ${CP_SOFTWARE}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_USER}  ${CP_USER}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_PASSWORD}  ${CP_PASSWORD}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_CLICK}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_ADD_SAVE}
    BuiltIn.Sleep  2s
    Wait Until Element Is Visible  ${XPATH_SUCCESS}
    ${value}        Get Text     ${XPATH_SUCCESS}
    Log             ${value}
    Should Contain    ${value}    added successfully in to DMS.
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_VNFID_SEARCH}  ${UP_vnfid}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_APPLY}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_CHECKBOX1}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_DELETE_DEVICE}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_CONFIRM_DELETE1}
    BuiltIn.Sleep  8s


Add DU device from device list
    [Documentation]  Add DU device from device list
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${DU_Add}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_FILTER_APPLY1}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ADD_DEVICE_BUTTON}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_VNFID_ENTER}  ${DU_vnfid_auto}
    BuiltIn.Sleep  3s
    Input Text  ${XPATH_ENTER_IPADDRESS}  ${CP_IP}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_CP_PORT}  ${CP_Port}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_CP_SOFTWARE_VERSION}  ${CP_SOFTWARE}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_USER}  ${CP_USER}
    BuiltIn.Sleep  2s
    Input Text  ${XPATH_PASSWORD}  ${CP_PASSWORD}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_CLICK}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_ADD_SAVE}
    BuiltIn.Sleep  4s
    Wait Until Element Is Visible  ${XPATH_SUCCESS}
    ${value}        Get Text     ${XPATH_SUCCESS}
    Log             ${value}
    Should Contain    ${value}    added successfully in to DMS.
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_VNFID_SEARCH}  ${DU_vnfid_auto}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY}
    BuiltIn.Sleep  2s
    Click DMS Element  ${XPATH_CHECKBOX1}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_DELETE_DEVICE}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_CONFIRM_DELETE1}
    BuiltIn.Sleep  8s

Add BC device from device list
    [Documentation]  Add BC device from device list
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  8s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${BC_Add}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_FILTER_APPLY1}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_ADD_DEVICE_BUTTON}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_VNFID_ENTER}  ${BC_MACID}
    BuiltIn.Sleep  3s
    Input Text  ${XPATH_CP_SOFTWARE_VERSION}  ${CP_SOFTWARE}
    BuiltIn.Sleep  3s
    Input Text  ${XPATH_SERIAL_NUMBER_ENTER}    ${BC_SERIAL_NUMBER}
    BuiltIn.Sleep  3s
    Input Text  ${XPATH_BC_PASSWORD_ENTER}  ${CP_PASSWORD}
    BuiltIn.Sleep  3s
    #Input Text  ${XPATH_PRODUCT_SKU}  ${BC_PRODUCT_SKU}
    Click DMS Element  ${XPATH_CLICK_ENABLE}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_ADD_SAVE}
    BuiltIn.Sleep  2s
    BuiltIn.Sleep  2s
    Wait Until Element Is Visible  ${XPATH_ADD_BC_MSG}
    ${value}        Get Text     ${XPATH_ADD_BC_MSG}
    Log             ${value}
    Should Contain    ${value}    added successfully in to DMS.
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_BC_SEARCH}  ${BC_MACID}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_CHECKBOX1}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_DELETE_DEVICE}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_CONFIRM_DELETE1}
    BuiltIn.Sleep  5s



gNB navigation from CP device list
    [Documentation]  gNB navigation from CP device list
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${CP_Add}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_FILTER_APPLY1}
    BuiltIn.Sleep  8s
    Input Text  ${XPATH_INPUT_GNBID}  ${gNBID}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_CLICK_GNBID}
    BuiltIn.Sleep  8s
    Wait Until Page Contains Element  ${ID_gNB_DASHBOARD_STRING}

gNB navigation from UP device list
    [Documentation]  gNB navigation from UP device list
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${UP_Add}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_FILTER_APPLY1}
    BuiltIn.Sleep  6s
    Input Text  ${XPATH_INPUT_GNBID}  ${gNBID}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_CLICK_GNBID}
    BuiltIn.Sleep  8s
    Wait Until Page Contains Element  ${ID_gNB_DASHBOARD_STRING}

gNB navigation from DU device list
    [Documentation]  gNB navigation from DU device list
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  4s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${DU_Add}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY_FILTER}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_FILTER_APPLY1}
    BuiltIn.Sleep  6s
    Input Text  ${XPATH_INPUT_GNBID}  ${gNBID}
    BuiltIn.Sleep  4s
    Click DMS Element  ${XPATH_APPLY}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_CLICK_GNBID}
    BuiltIn.Sleep  8s
    Wait Until Page Contains Element  ${ID_gNB_DASHBOARD_STRING}


Delete Existing BC Device from DMS Device List Page
    [Documentation]  Delete BC device from device list
    go to   ${DMS_NETWORK_DEVICE_LIST_PAGE_URL}
    BuiltIn.Sleep  6s
    Click DMS Element  ${XPATH_DEVICE_LIST_SHOW_SEARCH_OPTIONS}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_MANAGE_FILTER_BUTTON}
    BuiltIn.Sleep  5s
    Input Text  ${XPATH_FILTER_NAME_CRITERIA}  ${BC_DELETE}
    BuiltIn.Sleep  5s
    Log    ${XPATH_DEVICELIST_APPLY_FILTER}
    Click DMS Element  ${XPATH_DEVICELIST_APPLY_FILTER}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_FILTER_APPLY1}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_CHECKBOX1}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_DELETE_DEVICE}
    BuiltIn.Sleep  3s
    Click DMS Element  ${XPATH_CONFIRM_DELETE1}
    BuiltIn.Sleep  5s



















