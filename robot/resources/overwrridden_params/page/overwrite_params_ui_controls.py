XPATH_OWP_PROFASSO_PROFILE_ASSOCIATION = '//*[text()="Profile Association"]/parent::*/parent::*'
XPATH_OWP_PROFASSO_LOAD_SERVICE_SETTING_BUTTON='//div[@id="ProfileAssociation.ServiceArea"]//div[@role="button"]'
XPATH_OWP_PROFASSO_CHOOSE_FILE= '//input[@type="file"]'
XPATH_OWP_PROFASSO_ADD_NEW_PROFILE='id=addNewBtn'
ID_OWP_PROFASSO_DC_CONFIG = 'id=DC_Menu_configuration_ID'
ID_OWP_PROFASSO_PROF_ASSO = 'id=DC_Profile Association'
ID_OWP_PROFASSO_FILE_UPLOAD_OK_BUTTON = 'id=DC_FileUpload_OkBtn'
ID_OWP_PROFASSO_CONFIG_SAVE_BUTTON = '//button[@id="DC_Device_Config_Save_Button"]'
XPATH_OWP_CARRIER_AGGRE_BUTTON= '//div[@id="DC_Carrier Aggregation"]//div[contains(@class,"v-button")]'
XPATH_OWP_DOWNLINK_CA_VALUE = '//span[contains(text(),"{value}")]'
XPATH_OWP_FILTER_DROPDOWN_BUTTON= '//div[@class="v-filterselect-button"]'
ID_OWP_DEVICE_CONFIG_SAVE= '//*[@id="DC_Device_Config_Save_Button"]'
ID_OWP_OVERRIDDEN_PARAM_HEADER = 'id=DC_DMS Overridden Params_Header'
DEVICE_OVERWRRIDDEN_PARAMETER = '{dms_device_console}#!mv/configuration/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
XPATH_OWP_DOWNLINK_CA_VALUE_TO_GET = '//input[@class="v-filterselect-input"]'


XPATH_ORP_SECTOR_TAB = '//div[div[div[contains(text(), "{sector}")]]]'
XPATH_ORP_COLLAPSE_EXPAND_BUTTON = '//*[contains(text(), " All")]/parent::button'
XPATH_ORP_COLLAPSE_EXPAND_TEXT = '//*[@id="DC_ExpandCollapse"]/span'
ID_ORP_SEARCH_INPUT = 'id=DC_Search_TextField'
ID_ORP_SEARCH_BUTTON = 'id=DC_Search_Button'
XPATH_ORP_SCALAR_PARAM_INPUT = '//*[contains(text(), "{section}")]//ancestor::div[1]//following-sibling::div//*[contains(text(), "{overridden_param}")]/parent::div//input'
XPATH_ORP_TABULAR_PARAM_INPUT = '//*[contains(text(), "{section}")]//ancestor::div[1]//following-sibling::div//input[contains(@id, "{overridden_param}")]'
XPATH_ORP_PARAM_SAVE_BUTTON = '//*[@id="DC_Device_Config_Save_Button"]'
XPATH_ORP_SAVE_NOTIFICATION_POPUP = '//*[contains(text(),"Saved successfully")]'
XPATH_ORP_TABULAR_PARAM_ADD_LIST_BUTTON = '//*[contains(text(), "{section}")]//ancestor::div[1]//following-sibling::div//*[starts-with(@id, "DC_Add_New_")]'
XPATH_ORP_TABULAR_PARAM_DELETE_LIST_BUTTON = '//*[contains(text(), "{section}")]//ancestor::div[1]//following-sibling::div//*[@id="tabular-delete-layout"]'
#XPATH_ORP_SCALAR_PARAM_DELETE_BUTTON = '//*[contains(text(), "{section}")]//ancestor::div[1]//following-sibling::div//*[contains(text(), "{overridden_param}")]/following-sibling::div[@id="scalar-delete-layout"]'
XPATH_ORP_RP_WHITELIST='//textarea[@id="DC_WL_RP_Whitelist_Value_TextArea"]'
XPATH_ORP_RP_VERIFY_WHITELIST= '//span[contains(text(),"Verify Whitelist")]'
XPATH_ORP_RP_VERIFY_WHITELIST_SUCCESSFUL= '//div[text()="Verification successful!"]'
XPATH_ORP_RP_WHITELIST_EXPAND_BUTTON='//div[contains(@class,"v-button-v-disclosure-caption")]'
XPATH_ORP_WHITELIST_DELETE_PARAMS = '//button[@id="DC_WL_RP_Whitelist_Delete_button"]'
XPATH_ORP_RF_DOWNLINK_DELETE_BTN="//input[@id='DC_DLBandwidth_TF']/following-sibling::div/div"
XPATH_ORP_RF_UPLINK_DELETE_BTN="//input[@id='DC_ULBandwidth_TF']/following-sibling::div/div"
XPATH_ORP_ECSFB_MULTIPLENID_DELETE_BTN="//div[@id='DC_MultipleNid_Label']/following-sibling::div/div"
XPATH_ORP_ECSFB_MULTIPLESID_DELETE_BTN="//div[@id='DC_MultipleSid_Label']/following-sibling::div/div"
XPATH_ORP_ECSFB_HOMEREG_DELETE_BTN="//div[@id='DC_HomeReg_Label']/following-sibling::div/div"
XPATH_OWP_CARRIER_AGGRE_DELETE_BUTTON="//div[@id='DC_downlinkCaEnable_ComboBox']/following-sibling::div/div"

XPATH_TRIGGER_CONFIG_VALUE='//*[@id="DC_X2TriggeredPciReconfigAllowed_ComboBox"]/input'

XPATH_SECTOR_DELETE_BUTTON='//*[contains(@class,"decrement")]'
XPATH_SECTOR_ADD_BUTTON='//*[contains(@class,"increment")]'

XPATH_SECTOR_CELL_PARAMETER='//*[@id="DC_CellIdentity_TF"]'
XPATH_CELL_IDENTITY_COMBO='//*[@id="DC_CellIdentity_ComboBox"]/div'
XPATH_CELL_IDENTITY_VALUE='//*[@id="VAADIN_COMBOBOX_OPTIONLIST"]/div/div[2]/table/tbody/tr[1]/td'
XPATH_CONFIGURE_ACB_BUTTON='//*[@id="DC_ConfigBtn_1"]'
XPATH_CONFIGURE_ACB_OK_BUTTON='//*[@id="DC_Window_Ok_Button"]'
XAPTH_CONFIGURE_BARRING='//*[@id="DC_PLMN.BarringForEmergency_ComboBox"]'
XAPTH_BARRING_FACTOR='//*[@id="DC_PLMN.MODataBarringFactor_ComboBox"]'
XAPTH_BARRING_FACTOR_MO_INPUT='//*[@id="DC_PLMN.MODataBarringFactor_ComboBox"]/div'
XAPTH_BARRING_FACTOR_DROPBOX='//*[@id="DC_PLMN.BarringForEmergency_ComboBox"]/div'
XAPTH_BARRING_FACTOR_INPUT='//*[@id="DC_PLMN.BarringForEmergency_ComboBox"]/input'
#XAPTH_CONFIGURE_BARRING= '//div[@id="DC_PLMN.BarringForEmergency"]//div[contains(@class,"v-button")]'

XPATH_PROVISIONED_DATA_HEADER='//*[@id="DC_Provisioned Data_Header"]'
XPATH_PLMN_TABLE='//*[@id="Public Land Mobile Network (PLMN) List"]'
XAPTH_RF_PARAMETER='//*[@id="DC_RF Parameters Sector"]'
XPATH_SPS_TABLE='//*[@id="DC_SPS Parameters"]'

XPATH_FREQUENCY_BAND_INDICATOR='//*[@id="LteNeighborList.X_0005B9_FreqBandIndicatorPriority"]/div'
XPATH_FREQUENCY_BAND_VALUE_TRUE='//*[@id="VAADIN_COMBOBOX_OPTIONLIST"]/div/div[2]/table/tbody/tr[2]/td'
XPATH_FREQUENCY_BAND_VALUE_FALSE='//*[@id="VAADIN_COMBOBOX_OPTIONLIST"]/div/div[2]/table/tbody/tr[3]/td'


XPATH_BAND_RESERVATION_LABEL='//div[@id="dynamic_table_title_Label"][contains(text(),"Band Reservation")]'
XPATH_CELL_IDENTITY='//*[@id="DC_CellIdentity_Label"][contains(text(),"Cell Mode and Cell Identity")]'
XPATH_DOWNLINK_BANDWIDTH='//*[@id="DC_DLBandwidth_Label"][contains(text(),"Downlink Bandwidth")]'
XPATH_DOWNLINK_VALUE='//*[@id="DC_DLBandwidth_TF"]'
BAND_RESERVATION_VALUE='//*[@id="DC_SlotRes.PartNumber_1"]'
#XPATH_RESULT_PANEL='//div[contains(@class,"Devicehistory")]'
XPATH_ENODE_OPTIONAL_PARAM='//*[@id="DC_PnPStatus_Box_eNodeB Optional Delta Params"]'
XPATH_ENODE_OPTIONAL_PARAM_CONF_VALUE='//*[@id="DC_PnPStatus_Box_eNodeB Optional Conf Params"]'
XPATH_BLACKLIST_RADIO='//*[@id="DC_Grid_Table_Label_Display_Blacklisted Radio Units"][contains(text(),"Blacklisted Radio Units")]'
XPATH_BLACKLIST_TEXT='//*[@id="DC_Grid_Table_Label_Text_Blacklisted Radio Units"]'
XPATH_CATM1_TABLE='//*[@id="DC_CatM1 Sector"]'

XPATH_SECTOR1_OPTIONAL_PARAM='//*[@id="DC_PnPStatus_Box_Sector 1 Optional Delta Params"]/div[2]/div'
XPATH_SAVED_SPID_VALUE='//*[@id="DC_SPIDEnable_ComboBox"]/input'
XPATH_DELTA_PARAM_ICON='//*[@id="DC_CONTENT_LAYOUT_FeatureHeadingLayout"]/div[2]/div/div[1]/div/div[5]/div/a'
#XPATH_DELTA_SPID_VALUE='//*[@id="DC_ProvisionedDataTable_Table"]/div[2]/div[1]/table/tbody/tr/td[2]/div/div'
#XPATH_DELTA_SEARCH_INPUT='//*[@id="DC_Provisioning_Status_Table"]/div[2]/div/div/div[1]/input'
XPATH_DELTA_SEARCH_INPUT='//*[@id="DC_Provisioning_Status_Table"]/div[1]/div[1]/div/table/tbody/tr[2]/td[1]/div/input'

ID_PROVISIONING_APPLY_BUTTON='id=applyFilter'
XPATH_PROVISIONING_SPID_VALUE='//div[contains(text(),"TRUE")]'
#XPATH_PROVISIONING_SPID_SOURCE='//*[@id="DC_Provisioning_Status_Table"]/div[3]/div[1]/table/tbody/tr/td[6]/div/div/div'
XPATH_PROVISIONING_SPID_SOURCE='//*[@id="DC_Provisioning_Status_Table"]/div[2]/div[1]/table/tbody/tr/td[6]/div/div/div'
XPATH_PROVISIONED_SPID_VALUE='//*[@id="DC_ProvisionedDataTable_Table"]/div[2]/div[1]/table/tbody/tr/td[2]/div/div'
XPATH_PROVISIONED_SPID_SOURCE='//*[@id="DC_ProvisionedDataTable_Table"]/div[2]/div[1]/table/tbody/tr/td[3]/div/div'

XPATH_SPID_PNP_PAGE='//*[@id="DC_Grid_Table_Label_Display_X_0005B9 SPID Enable"]'
XPATH_SPID_VALUE_PNP_PAGE='//*[@id="DC_Grid_Table_Label_Text_X_0005B9 SPID Enable"]'

XPATH_SAVED_MIMO_VALUE='//*[@id="DC_X_0005B9_Enable4X4MIMO_ComboBox"]/input'
#XPATH_PROVISIONING_MIMO_VALUE='//*[@id="DC_Provisioning_Status_Table"]/div[3]/div[1]/table/tbody/tr/td[5]/div/div'
XPATH_PROVISIONING_MIMO_VALUE='//*[@id="DC_Provisioning_Status_Table"]/div[2]/div[1]/table/tbody/tr/td[5]/div/div'
#XPATH_PROVISIONING_MIMO_SOURCE='//*[@id="DC_Provisioning_Status_Table"]/div[3]/div[1]/table/tbody/tr/td[6]/div/div/div'
XPATH_PROVISIONING_MIMO_SOURCE='//*[@id="DC_Provisioning_Status_Table"]/div[2]/div[1]/table/tbody/tr/td[6]/div/div/div'
XPATH_PROVISIONED_MIMO_VALUE='//*[@id="DC_ProvisionedDataTable_Table"]/div[2]/div[1]/table/tbody/tr/td[2]/div/div'
XPATH_PROVISIONED_MIMO_SOURCE='//*[@id="DC_ProvisionedDataTable_Table"]/div[2]/div[1]/table/tbody/tr/td[3]/div/div'
XPATH_MIMO_PNP_STATUS='//div[@id="DC_Grid_Table_Label_Display_X_0005B9 Enable 4X4 MIMO"]'
XPATH_MIMO_VALUE_PNP_STATUS='//div[@id="DC_Grid_Table_Label_Text_X_0005B9 Enable 4X4 MIMO"]'

XPATH_DMS_OVERRIDEN_MENU = "//*[@id='DC_Menu_configuration_ID']/div[1]"
ID_DASHBOARD_DMSOVERRIDEN_SUMMARY ='id=DC_DMS Overridden Params_Header'
XPATH_DASHBOARD_DMSOVERRIDEN_GNBCONFIG = "//span[contains(text(),'gNB Configuration')]"

gName_value='//*[contains(@id,"gNBName_TF")]'

XPATH_SAVED_ENDCEnable_VALUE='//*[@id="DC_ENDCEnable_ComboBox"]/input'
XPATH_PROVISIONING_ENDCEnable_VALUE='//div[contains(text(),"TRUE")]'
XPATH_PROVISIONING_ENDCEnable_SOURCE='//*[@id="DC_Provisioning_Status_Table"]/div[3]/div[1]/table/tbody/tr/td[6]/div/div/div'
XPATH_PROVISIONED_ENDCEnable_VALUE='//*[@id="DC_ProvisionedDataTable_Table"]/div[2]/div[1]/table/tbody/tr/td[2]/div/div'
XPATH_PROVISIONED_ENDCEnable_SOURCE='//*[@id="DC_ProvisionedDataTable_Table"]/div[2]/div[1]/table/tbody/tr/td[3]/div/div'
XPATH_ENDCEnable_PNP_PAGE='//*[@id="DC_Grid_Table_Label_Display_X_0005B9 ENDC Enable"]'
XPATH_ENDCEnable_VALUE_PNP_PAGE='//*[@id="DC_Grid_Table_Label_Text_X_0005B9 ENDC Enable"]'
XPATH_GUIOVERRIDE_DELETE_BUTTON='//*[@id="scalar-delete-layout-label"]'

XPATH_S1SIG_SERVER_LIST='//*[@id="DC_S1SigServerList_Value_TextArea"]'
XPATH_DC_SecGWServer_TF='//*[@id="DC_SecGWServer_TF"]'

XPATH_FILE_TYPE='//*[@id="DC_Action_Delete_Button"]'
XPATH_ADD_FILE_ENCH_TYPE='//*[@id="DC_Add_New_FileTrnsfrEnh_Button"]'
XPATH_FILE_ENH_ADD_ALL_FILE_TYPE='//*[@id="DC_FileTrnsfrEnh.FileTypeGUISpecific_1"]/div/div[3]/div'
XPATH_FileEnh_Det_Button='//*[@id="DC_Add_New_FileTrnsfrEnh.FileDet_Button"]'
XPATH_FileTransEnh_index="(//*[@id='DC_FileTrnsfrEnh.FileDet'])[{value}]"
XPATH_FileTransEnh_Name="(//*[@id='FileTrnsfrEnh.FileName']/div[1])[{value}]"
XPATH_FILETransEnh_value="(//*[@id='FileTrnsfrEnh.FileName']/input)[{value}]"
XPATH_START_TIME="(//*[@id='FileTrnsfrEnh.WinStartTime'])[{value}]"
XPATH_WIN_DURATION="(//*[@id='FileTrnsfrEnh.WinDuration'])[{value}]"
XPATH_WIN_INTERVAL="(//*[@id='FileTrnsfrEnh.WinInterval'])[{value}]"
XPATH_TRANSFER_NOW="(//*[@id='FileTrnsfrEnh.TrnsferNow'])[{value}]"
XPATH_TRANSFER_Last_Col="//*[@id='FileTrnsfrEnh.TrnsferNow']"
XPATH_FILETYPE_VALUE='//span[contains(text(),"{value}")]'
XPATH_FILE_TRANSFER_SAVE_BUTTON='//*[@id="DC_FileType_Window_Save"]'
XPATH_ACTIVITY_LOG_SELECET='//*[@id="DC_RP.TransferLogsToController"]/div'
XPATH_ACTIVITY_CHECKBOX='//*[@id="DC_ACTIVITY"]'
XPATH_DELETE_BUTTON='//*[@id="scalar-delete-layout"]/div'
XPATH_FILE_TYPE_LOG_VALUE='//*[@id="DC_ProvisionedDataTable_Table"]/div[2]/div[1]/table/tbody/tr[1]'
XPATH_ENH_FILE_INDEX='//*[@id="DC_FileTrnsfrEnh"]'
XPATH_SERVER_URL='//*[@id="FileTrnsfrEnh.ServerURL"]'
XPATH_ENH_USERNAME='//*[@id="FileTrnsfrEnh.Username"]'
XPATH_ENH_PASSWORD='//*[@id="FileTrnsfrEnh.Password"]'
XPATH_FILE_ENH_DELETE_BUTTON_CONFIRMATION='//*[@id="DC_FileServer_Delete_Window_Ok"]'
XPATH_FILE_TYPE_TABLE='//*[@id="FileTrnsfrEnh.FileDet"]/div/div[3]'
XPATH_FILE_DETAILS_TABLE='//*[@id="DC_FileTrnsfrEnh_Table"]/div[2]/div[1]/table/tbody/tr'