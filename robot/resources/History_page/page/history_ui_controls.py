# Dashboard History Page

XPATH_HISTORY_MENU = "//*[@id='DC_Menu_devicehistory_ID']/div[1]"
ID_DASHBOARD_HISTORY_HEADER ='id=DC_History_Header'
XPATH_DASHBOARD_HISTORY_CHARTS = "//div[contains(text(),'Charts')]"
XPATH_DASHBOARD_HISTORY_TABULAR = "//div[contains(text(),'Tabular')]"
XPATH_Netconf_ROW='//div[@class="v-table-cell-wrapper"][contains(text(),"Netconf Provisioning Response")]'
XPATH_DEVICEHISTORY_TBAULAR_TAB = '//*[text()="{tab_type}"]'
XPATH_DEVICEHISTORY_TIMEOPTION_LIST_DISPLAYER = '//*[@id="selectTimeOption"]/div'
XPATH_DEVICEHISTORY_TIMEOPTION_LISTITEM = '//*[@id="VAADIN_COMBOBOX_OPTIONLIST"]//span[contains(text(),"{time_option}")]/parent::td'
XPATH_DEVICEHISTORY_TIMEOPTION_CHECKBOX = '//*[@id="DC_Tree_Container"]//span[contains(text(), "{event_type}")]'
ID_DEVICEHISTORY_SHOW_BUTTON = 'id=showButton'
ID_DEVICEHISTORY_EXPORT_BUTTON = 'id=DC_DeviceHistory_Export_Button'
