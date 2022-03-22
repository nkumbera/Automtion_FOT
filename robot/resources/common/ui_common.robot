*** Settings ***
Library             SeleniumLibrary
Library             OperatingSystem
Variables           dms_ui_controls.py

*** Variables ***
${DMS_Window}  Device Console
${SIM_Window}  Slamd Console
${NC_Window}  Network Console
${DMS_DEVICE_URL}   #!mv/dashboard/?srchKey=MAC&id={device_macid}&dt=onecell&context=null
${finished_on}    finished on
${UTC}    UTC


*** Keywords ***
Prepare Selenium Driver
    [Documentation]    Set chromedriver path
    Log     ${EXECDIR}
    #Set Environment Variable  webdriver.chrome.driver  ${EXECDIR}\\robot\\chromedriver.exe
    Create Webdriver Chrome  executable_path=D:/a/1/s/node_modules/chromedriver/lib/chromedriver/chromedriver.exe

DMS UI Login
    [Documentation]    Log in DMS UI as DMS Admin
    Prepare Selenium Driver
    #Open Browser    ${SMALD_SIMULATOR}  Chrome  alias=${SIM_Window}
    #Maximize Browser Window
    Open Browser    ${DMS_NC_URL}    Chrome  alias=${NC_Window}
    Maximize Browser Window
    Wait Until Page Contains Element   ${XPATH_DMS_NC_LOGIN_USER}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    Input Text    ${XPATH_DMS_NC_LOGIN_USER}    ${DMS_UI_USER}
    Input Password    ${XPATH_DMS_NC_LOGIN_PASSWORD}    ${DMS_UI_PASSWORD}
    Click DMS Element    ${XPATH_DMS_NC_LOGIN_SIGNIN}
    Open Browser    ${DMS_UI_URL}    Chrome  alias=${DMS_Window}
    Maximize Browser Window
    #Switch browser  ${DMS_Window}
    Wait Until Page Contains Element   ${ID_DMS_LOGIN_USER}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    Input Text    ${ID_DMS_LOGIN_USER}    ${DMS_UI_USER}
    Input Password    ${ID_DMS_LOGIN_PASSWORD}    ${DMS_UI_PASSWORD}
    Click Button    ${ID_DMS_LOGIN_SIGNIN}

Device console Login
    [Documentation]    Log in Device console  as DMS Admin
    Prepare Selenium Driver
    #Open Browser    ${SMALD_SIMULATOR}  Chrome  alias=${SIM_Window}
    #Maximize Browser Window
    #Open Browser    ${DMS_NC_URL}    Chrome  alias=${NC_Window}
    #Maximize Browser Window
    #Wait Until Page Contains Element   ${XPATH_DMS_NC_LOGIN_USER}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    #Input Text    ${XPATH_DMS_NC_LOGIN_USER}    ${DMS_UI_USER}
    #Input Password    ${XPATH_DMS_NC_LOGIN_PASSWORD}    ${DMS_UI_PASSWORD}
    #Click DMS Element    ${XPATH_DMS_NC_LOGIN_SIGNIN}

    Close All Browsers
    BuiltIn.Sleep  10s
    Open Browser    ${DMS_UI_URL}    Chrome  alias=${DMS_Window}
    #Open Browser    ${DMS_UI_URL}    headlesschrome
    Maximize Browser Window
    #Set Window Size     1920    1080

    #Switch browser  ${DMS_Window}
    Wait Until Page Contains Element   ${ID_DMS_LOGIN_USER}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    Input Text    ${ID_DMS_LOGIN_USER}    ${DMS_UI_USER}
    Input Password    ${ID_DMS_LOGIN_PASSWORD}    ${DMS_UI_PASSWORD}
    Click Button    ${ID_DMS_LOGIN_SIGNIN}


DMS UI Logout
    [Documentation]  Logging off as DMS Admin
    BuiltIn.Sleep  5s
    Close All Browsers

Login with Device ID
    [Documentation]  Use the device id to login after User Login
    [Arguments]  ${device_id}
    ${device_url} =  Format String  ${DEVICE_DASHBOARD_DEVICE_URL}   dms_device_console=${DMS_UI_URL}   device_macid=${device_id}
    Go To  ${device_url}
    BuiltIn.Sleep  5s
    Wait Until Page Contains Element  ${ID_DASHBOARD_HEADER_STRING}  timeout=${BROWSER_ELEMENT_TIMEOUT}

Login with gNB Device ID
    [Documentation]  Use the device id to login after User Login
    [Arguments]  ${device_id}
    ${device_url} =  Format String  ${DEVICE_DASHBOARD_DEVICE_URL_gNB}   dms_device_console=${DMS_UI_URL}   device_macid=${device_id}
    Go To  ${device_url}
    BuiltIn.Sleep  5s
    Wait Until Page Contains Element  ${ID_DASHBOARD_HEADER_STRING}  timeout=${BROWSER_ELEMENT_TIMEOUT}

Click DMS Element
    [Documentation]  Check Element and Click Action
    [Arguments]  ${CONTROL}
    Wait Until Element Is Visible  ${CONTROL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${CONTROL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Click Element  ${CONTROL}

Input DMS Text
    [Documentation]  Check Element and Input Text
    [Arguments]  ${control_element}  ${data_input}
    Wait Until Element Is Visible  ${control_element}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${control_element}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Input Text  ${control_element}  ${data_input}

Click DMS Button
    [Documentation]  Check Element and Click Action
    [Arguments]  ${CONTROL}
    Wait Until Element Is Visible  ${CONTROL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Page Contains Element  ${CONTROL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Enabled  ${CONTROL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Click Button  ${CONTROL}

Get DMS Element Text
    [Documentation]  Get Text
    [Arguments]  ${CONTROL}
    Wait Until Page Contains Element  ${CONTROL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Wait Until Element Is Visible  ${CONTROL}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    ${get_text} =  Get Text  ${CONTROL}
    [return]  ${get_text}

Select DMS Dropdown Option
    [Documentation]  Select time option from the given list in filter frame
    [Arguments]   ${dropdown_xpath}  ${option}
    ${list_button}=  Catenate  ${dropdown_xpath}  /following::div
    BuiltIn.Sleep  3s
    Click DMS Element  ${list_button}
    BuiltIn.Sleep  3s
    #Click DMS Element  ${list_button}
    #BuiltIn.Sleep  3s
    ${option_output}=  Format String   ${XPATH_DMS_DROPDOWN_OPTION_LISTITEM}   option=${option}
    BuiltIn.Sleep  3s
    ${item_present}=  Run Keyword And Return Status  Element Should Be Visible  ${option_output}
    BuiltIn.Sleep  3s
    ${next_page_present}=  Run Keyword And Return Status  Element Should Be Visible  ${XPATH_DMS_DROPDOWN_LIST_NEXT_BUTTON}
    BuiltIn.Sleep  3s
    Run Keyword If  ${item_present}  Run Keywords     BuiltIn.Sleep  5s  AND    Click DMS Element  ${option_output}
    ...  ELSE  Run Keywords  Mouse Over  ${XPATH_DMS_DROPDOWN_LIST_NEXT_BUTTON}  AND  Click DMS Element  ${XPATH_DMS_DROPDOWN_LIST_NEXT_BUTTON}  AND  Click DMS Element  ${option_output}
    BuiltIn.Sleep  3s
    Log  ${option} option is selected

Switch To DMS Window
    [Documentation]  Switch To DMS Window
    Switch browser  ${DMS_Window}

Switch To DMS Network Console Window
    [Documentation]  Switch To DMS Network Console Window
    Switch browser  ${NC_Window}


Switch To SLAMID Window
    [Documentation]  Switch to Simulator
    Switch browser  ${SIM_Window}

Return Finshed Data Time
    [Arguments]  ${total_string}
    ${str_fetch} =  Fetch From Right  ${total_string}  ${finished_on}
    Log   ${str_fetch}
    ${str_fetch} =  Fetch From Left  ${str_fetch}  ${UTC}
    Log   ${str_fetch}
    [Return]  ${str_fetch}

Get Finshed If Present
    [Arguments]  ${string_val}
    Log  Str Text ${string_val}
    ${count} =  Get Lines Containing String   ${string_val}   ${finished_on}   1
    Log   ${count}
    Run Keyword And Return If  '${count}' != ''   Return Finshed Data Time  ${string_val}
    [Return]   None

Get Diff Time Stamp
    [Documentation]  Get the Time Difference
    [Arguments]  ${old_time}  ${new_time}
    ${old_time_stamp} =  Convert Date  ${old_time}
    ${new_time_stamp} =  Convert Date  ${new_time}
    ${value} =   Subtract Date From Date  ${new_time_stamp}    ${old_time_stamp}
    Should Be True  ${value} > 0

Browser Zoom Level
    [Documentation]  Set browser zoom level
    [Arguments]  ${zoom_level}
    Execute Javascript  window.parent.document.body.style.zoom="${zoom_level}"

Wait Until Loading Icon Disappears
    [Documentation]  Wait until loading icon disappear from page
    Run Keyword And Ignore Error  Wait Until Element Is Not Visible  ${XPATH_DMS_LOADING_ICON}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Run Keyword And Ignore Error  Wait Until Element Is Visible  ${XPATH_DMS_LOADING_ICON}  timeout=${BROWSER_ELEMENT_TIMEOUT}

DMS NC Login
    [Documentation]    Log in DMS UI as DMS Admin
    Prepare Selenium Driver
    Open Browser    ${DMS_NC_URL}    Chrome  alias=${NC_Window}
    Maximize Browser Window
    Wait Until Page Contains Element   ${XPATH_DMS_NC_LOGIN_USER}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    Input Text    ${XPATH_DMS_NC_LOGIN_USER}    ${DMS_UI_USER}
    Input Password    ${XPATH_DMS_NC_LOGIN_PASSWORD}    ${DMS_UI_PASSWORD}
    Click DMS Element    ${XPATH_DMS_NC_LOGIN_SIGNIN}

DMS Network Console UI Login
    [Documentation]    Log in DMS NC UI as DMS Admin
    Open Browser    ${DMS_NETWORK_CONSOLE_URL}    Chrome  alias=${NC_Window}
    Maximize Browser Window
    Wait Until Page Contains Element   ${ID_DMS_NC_LOGIN_USER}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    Input Text    ${ID_DMS_NC_LOGIN_USER}    ${DMS_NC_UI_USER}
    Input Password    ${ID_DMS_NC_LOGIN_PASSWORD}    ${DMS_NC_UI_PASSWORD}
    Wait Until Page Contains Element   ${ID_DMS_NC_LOGIN_SIGNIN}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    Click Element  ${ID_DMS_NC_LOGIN_SIGNIN}

DMS Network Console UI Logout
    [Documentation]  Logging off as DMS Admin
    BuiltIn.Sleep  10s
    Close All Browsers


DMS WebGUI Login
    [Documentation]    Log in DMS NC UI as DMS Admin
    Open Browser    ${DMS_WEBGUI_URL}    Chrome  alias=${NC_Window}
    Maximize Browser Window
    Click Element  ${XPATH_ADVANCE_BUTTON}
    BuiltIn.Sleep  5s
    Scroll Element Into View    ${XPATH_PROCEED_LINK}
    Click Element  ${XPATH_PROCEED_LINK}
    BuiltIn.Sleep  5s
    Wait Until Page Contains Element   ${ID_DMS_WEBGUI_LOGIN_USER}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    Input Text    ${ID_DMS_WEBGUI_LOGIN_USER}    ${DMS_WEBGUI_UI_USER}
    Input Password    ${ID_DMS_WEBGUI_LOGIN_PASSWORD}    ${DMS_WEBGUI_UI_PASSWORD}
    Wait Until Page Contains Element   ${ID_DMS_WEBGUI_LOGIN_SIGNIN}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    Click Element  ${ID_DMS_WEBGUI_LOGIN_SIGNIN}

DMS WebGUI Logout
    [Documentation]  Logging off as DMS Admin
    BuiltIn.Sleep  10s
    Click DMS Element   ${XPATH_LOGOUT_DROPDOWN}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_HREF_LOGOUT}
    Close All Browsers


DMS Network console Logout
    BuiltIn.Sleep  5s
    Click DMS Element   ${XPATH_NETWORK_CONSOLE_DROPDOWN}
    BuiltIn.Sleep  5s
    Click DMS Element  ${XPATH_NETWORK_CONSOLE_LOGOUT_BUTTON}
    Close All Browsers

Check the About Link in homepage
    [Documentation]  check the About option to display the version details
    BuiltIn.Sleep  10s
    Click DMS Element    ${ID_DMS_NC_POPUP_BUTTON}
    BuiltIn.Sleep  5s
    Click DMS Element    ${ID_DMS_NC_ABOUT_BUTTON}
    Wait Until Page Contains Element   ${XPATH_DMS_NC_ABOUT_NAME}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    click dms element    ${XPATH_DMS_NC_ABOUT_CLOSE}
    BuiltIn.Sleep  5s

Search for device in NC
    [Documentation]  search for the device in Network console
    [Arguments]  ${device_id}
    BuiltIn.Sleep  10s
    Click DMS Element    ${ID_DMS_NC_SEARCH_BTN}
    BuiltIn.Sleep  5s
    Input Text    ${ID_DMS_NC_ENTER_DEVICE}     ${device_id}
    BuiltIn.Sleep  2s
    Click DMS Element   ${XPATH_HOME_SEARCHBTN}
    Wait Until Page Contains Element  ${ID_DASHBOARD_HEADER_STRING}  timeout=${BROWSER_ELEMENT_TIMEOUT}
    Go To   ${DMS_NETWORK_CONSOLE_URL}


Device console Login RealDevice
    [Documentation]    Log in Device console  as DMS Admin
    Prepare Selenium Driver
    Close All Browsers
    BuiltIn.Sleep  10s
    Open Browser    ${DMS_UI_URL_RealDevice}    Chrome  alias=${DMS_Window}
    Maximize Browser Window
    #Wait Until Page Contains Element   ${ID_DMS_LOGIN_USER}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    BuiltIn.Sleep  10s
    Input Text    ${ID_DMS_LOGIN_USER}    ${DMS_UI_USER}
    Input Password    ${ID_DMS_LOGIN_PASSWORD}    ${DMS_UI_PASSWORD}
    Click Button    ${ID_DMS_LOGIN_SIGNIN}
Network console Login RealDevice
    [Documentation]    Log in DMS NC UI as DMS Admin
    Open Browser    ${DMS_NP_UI_URL_RealDevice}    Chrome  alias=${NC_Window}
    Maximize Browser Window
    Wait Until Page Contains Element   ${ID_DMS_NC_LOGIN_USER}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    Input Text    ${ID_DMS_NC_LOGIN_USER}    ${DMS_NC_UI_USER}
    Input Password    ${ID_DMS_NC_LOGIN_PASSWORD}    ${DMS_NC_UI_PASSWORD}
    Wait Until Page Contains Element   ${ID_DMS_NC_LOGIN_SIGNIN}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    Click Element  ${ID_DMS_NC_LOGIN_SIGNIN}
Login with Real Device ID
    [Documentation]  Use the device id to login after User Login
    [Arguments]  ${device_id}
    ${device_url} =  Format String  ${DEVICE_DASHBOARD_DEVICE_URL}   dms_device_console=${DMS_UI_URL_RealDevice}   device_macid=${device_id}
    Go To  ${device_url}
    BuiltIn.Sleep  5s
    Wait Until Page Contains Element  ${ID_DASHBOARD_HEADER_STRING}  timeout=${BROWSER_ELEMENT_TIMEOUT}


Login with Device ID CU
    [Documentation]  Use the device id to login after User Login
    [Arguments]  ${device_id}
    ${device_url} =  Format String  ${DEVICE_DASHBOARD_DEVICE_URL_CU}   dms_device_console=${DMS_UI_URL}   device_macid=${device_id}
    Go To  ${device_url}
    BuiltIn.Sleep  5s
    Wait Until Page Contains Element  ${ID_DASHBOARD_HEADER_STRING}  timeout=${BROWSER_ELEMENT_TIMEOUT}

Login with Device ID DU
    [Documentation]  Use the device id to login after User Login
    [Arguments]  ${device_id}
    ${device_url} =  Format String  ${DEVICE_DASHBOARD_DEVICE_URL_DU}   dms_device_console=${DMS_UI_URL}   device_macid=${device_id}
    Go To  ${device_url}
    BuiltIn.Sleep  5s
    Wait Until Page Contains Element  ${ID_DASHBOARD_HEADER_STRING}  timeout=${BROWSER_ELEMENT_TIMEOUT}


Sotool Dashboard UI Login
    [Documentation]    Log in SO-Tool UI as soadmin
    Open Browser    ${SO_TOOL_UI_URL}    Chrome  alias=${NC_Window}
    Maximize Browser Window
    Wait Until Page Contains Element   ${ID_SO_TOOL_LOGIN_USER}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    Input Text    ${ID_SO_TOOL_LOGIN_USER}    ${SO_TOOL_UI_USER}
    Input Password    ${ID_SO_TOOL_LOGIN_PASSWORD}    ${SO_TOOL_UI_PASSWORD}
    Wait Until Page Contains Element   ${ID_SO_TOOL_LOGIN_SIGNIN}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    Click Element  ${ID_SO_TOOL_LOGIN_SIGNIN}


Sotool DMS Network Console UI Login
    [Documentation]    Log in Sotool DMS NC UI as DMS Admin
    Open Browser    ${SO_TOOL_DMS_NETWORK_CONSOLE_URL}    Chrome  alias=${NC_Window}
    Maximize Browser Window
    Wait Until Page Contains Element   ${ID_DMS_NC_LOGIN_USER}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    Input Text    ${ID_DMS_NC_LOGIN_USER}    ${DMS_NC_UI_USER}
    Input Password    ${ID_DMS_NC_LOGIN_PASSWORD}    ${DMS_NC_UI_PASSWORD}
    Wait Until Page Contains Element   ${ID_DMS_NC_LOGIN_SIGNIN}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    Click Element  ${ID_DMS_NC_LOGIN_SIGNIN}

Select schedule time
    [Arguments]     ${Calendar_xpath}
    ${Current Time}=    GET Value     ${Calendar_xpath}
    Log    ${Current Time}
    ${split value}     Split String   ${Current Time}
    Log     ${split value}
    Log     ${split value}[0]
    Log     ${split value}[1]
    Log     ${split value}[2]
    ${pre}     ${post} =  Split String   ${split value}[1]  :  1
    Log     ${pre}
    Log     ${post}
    Log     int(${post})
    #${pre}    set variable    08
    #${post}    set variable    04
    ${new_value}=    Evaluate   int('${post}') + 4
    Log    ${new_value}
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



    ${new date}=     Run keyword if  int(${len}) == 1    Catenate     ${split value}[0]  ${pre}:0${new_value}  ${split value}[2]
    ...  ELSE    Catenate     ${split value}[0]  ${pre}:${new_value}  ${split value}[2]
    Log     ${new date}

    BuiltIn.Sleep  5s
    Clear Element Text     ${Calendar_xpath}
    BuiltIn.Sleep  5s
    Input DMS Text      ${Calendar_xpath}      ${new date}
    BuiltIn.Sleep  5s
Login with Real Device ID CU
    [Documentation]  Use the device id to login after User Login
    [Arguments]  ${device_id}
    ${device_url} =  Format String  ${DEVICE_DASHBOARD_DEVICE_URL_CU}   dms_device_console=${DMS_UI_URL_RealDevice}   device_macid=${device_id}
    Go To  ${device_url}
    BuiltIn.Sleep  5s
    Wait Until Page Contains Element  ${ID_DASHBOARD_HEADER_STRING}  timeout=${BROWSER_ELEMENT_TIMEOUT}


DMS WebGUI Login from Device Console
    [Documentation]    Log in DMS from Device Console
    Switch Window  title:Login
    BuiltIn.Sleep  5s
    Wait Until Page Contains Element   ${ID_DMS_WEBGUI_LOGIN_USER}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    Input Text    ${ID_DMS_WEBGUI_LOGIN_USER}    ${DMS_WEBGUI_UI_USER}
    Input Password    ${ID_DMS_WEBGUI_LOGIN_PASSWORD}    ${DMS_WEBGUI_UI_PASSWORD}
    Wait Until Page Contains Element   ${ID_DMS_WEBGUI_LOGIN_SIGNIN}   timeout=${BROWSER_ELEMENT_TIMEOUT}
    Click Element  ${ID_DMS_WEBGUI_LOGIN_SIGNIN}
    Wait Until Page Contains Element  ${XPATH_DEVICE_STATUS_WEBGUI}  timeout=${BROWSER_ELEMENT_TIMEOUT}


