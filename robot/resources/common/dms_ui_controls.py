XPATH_DEVICE_STATUS_PNP = '//*[@id="DC_Menu_devicepnp_ID"]/*[text()="Device PnP Status"]'
ID_DMS_LOGIN_USER = 'id=usernameTf'
ID_DMS_LOGIN_PASSWORD = 'id=passwordTf'
ID_DMS_LOGIN_SIGNIN = 'id=signinbutton'
XPATH_DMS_LOADING_ICON = '//div[contains( @class , "loading")]'
XPATH_DMS_NC_LOGIN_USER = '//*[contains(text(), "Username")]/parent::div//following-sibling::div/input[@type="text"]'
XPATH_DMS_NC_LOGIN_PASSWORD = '//*[contains(text(), "Password")]/parent::div//following-sibling::div/input[@type="password"]'
XPATH_DMS_NC_LOGIN_SIGNIN = '//*[contains(text(), "Sign in")]//ancestor::*[contains(@role, "button") or contains(@type, "button")]'
XPATH_DMS_DROPDOWN_OPTION_LISTITEM = '//*[@id="VAADIN_COMBOBOX_OPTIONLIST"]//span[contains(text(),"{option}")]/parent::td'
XPATH_DMS_DROPDOWN_LIST_NEXT_BUTTON = '//*[@id="VAADIN_COMBOBOX_OPTIONLIST"]//span[contains(text(), "Next")]/parent::div'
ID_DASHBOARD_HEADER_STRING = 'id=DC_Dashboard_Header'
ID_DMS_NC_LOGIN_USER = 'id=DC_Login_UserName_Text'
ID_DMS_NC_LOGIN_PASSWORD = 'id=DC_Login_Password_Text'
ID_DMS_NC_LOGIN_SIGNIN = 'id=DC_Login_SignIn'
DEVICE_DASHBOARD_DEVICE_URL = '{dms_device_console}#!mv/dashboard/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
DEVICE_DASHBOARD_DEVICE_URL_gNB = '{dms_device_console}#!mv/dashboard/?srchKey=MAC&id={device_macid}&dt=ONECELL5GCU&context=null'
DEVICE_DASHBOARD_DEVICE_URL_gNB_CU = '{dms_device_console}#!mv/dashboard/?srchKey=MAC&id={device_macid}&dt=ONECELL5GCU&context=null'
DEVICE_DASHBOARD_DEVICE_URL_gNB_DU = '{dms_device_console}#!mv/dashboard/?srchKey=MAC&id={device_macid}&dt=ONECELL5GDU&context=null'

ID_DMS_WEBGUI_LOGIN_USER='//*[@id="id_username"]'
ID_DMS_WEBGUI_LOGIN_PASSWORD='//*[@id="id_password"]'
ID_DMS_WEBGUI_LOGIN_SIGNIN='//button[@class="btn btn-success"]'
XPATH_LOGOUT_DROPDOWN='//*[@id="wrapper"]/div/div[1]/nav/ul/li[4]/a'
XPATH_HREF_LOGOUT='//body[1]/div[2]/div[1]/div[1]/nav[1]/ul[1]/li[4]/ul[1]/li[15]/a[1]'
XPATH_ADVANCE_BUTTON='//*[@id="details-button"]'
XPATH_PROCEED_LINK='//*[@id="proceed-link"]'

XPATH_NETWORK_CONSOLE_DROPDOWN='//*[@id="NC_Pop_Up_Button"]'
XPATH_NETWORK_CONSOLE_LOGOUT_BUTTON='//*[@id="NC_Logout"]'

ID_DMS_NC_POPUP_BUTTON="id=NC_Pop_Up_Button"
ID_DMS_NC_ABOUT_BUTTON="id=NC_About"
XPATH_DMS_NC_ABOUT_NAME="//div[text()='Network Management Portal']"
XPATH_DMS_NC_ABOUT_CLOSE="//div[@aria-label='close button']"
ID_DMS_NC_SEARCH_BTN="id=DC_Bell_Image"
ID_DMS_NC_ENTER_DEVICE='ID=welcome-page-device-text-field'

DEVICE_DASHBOARD_DEVICE_URL_CU = '{dms_device_console}#!mv/dashboard/?srchKey=MAC&id={device_macid}&dt=ONECELL5GCU&context=null'
DEVICE_DASHBOARD_DEVICE_URL_DU = '{dms_device_console}#!mv/dashboard/?srchKey=MAC&id={device_macid}&dt=ONECELL5GDU&context=null'
ID_SO_TOOL_LOGIN_USER = 'id=username'
ID_SO_TOOL_LOGIN_PASSWORD = 'id=password'
ID_SO_TOOL_LOGIN_SIGNIN = '//button[contains(text(),"Sign in")]'

XPATH_DEVICE_STATUS_WEBGUI="//div[@class='mgmt-dashboard-widget']//*[contains(text(),'Device Status')]"
