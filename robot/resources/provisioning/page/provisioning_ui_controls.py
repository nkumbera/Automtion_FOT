XPATH_PROVISION_MAIN_MENU = '//div[contains(@class,"v-label-dms-provisioning-menuIcon")]'
XPATH_PROVISION_STATUS_MAIN = '//div[@id="DC_Menu_provisioningStatus_ID"]/div[contains(@class,"sub-menuIcon-menuIcon")]'
XPATH_PROVISION_TEXT_VERIFY_TEMPLATE = '//div[contains(text(),"{}")]'
ID_PROVISIONING_STATUS_HEADER = 'id=DC_Provisioning Status_Header'
DEVICE_PROVISIONING_STATUS = '{dms_device_console}#!mv/provisioningStatus/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
XPATH_PROVISIONING_DELTA_LINK = '//*[contains(text(), "Provisioning Status")]/parent::div/following::div//i[contains(@class, "icon-exclamation-sign")]/following::a'


# Dashboard Provisioning Page
XPATH_PROVISIONED_MENU = "//*[@id='DC_Menu_provisioning_ID']/div[1]"
ID_DASHBOARD_PROVISIONED_DATA_SUMMARY ='id=DC_Provisioned Data_Header'
XPATH_PROVISIONED_DATA_GNBCONFIG = "//div[contains(@id,'gNB Configuration')]"
XPATH_PROVISIONING_STATUS = "//*[@id='DC_Menu_provisioningStatus_ID']/div[1]"
ID_DASHBOARD_PROVISIONING_STATUS_SUMMARY ='id=DC_Provisioning Status_Header'
XPATH_PROVISIONING_STATUS_TABLE = "//div[text()='Name']"
XPATH_PNP_COMPUTE_CELL1_CONF ="//div[@id='DC_PnPStatus_Box_Compute Cell 1 Conf']"
XPATH_PNP_COMPUTE_CELL2_CONF ="//div[@id='DC_PnPStatus_Box_Compute Cell 2 Conf']"
XPATH_PNP_COMPUTE_CELL3_CONF ="//div[@id='DC_PnPStatus_Box_Compute Cell 3 Conf']"
XPATH_PNP_COMPUTE_CELL4_CONF ="//div[@id='DC_PnPStatus_Box_Compute Cell 4 Conf']"
XPATH_PNP_PROVISION_CELL1_CONF ="//div[@id='DC_PnPStatus_Box_Provision Cell 1 Conf']"
XPATH_PNP_PROVISION_CELL2_CONF ="//div[@id='DC_PnPStatus_Box_Provision Cell 2 Conf']"
XPATH_PNP_PROVISION_CELL3_CONF ="//div[@id='DC_PnPStatus_Box_Provision Cell 3 Conf']"
XPATH_PNP_PROVISION_CELL4_CONF ="//div[@id='DC_PnPStatus_Box_Provision Cell 4 Conf']"
XPATH_PNP_COMPUTE_CELL_STATUS = "//div[@id='DC_Grid_Table_Label_Text_Status']"
XPATH_PNP_PROVISION_CELL_STATUS = "//div[@id='DC_Grid_Table_Label_Text_Status']"
XPATH_PNP_CU_CP_Managed_Status = "//div[@id='DC_PnPStatus_Box_CU-CP Managed Status']"
XPATH_PNP_CU_UP_Managed_Status = "//div[@id='DC_PnPStatus_Box_CU-UP Managed Status']"
XPATH_PNP_DU_Managed_Status = "//div[@id='DC_PnPStatus_Box_Device Managed Status']"
XPATH_PNP_Get_CU_CP_Info = "//div[@id='DC_PnPStatus_Box_Get CU-CP Info']"
XPATH_PNP_Get_CU_UP_Info = "//div[@id='DC_PnPStatus_Box_Get CU-UP Info']"
XPATH_PNP_DMS_Flag_For_CU_CP_Activation = "//div[@id='DC_PnPStatus_Box_DMS Flag For CU-CP Activation']"
XPATH_PNP_DMS_Flag_For_CU_UP_Activation = "//div[@id='DC_PnPStatus_Box_DMS Flag For CU-UP Activation']"
XPATH_PNP_Validate_VNF = "//div[@id='DC_PnPStatus_Box_Validate VNF']"
XPATH_PNP_Notification_Subscription = "//div[@id='DC_PnPStatus_Box_Notification Subscription']"
XPATH_PNP_Get_CU_CP_Capability = "//div[@id='DC_PnPStatus_Box_Get CU-CP Capability']"
XPATH_PNP_Get_CU_UP_Capability = "//div[@id='DC_PnPStatus_Box_Get CU-UP Capability']"
XPATH_PNP_Perform_Factory_Reset = "//div[@id='DC_PnPStatus_Box_Perform Factory Reset']"
XPATH_PNP_Perform_Lock_Datastore = "//div[@id='DC_PnPStatus_Box_Lock Datastore']"
XPATH_PNP_Mark_CU_CP_Flag_Activation = "//div[@id='DC_PnPStatus_Box_Mark CU-CP Flag Activation']"
XPATH_PNP_Mark_CU_UP_Flag_Activation = "//div[@id='DC_PnPStatus_Box_Mark CU-UP Flag Activation']"
XPATH_PNP_Pre_Processing_Policy = "//div[@id='DC_PnPStatus_Box_Pre Processing Policy']"
XPATH_PNP_Provision_Pre_Feature_Conf = "//div[@id='DC_PnPStatus_Box_Provision Pre Feature Conf']"
XPATH_PNP_Provision_Min_Mandatory_Conf = "//div[@id='DC_PnPStatus_Box_Provision Min Mandatory Conf']"
XPATH_PNP_Provision_Feature_Conf = "//div[@id='DC_PnPStatus_Box_Provision Feature Conf']"
XPATH_PNP_Post_Processing_Policy = "//div[@id='DC_PnPStatus_Box_Post Processing Policy']"
XPATH_PNP_Copy_Config = "//div[@id='DC_PnPStatus_Box_Copy Config']"
XPATH_PNP_Set_DMS_Flag_for_Activation_Status = "//div[@id='DC_PnPStatus_Box_Set DMS Flag for Activation Status']"
XPATH_PNP_DMS_Flag_for_Activation_Status = "//div[@id='DC_PnPStatus_Box_DMS Flag for Activation Status']"
XPATH_PNP_Unlock_Datastore = "//div[@id='DC_PnPStatus_Box_Unlock Datastore']"
XPATH_PNP_Check_Delta_Exist = "//div[@id='DC_PnPStatus_Box_Check Delta Exist']"
XPATH_PNP_Get_Session_Id = "//div[@id='DC_PnPStatus_Box_Get Session Id']"
XPATH_PNP_Provision_Delta_Pre_Feature_Conf = "//div[@id='DC_PnPStatus_Box_Provision Delta Pre Feature Conf']"
XPATH_PNP_Provision_Delta_Min_Mandatory_Conf = "//div[@id='DC_PnPStatus_Box_Provision Delta Min Mandatory Conf']"
XPATH_PNP_Check_Delta_Task = "//div[@id='DC_PnPStatus_Box_Check Delta Task']"
XPATH_PNP_Get_Cell_1_Delta_Conf = "//div[@id='DC_PnPStatus_Box_Get Cell 1 Delta Conf']"
XPATH_PNP_Provision_Cell_1_Delta_Conf = "//div[@id='DC_PnPStatus_Box_Provision Cell 1 Delta Conf']"
XPATH_PNP_Provision_Delta_Feature_Conf = "//div[@id='DC_PnPStatus_Box_Provision Delta Feature Conf']"
XPATH_PNP_PROVISION_TEXT_STATUS = "//div[@id='DC_Grid_Table_Label_Text_Status']"
#XPATH_TEMP_REPLAN_BUTTON = "//body/div[@id='deviceconsole-1831658943']/div[1]/div[2]/div[4]/div[1]/div[1]/div[1]/div[1]/div[1]/div[5]/div[1]/div[7]/div[1]/div[1]/div[1]"
XPATH_TEMP_REPLAN_BUTTON = '//*[@id="REPLAN"]/div/div'
XPATH_TEMP_REPLAN_OK = "//span[contains(text(),'Ok')]"
XPATH_TEMP_DMS_DC_OVERRIDDEN_PAGE = "//body/div[@id='deviceconsole-1831658943']/div[1]/div[2]/div[2]/div[1]/div[1]/div[3]/div[1]"
XPATH_TEMP_DMS_DC_CUUP_OVERRIDDEN_PAGE_CELL1 = "//tbody/tr[1]/td[2]/div[1]/div[1]/div[1]"
ID_TEMP_SEARCH_INPUT = 'id=DC_Search_TextField'
ID_TEMP_SEARCH_BUTTON = 'id=DC_Search_Button'
XPATH_TEMP_DC_CELLLOCALID = "//input[@id='DC_cellLocalId_TF']"
XPATH_TEMP_DC_OVERRIDE_SAVE = "//button[@id='DC_Device_Config_Save_Button']"
XPATH_TEMP_DC_OVERRIDE_DELETE = "//div[@id='scalar-delete-layout-label']"
#DEVICE_OVERWRRIDDEN_PARAMETER_DU = '{dms_device_console}#!mv/configuration/?srchKey=MAC&id={device_macid}&dt=ONECELL5GDU&context=null'
#DU_SETTINGS_FILE_CELL1_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_cell1.xml'
DU_SETTINGS_FILE_CELL1_LOCATION='\\robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_cell1.xml'

DU_SETTINGS_FILE_CELL2_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_cell2.xml'
DU_SETTINGS_FILE_CELL3_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_cell3.xml'
DU_SETTINGS_FILE_CELL4_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_cell4.xml'
DU_SETTINGS_FILE_CELL12_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_cell12.xml'
DU_SETTINGS_FILE_CELL13_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_cell13.xml'
DU_SETTINGS_FILE_CELL14_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_cell14.xml'
DU_SETTINGS_FILE_CELL23_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_cell23.xml'
DU_SETTINGS_FILE_CELL24_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_cell24.xml'
DU_SETTINGS_FILE_CELL34_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_cell34.xml'
DU_SETTINGS_FILE_CELL123_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_cell123.xml'
DU_SETTINGS_FILE_CELL124_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_cell124.xml'
DU_SETTINGS_FILE_CELL134_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_cell134.xml'
DU_SETTINGS_FILE_CELL234_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_cell234.xml'
DU_SETTINGS_FILE_CELL1234_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_cell1234.xml'
DU_SETTINGS_FILE_CC1_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_CC1.xml'
DU_SETTINGS_FILE_CC2_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_CC2.xml'
DU_SETTINGS_FILE_CC3_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_CC3.xml'
DU_SETTINGS_FILE_CC4_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_CC4.xml'
DU_SETTINGS_FILE_CC12_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_CC12.xml'
DU_SETTINGS_FILE_CC13_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_CC13.xml'
DU_SETTINGS_FILE_CC14_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_CC14.xml'
DU_SETTINGS_FILE_CC23_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_CC23.xml'
DU_SETTINGS_FILE_CC24_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_CC24.xml'
DU_SETTINGS_FILE_CC34_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_CC34.xml'
DU_SETTINGS_FILE_CC123_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_CC123.xml'
DU_SETTINGS_FILE_CC124_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_CC124.xml'
DU_SETTINGS_FILE_CC134_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_CC134.xml'
DU_SETTINGS_FILE_CC234_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GDU_mj_du_CC234.xml'
CUCP_SSETTINGS_FILE_LOCATION='\\robot\service_setting_files\ServiceSetting_ONECELL5GCU_CP_mj_cucp.xml'
CUCP_SSETTINGS_FILE186_LOCATION='robot\service_setting_files\ServiceSetting_ONECELL5GCU_CP_mj_cucp_186.xml'
CUCP_SSETTINGS_FILE187_LOCATION='\\robot\service_setting_files\ServiceSetting_ONECELL5GCU_CP_mj_cucp_187.xml'
CUCP_SSETTINGS_FILE1523_LOCATION='\\robot\service_setting_files\ServiceSetting_ONECELL5GCU_CP_mj_cucp_1523.xml'
CUUP_SSETTINGS_FILE_LOCATION='\\robot\service_setting_files\ServiceSetting_ONECELL5GCU_UP_mj_cuup.xml'


XPATH_MIN_MAND_BOX_CLICK='//*[@id="DC_PnPStatus_Box_Provision Min Mandatory Conf"]/div[2]/div'
XPATH_MIn_BOX_Status='//*[@id="DC_PnpStatus_PnpReport_Provision Min Mandatory Conf"]/div/div/div[2]/div/div/div/div[1]/div/div[2]'

XPATH_PNP_TEXT='//*[@id="DC_Wizard_Steps_Bar"]/div/div/div[1]/div/div/div/div[3]'
XAPTH_VES_PROVISIONED_DATA='//*[@id="DC_VES Collector Configuration"]'
XPATH_WHITELIST_TABLE='//*[@id="WhiteList RPs"]'
XPATH_WHITELIST_DELETE_BUTTON='//*[@id="RP_Whitelist_Vlyout"]/div[1]/div/button'
XPATH_DELTA_PROVISION_STATUS='//*[@id="DC_Provisioning_Status_Table"]/div[2]/div[1]/table/tbody/tr/td[1]'

XPATH_PNP_MIN_MANDATORY_BOX = '//*[@id="DC_PnPStatus_Box_Provision Min Mandatory Conf"]/div[2]/div'
XPATH_STATUS_PNP = '//*[@id="DC_Grid_Table_Label_Text_Status"]'
VNF_CU_PNP_PAGE = '{dms_device_console}#!mv/devicepnp/?srchKey=MAC&id={device_macid}&dt=ONECELL5GCU&context=null'
VNF_DU_PNP_PAGE = '{dms_device_console}#!mv/devicepnp/?srchKey=MAC&id={device_macid}&dt=ONECELL5GDU&context=null'