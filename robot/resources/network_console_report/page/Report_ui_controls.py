NETWORK_REPORT_PAGE='//[@id="Reports"]/div[1]'
#XPATH_REPORT_NAME1_FILTERBOX = "//div[@class='filters-wrap']//div[2]//input[1]"
XPATH_REPORT_NAME1_FILTERBOX='//*[@id="NC_Reports_ReportTable"]/div[1]/div[1]/div/table/tbody/tr[2]/td[2]/div/input'
XPATH_REPORT_CHECKBOX_SELECT = "//span[@id='NC_Reports_ChkBox_']//label"
XPATH_REPORT_TABLE='id=NC_Reports_ReportTable'
ID_REPORT_CHECKBOX_SELECT = 'id=NC_Reports_ChkBox_'
ID_NC_OPERATIONAL_HISTORY = 'id=NC_DMSHeader_Operation_History_Button'
#XPATH_RESOURCE_NAME_FILTER = '//div[4]//input[1]'
XPATH_RESOURCE_NAME_FILTER='//*[@id="DMS_Operation_History_Table"]/div[1]/div[1]/div/table/tbody/tr[2]/td[4]/div/input'
ID_NC_OPERATIONAL_HISTORY='//*[@id="DMS_Operation_History_Table"]/div[1]/div[1]/div/table/tbody/tr[2]/td[4]/div'
ID_OPERATIONAL_HISTORY_APPLY_FILTER = 'id=DC_OperationHistory_ApplyFilter_Button'
XPATH_OPERATIONAL_HISTORY_REPORT = '//tr[1]//td[4]//div[1]//div[1]'
ID_DOWNLOAD_MESSAGE='id=networkconsole-1878154089-overlays'
#XPATH_REPORT_DOWNLOAD_COMPLETE ='//div[@class="v-Notification"]'
XPATH_REPORT_DOWNLOAD_COMPLETE ="//body/div[@id='networkconsole-1878154089-overlays']/div[2]/div[1]/div[1]/p[1]"
XPATH_REPORT_DOWNLOAD_SUCCESS ="//body/div[@id='networkconsole-1878154089-overlays']/div[2]/div[1]/div[1]/h1[1]"
#'//div[@class="popupContent"]'
#FILE_COPY_FROM_LOCATION="C:\\Users\\commscope\\Downloads\\0005B9-LTE_Enterprise_C-RANSC_Cntrl_Master-device-config-*.txt"
FILE_COPY_FROM_LOCATION='C:\\Users\\commscope\\Downloads\\'
FILE_COPY_TO_LOCATION="C:\\Users\\commscope\\Desktop\\Report_file"
DOWNLOAD_SUCCESS_VALUE="Success"
DOWNLOAD_COMPLETE_VALUE_BC_MASTER="Download completed for 0005B9-LTE_Enterprise_C-RANSC_Cntrl_Master-device-config"
DOWNLOAD_COMPLETE_VALUE_MASTER_DEVICE_STATUS="Download completed for 0005B9-LTE_Enterprise_C-RANSC_Cntrl_Master-device-status"
DOWNLOAD_COMPLETE_VALUE_LICENSE="Download completed for 0005B9-LTE_Enterprise_C-RANSC_Cntrl_LicenseInUse"
#DOWNLOAD_COMPLETE_VALUE_RP5100_DEVICE_STATUS="Download completed for 0005B9-LTE_Enterprise_C-RANSC_NGRadio_RFModule_Master-device-status"
DOWNLOAD_COMPLETE_VALUE_RP5100_DEVICE_STATUS="Download completed for 0005B9-CS_ONECELL_RU51_RFModule_Master-device-status"
DOWNLOAD_COMPLETE_VALUE_RP_DEVICE_STATUS ="Download completed for 0005B9-LTE_Enterprise_C-RANSC_Radio_Master-device-status"
DOWNLOAD_COMPLETE_VALUE_BC_DELTA_DEVICE_CONFIG ="Download completed for 0005B9-LTE_Enterprise_C-RANSC_Cntrl_Delta-device-config"
DOWNLOAD_COMPLETE_VALUE_RP_DELTA_DEVICE_CONFIG ="Download completed for 0005B9-LTE_Enterprise_C-RANSC_Radio_Delta-device-config"
DOWNLOAD_COMPLETE_VALUE_RP_MASTER_DEVICE_CONFIG ="Download completed for 0005B9-LTE_Enterprise_C-RANSC_Radio_Master-device-config"
DOWNLOAD_COMPLETE_VALUE_GoldStandard="Download the reports from /xmldb/appdata/dms/reports/goldstandard/"
#DOWNLOAD_COMPLETE_VALUE_RP5100_DELTA_DEVICE_CONFIG ="Download completed for 0005B9-LTE_Enterprise_C-RANSC_NGRadio_RFModule_Delta-device-config"
DOWNLOAD_COMPLETE_VALUE_RP5100_DELTA_DEVICE_CONFIG ="Download completed for 0005B9-CS_ONECELL_RU51_RFModule_Delta-device-config"
#DOWNLOAD_COMPLETE_VALUE_RP5100_MASTER_DEVICE_CONFIG ="Download completed for 0005B9-LTE_Enterprise_C-RANSC_NGRadio_RFModule_Master-device-config"
DOWNLOAD_COMPLETE_VALUE_RP5100_MASTER_DEVICE_CONFIG ="Download completed for 0005B9-CS_ONECELL_RU51_RFModule_Master-device-config"
#TOGGLE_BUTTON='//*[@id="NC_Reports_ToggleButton_6"]/span/img'
TOGGLE_BUTTON='//*[@id="NC_Reports_ReportTable"]/div[3]/div[1]/table/tbody/tr[6]/td[6]/div'
TOOL_TIP_TEXT='//body/div[1]/div/div[2]/div[3]/div[2]/div[2]/div/div/div/div[2]/div/div[2]/div/div[3]/div[1]/table/tbody/tr[6]/td[6]/div/div/span/img'

#DMS_OPERATION_HISTORY_TABLE_GOLD_STANDARD='//*[@id="DMS_Operation_History_Table"]/div[3]/div[1]/table/tbody/tr[1]/td[4]/div/div'
DMS_OPERATION_HISTORY_TABLE_GOLD_STANDARD='//*[@id="DMS_Operation_History_Table"]/div[2]/div[1]/table/tbody/tr[1]/td[4]'

#Device List
XPATH_DEVICE_AND_SOFTWARE_INPUT = '//*[contains(text(), "{input}")]/parent::div/following::div//input'
#DEVICE_TYPE_XPATH='//*[@id="DC_Menu_Content_Get_Menu_Content_Page"]/div[2]/div/div/div/div/div[1]/div/div[1]/div/div[1]/div[1]/div'
DEVICE_TYPE_XPATH='//input[@class="v-filterselect-input"]'
SELECT_FILTER_XPATH='//*[@id="NC_DeviceList_SavedFilterComponent"]//div[contains(@class,"v-filterselect-button")]'
DEVICE_TYPE_XPATH='//div[@class="v-filterselect v-widget deviceTypeComponenet-width-ext v-filterselect-deviceTypeComponenet-width-ext"]//div[@class="v-filterselect-button"]'
#DEVICE_LIST_OPTION='//*[@id="VAADIN_COMBOBOX_OPTIONLIST"]/div/div[2]/table/tbody/tr[5]/td/span'
DEVICE_LIST_OPTION='//*[@id="VAADIN_COMBOBOX_OPTIONLIST"]//span[contains(text(),"0005B9-LTE_Enterprise_C-RANSC_Radio")]'
#DEVICE_LIST_OPTION='//*[@id="VAADIN_COMBOBOX_OPTIONLIST"]//span[text()="0005B9-LTE_Enterprise_C-RANSC_NGRadio"]'
#DEVICE_LIST_OPTION='//*[@id="VAADIN_COMBOBOX_OPTIONLIST"]//span[text()="0005B9-CS_ONECELL_RU51"]'
FILTER_OPTION='//*[@id="VAADIN_COMBOBOX_OPTIONLIST"]//span[contains(text(),"Blacklist_RP")]'
#RP_CHECKBOX='//*[@id="NC_DeviceList_PagedFilterTable"]/div[3]/div[1]/table/tbody/tr/td[1]/div/span'
RP_CHECKBOX='//*[@id="NC_DeviceList_PagedFilterTable"]/div[2]/div[1]/table/tbody/tr/td[1]/div/span'
Blacklist_button='//*[@id="NC_DeviceList_BlackListButton"]'
#Blacklist_confirm_button='//*[@id="DC_ConfirmationWindow_WhiteList"]//span[contains(text(),"Confirm")]'
Blacklist_confirm_button='//*[@id="DC_ConfirmationWindow_WhiteList"]/div/div/div[3]/div/div/div[2]/div/div[1]/button'

#Operation_type_text='//*[@id="DMS_Operation_History_Table"]/div[3]/div[1]/table/tbody/tr[1]/td[5]/div'
Operation_type_text='//*[@id="DMS_Operation_History_Table"]/div[2]/div[1]/table/tbody/tr[1]/td[5]/div'

Operation_type_status='//*[@id="DMS_Operation_History_Table"]/div[3]/div[1]/table/tbody/tr[1]/td[6]/div'
Operation_type_status='//*[@id="DMS_Operation_History_Table"]/div[2]/div[1]/table/tbody/tr[1]/td[6]/div'


Operation_history_button='//*[@id="NC_DMSHeader_Operation_History_Button"]'
Remove_Blacklist_button='//*[@id="NC_DeviceList_WhiteListButton"]'
SEARCH_OPTION='//*[@id="NC_DeviceList_AdvancedSearch"]'
DEVICE_TYPE_COMBO='//*[@id="NC_DeviceList_DeviceType"]/div'
Device_List_User_Option='//*[@id="NC_DeviceList_UserOption"]'
Device_List_Apply_Filter='//*[@id="NC_DeviceList_ApplyFilter"]'

XPATH_OPERATION_APPLY_FILTER='//*[@id="DC_OperationHistory_ApplyFilter_Button"]'
XPATH_OPERATION_TABLE_INPUT='//*[@id="DMS_Operation_History_Table"]/div[2]/div/div/div[5]/input'
XPATH_OPERATION_TABLE_INPUT='//*[@id="DMS_Operation_History_Table"]/div[1]/div[1]/div/table/tbody/tr[2]/td[5]/div/input'
#BLACK_LIST_MAC_ID='0005B951D651'
#BLACK_LIST_MAC_ID='0005B9ABB2'
BLACK_LIST_MAC_ID='0005B9ABB2'

XAPTH_LIST_ELEMENT='//span[contains(text(),"0005B9-LTE_Enterprise_C-RANSC_Radio")]'
XPATH_DEVICE_LIST_FILTER_COMBO='//*[@id="NC_DeviceList_DeviceType"]/input'
LIST_VALUE_RADIO='0005B9-LTE_Enterprise_C-RANSC_Radio'

XPATH_REPORT_NAME = '//tbody/tr[2]/td[2]/div[1]/input[1]'
XPATH_RESOURCENAME = '//tbody/tr[2]/td[4]/div[1]/input[1]'
DOWNLOAD_COMPLETE_VALUE_ONECELL5G_CUCP_DEVICE_CONFIG = 'Download completed for CUCP-Config'
DOWNLOAD_COMPLETE_VALUE_ONECELL5G_CUUP_DEVICE_CONFIG = 'Download completed for CUUP-Config'
DOWNLOAD_COMPLETE_VALUE_ONECELL5G_DU_DEVICE_CONFIG = 'Download completed for DU-Config'
XPATH_EDIT_REPORT_BUTTON ='//div[contains(@class,"dms-edit-btn")]/button'
XPATH_SERVER_TIME = '//*[@id="DC_ServerTime_Layout"]'
XPATH_START_TIME = '(//*[@id="NC_Reports_StartDateField"])/input'
#XPATH_START_TIME = '//*[contains(text(), "2021")]/parent::div/following::div//input'
XPATH_SAVE_REPORT_BUTTON = '//*[@id="NC_Reports_Window_Save"]'
XPATH_REPORT_START_TIME = '//*[@id="NC_Reports_ReportTable"]/div[2]'

Gold_Standard_file_Location='\\robot\\report_files'