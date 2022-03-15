*** Settings ***
Library             pyautogui
Resource            ../common/ui_common.robot
Resource            page/pnp_page_helper.robot
Resource            ../dashboard/page/dashboard_page_helper.robot



*** Variables ***



*** Keywords ***
Verify PnP Status page Navigation
    Device PnP Status Summary

Start PNP Action
    [Documentation]  Start PNP Action
    Log  PNP Action Completed
    Click DMS Element   ${ID_MENU_ACTION}
    Click DMS Element   ${ID_PROFASSO_DC_CONFIG}
    Click DMS Element   ${ID_PROFASSO_PROF_ASSO}
    Click DMS Element   ${XPATH_PROFASSO_PROFILE_ASSOCIATION}
    Click DMS Element   ${XPATH_PROFASSO_ADD_NEW_PROFILE}
    Click DMS Element   ${XPATH_PROFASSO_LOAD_SERVICE_SETTING_BUTTON}
    Click DMS Element   ${XPATH_PROFASSO_CHOOSE_FILE}
    BuiltIn.Sleep  2s
    pyautogui.Typewrite  C:\\LTE\\DMS_Automation\\robot\\assets\\service_setting_files\\ServiceSetting_onecell_0005B9519E0A_4.5.xml
    BuiltIn.Sleep  2s
    pyautogui.Key Down  enter
    BuiltIn.Sleep  2s
    Click DMS Element  ${ID_PROFASSO_FILE_UPLOAD_OK_BUTTON}
    Wait Until Element Is Not Visible  ${ID_PROFASSO_FILE_UPLOAD_OK_BUTTON}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${ID_PROFASSO_CONFIG_SAVE_BUTTON}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Click DMS Element  ${ID_PROFASSO_CONFIG_SAVE_BUTTON}
    #Set Focus To Element  ${ID_PROFASSO_CONFIG_SAVE_BUTTON}
    #Click Element  ${ID_PROFASSO_CONFIG_SAVE_BUTTON}


Verify PNP Status
    [Documentation]   Verifying PNP Workflow
    Log  Inside Verify PNP Status
    Open Device PNP Page
    PNP WorkFlow Success Status
    Dashboard Device InService Status

Verify PNP Workflow Status
    [Documentation]  verify pnp workflow status
    Open Device PNP Page
    Wait For Workflow To Finish
    PNP WorkFlow Success Status

Verify gNB PNP Workflow Status
    [Documentation]  verify pnp workflow status
    Open gNB Device PNP Page
    Wait For Workflow To Finish
    PNP WorkFlow Success Status


Get PNP Workflow Finished Data And Time For
    [Documentation]  Get Workflow Status finished data and time
    [Arguments]  ${type_of_operation}=None
    Open Device PNP Page
    ${string_val} =   Get Text  ${XPATH_PNP_WORKFLOW_STATUS_STRING}
    run keyword If  '${type_of_operation}' != 'None'   Should Contain   ${string_val}  ${type_of_operation}
    ${data_time} =   Get Finshed If Present  ${string_val}
    [Return]   ${data_time}

Get gNB PNP Workflow Finished Data And Time For
    [Documentation]  Get Workflow Status finished data and time
    [Arguments]  ${type_of_operation}=None
    Open gNB Device PNP Page
    ${string_val} =   Get Text  ${XPATH_PNP_WORKFLOW_STATUS_STRING}
    run keyword If  '${type_of_operation}' != 'None'   Should Contain   ${string_val}  ${type_of_operation}
    ${data_time} =   Get Finshed If Present  ${string_val}
    [Return]   ${data_time}
