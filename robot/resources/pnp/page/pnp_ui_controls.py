#PNP PAGE
ID_PNP_MAIN_PAGE= '//*[@id="DC_Menu_devicepnp_ID"]'
ID_PNP_WOKFLOW = 'id=DC_PnPStatus_PnPWorkflow_Box'
ID_PNP_MAIN_PAGE_BUTTON='id=DC_Menu_devicepnp_ID'
XPATH_PNP_WORKFLOW_TAG = '//*[text()="PnP Workflow"]'
ID_PNP_PAGE_STATUS_HEADER='id=DC_Device PnP Status_Header'
XPATH_WORKFLOW_STEP_FAILED='//div[contains(@class,"v-verticallayout-stepFailed")]'
XPATH_CONTAIN_DMS_SUMMARY_INSERVICE='//div[contains(@class,"dms-summary-inservice")]'
XPATH_CONTAIN_DMS_SUMMARY_OUTOFSERVICE='//div[contains(@class,"dms-summary-outofservice")]'
XPATH_PNP_WORKFLOW_FINISHED_ON_TEXT = '//b[contains(text(),"finished on")]'
XPATH_PNP_WORKFLOW_STATUS_STRING='//div[@class="v-label v-widget v-has-width"]'
DEVICE_PNP_PAGE='{dms_device_console}#!mv/devicepnp/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
DEVICE_PNP_PAGE_gNB='{dms_device_console}#!mv/devicepnp/?srchKey=MAC&id={device_macid}&dt=ONECELL5GDU&context=null'
XPATH_PNP_LAST_REFRESHED ='//div[contains(text(),"Last Refreshed")]'
XPATH_PNP_HEADER_CONTAINS = '//div[contains(@class,"v-label-dms-menufeaturedlabelselected label-left-padding")]'

ID_MENU_ACTION= 'id=menu-action'

ID_DASHBOARD_PNPSTATUS_HEADER_gNB ='id=DC_PnP Status_Header'


XPATH_PNP_STATUS_MENU = "//*[@id='DC_Menu_devicepnp_ID']/div[1]"
ID_DASHBOARD_PNPSTATUS_HEADER ='id=DC_PnP Status_Header'
XPATH_DASHBOARD_PNPWORKFLOW_HEADER = "//b[contains(text(),'PnP Workflow')]"
