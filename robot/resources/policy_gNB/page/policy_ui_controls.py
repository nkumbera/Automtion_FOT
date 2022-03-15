DEVICE_POLICY_PAGE = '{dms_device_console}#!mv/deviceaction/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
VNF_CU_POLICY_PAGE = '{dms_device_console}#!mv/deviceaction/?srchKey=MAC&id={device_macid}&dt=ONECELL5GCU&context=null'
VNF_DU_POLICY_PAGE = '{dms_device_console}#!mv/deviceaction/?srchKey=MAC&id={device_macid}&dt=ONECELL5GDU&context=null'
ID_DP_HEADER="id=DC_Device Policy_Header"
ID_VNF_POLICY_HEADER='//div[@id="DC_Policy_Header"]'
ID_DP_ADD_NEW_BUTTON='id=addNewButton'
ID_DP_ADD_POLICY_BTN="ID=addButton"
ID_DP_POLICY_NAME='id=operationName'
XPATH_DP_EXECUTION_ONDEMAND_RADIOBTN="//label[text()='On Demand']"
XPATH_DP_EXECUTION_EVENT_TYPE_RADIOBTN="//label[text()='Event Type']"
XPATH_DP_EXECUTION_SCHEDULED_RADIOBTN="//label[text()='Scheduled']"
XPATH_DP_DEVICEOPERATION_ARROWBTN="//div[@id='deviceOperations']/div"
XPATH_DP_DEVICEOPERATION_SPV="//span[text()='SetParameterValues']"
XPATH_DP_DEVICEOPERATION_GPA="//span[text()='GetParameterAttributes']"
XPATH_DP_DEVICEOPERATION_ADD_OBJECT="//span[text()='AddObject']"
XPATH_DP_DEVICEOPERATION_CONFIRMBTN="//span[text()='Confirm']"
XPATH_DP_DEVICEOPERATION_SPA="//span[text()='SetParameterAttributes']"
XPATH_DP_BOOTSTRAP_CHECKBOX="//label[text()='Bootstrap']"
XPATH_DP_BOOT_CHECKBOX="//label[text()='Boot']"
XPATH_DP_PERIODIC_CHECKBOX="//label[text()='Periodic Inform']"
XPATH_DP_ALL_CHECKBOX="//label[text()='All']"
XPATH_DP_DEVICE_lIST="//span[text()='Device']"
ID_DP_SAVE_AND_EXECUTE_BTN="id=saveExecuteHandler"
#XPATH_DP_DEVICE_lIST="(//div[contains(@id,'gwt-uid')])[8]"
XPATH_DP_SCHEDULED_CALENDER="//div[@id='startTime']/button"
XPATH_DP_SCHEDULED_SELECT_DATE="//span[contains(@class,'today')]/../following-sibling::td/span"
XPATH_DP_GPV_DEVICEINFO_PARAM_HEADER="//span[text()='DeviceInfo']"
XPATH_DP_GPA_TIME_HEADER="//span[text()='Time']"
XPATH_DP_GPA_TIME_SUB="//span[text()='Status - (r)(x)']"
XPATH_DP_GPA_FAULT_HEADER="//span[text()='FaultMgmt']"
XPATH_DP_GPA_FAULT_ATTR1="//span[text()='CurrentAlarmNumberOfEntries - (r)(x)']"
XPATH_DP_GPA_FAULT_ATTR2="//span[text()='HistoryEventNumberOfEntries - (r)(x)']"
XPATH_DP_GPV_DEVICEINFO_PARAM_SUB1="//span[text()='DeviceStatus - (r)']"
XPATH_DP_GPV_DEVICEINFO_PARAM_SUB2="//span[text()='SoftwareVersion - (r)']"
XPATH_DP_GPV_DEVICEINFO_PARAM_SUB3="//span[text()='HardwareVersion - (r)']"
XPATH_DP_GPV_SERVICES_PARAM_HEADER1="//span[text()='Services']"
XPATH_DP_GPV_SERVICES_PARAM_SUB1="//span[text()='X_0005B9_FNEnable - (rw)']"
XPATH_DP_GPV_SERVICES_PARAM_SUB2="//span[text()='X_0005B9_nRrc4CatM1 - (rw)']"
XPATH_DP_SUCCESS_MSG="//div[text()='{}']/../../td[7]/div[text()='Success']"
XPATH_DP_DELETE_POLICY="//div[text()='{}']/../../td[9]/div/div/div/div[2]"
XPATH_DP_EXECUTE_POLICY="//div[text()='{}']/../../td[9]/div/div/div/div[4]"
ID_DP_SAVE_BUTTON="id=saveHandler"
XPATH_DP_SPV_FN_TEXTBOX="//div[contains(text(),'FN')]/../../../td[3]/div/input"
XPATH_DP_SPV_NR_TEXTBOX="//div[contains(text(),'nR')]/../../../td[3]/div/input"
ID_DP_COLLAPSEALL='id=DC_PolicyExpandCollapse'
XPATH_SAVE_BUTTON="//span[text()='Save']"
XPATH_DP_PERIODIC_DRPDOWN="//div[@id='deviceaction_uservalueComboBox']/div"
XPATH_DP_PERIODIC_VALUE="//span[text()='2 - Active Notification']"
XPATH_DP_COLLAPSE_DEVICE="//span[text()='Device Model']/../.."
XPATH_DP_FAULTMGMT_HEADER="//span[text()='FaultMgmt']"
XPATH_DP_FAULTMGMT_HISTORY_HEADER="//span[text()='HistoryEvent.{i}']"
XPATH_DELETE_MSG_NOTIFICATION="//div[text()='Deleted Policy successfully.']"
XPATH_DELETE_CONFIRM_BTN="id=NC_ClusterManagement_Confirm"
XPATH_CHECKBOX = '//*[@id="DC_Reports_ChkBox_"]'
XPATH_EXPORT = '//button[@id="DC_DeviceLicense_ExportButton"]'
XPATH_POLICY_EXPORT_MSG = '//*[@id="CONTENT_LAYOUT"]/div/div[3]/div[1]/div/div/div/div'
XPATH_CLONE_BUTTON = '//*[@id="DC_Policy_Events_FilterTable"]/div[3]/div[1]/table/tbody/tr[1]/td[9]/div/div/div/div[3]/button'
XPATH_POLICY_CLONE_NAME = '//input[@id="DC_Clone_Policy_Name"]'
XPATH_OK_BUTTON = '//span[contains(text(),"Ok")]'
XPATH_CLONE_SUCCESS = '//body/div[@id="deviceconsole-1831658943"]/div[1]/div[2]/div[4]/div[1]/div[1]/div[3]/div[1]/div[1]/div[1]/div[1]'
XPATH_DELETE_POLICY = '//*[@id="DC_Policy_Events_FilterTable"]/div[3]/div[1]/table/tbody/tr/td[9]/div/div/div/div[2]/button'
XPATH_CONFIRM_BUTTON = '//span[contains(text(),"Confirm")]'
XPATH_DEL = '//body[1]/div[1]/div[1]/div[2]/div[4]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[3]/div[1]/div[2]/div[1]/table[1]/tbody[1]/tr[1]/td[9]/div[1]/div[1]/div[1]/div[2]/button[1]'
XPATH_DELETE_SUCCESS = '//body/div[@id="deviceconsole-1831658943"]/div[1]/div[2]/div[4]/div[1]/div[1]/div[3]/div[1]/div[1]'
XPATH_IMPORT_BUTTON = '//*[@id="DC_DeviceLicense_ImportButton"]'
XPATH_CHOOSE_FILE = '//*[@id="DC_Policy_Import_Upload"]'
XPATH_OK = '//span[contains(text(),"Ok")]'
XPATH_OPERATION_HISTORY = '//img[@id="DC_Operation_History_Image"]'
XPATH_POLICY_IMPORT_SUCCESS = '//body/div[@id="deviceconsole-1831658943"]/div[1]/div[2]/div[4]/div[1]/div[1]/div[3]/div[1]/div[1]/div[1]/div[1]'
XPATH_DETAILS = '//*[@id="DC_Operation_History_Table"]/div[3]/div[1]/table/tbody/tr[1]/td[6]/div/div/div/div/div/div[5]/button'
XPATH_INFO = '//*[@id="DC_Operation_History_Tabel"]/div[2]/div[1]/table/tbody/tr[2]/td[5]'
XPATH_MORE_DETAILS = '//tbody/tr[1]/td[6]/div[1]/div[1]/div[1]/div[1]/div[1]/div[5]/button[1]'
#XPATH_OK_HISTORY = '//span[contains(text(),'Ok')]'
XPATH_ENTER_POLICY = '//*[@id="DC_Policy_Events_FilterTable"]/div[2]/div/div/div[2]/input'
XPATH_ENTER_POLCIYNAME = '//tbody/tr[2]/td[2]/div[1]/input[1]'
XPATH_DELETE = '//button[@id="DC_Policy_DeleteButton20068"]'
POLICY_NAME = 'SPV_M3'
POLICY_NAME_CLONE = 'SPV_M3_clone'
APPLY_FILTER_POLICY = '//span[contains(text(),"Apply Filter")]'
OPERATION_TYPE = 'Device Policy'
XPATH_OPERATION_TYPE_INPUT = '//*[@id="DC_Operation_History_Table"]/div[2]/div/div/div[5]/input'
XPATH_APPLY_FILTER_OH = '//button[@id="applyFilter"]'
XPATH_APPLY_FILTER_2 = '//span[contains(text(),"Apply Filter")]'
POLICY_NAME_2 = 'Policy_Event1'
XPATH_PAGE_BEGIN='//*[@id="DC_CONTENT_LAYOUT_FeatureHeadingLayout"]'

XPATH_START_TIME_policy='//*[@id="startTime"]/input'
XPATH_VALDIN_LIC='/html/body/div[3]'
XPATH_OPERATION_NAME = '//tbody/tr[2]/td[5]/div[1]/input[1]'
XPATH_POLICY_NAME = '//tbody/tr[2]/td[2]/div[1]/input[1]'
XPATH_POLICY_NAME1 = '//tbody/tr[2]/td[2]/div[1]/input[1]'
XPATH_DELETE = '//body[1]/div[1]/div[1]/div[2]/div[4]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[3]/div[1]/div[2]/div[1]/table[1]/tbody[1]/tr[1]/td[9]/div[1]/div[1]/div[1]/div[2]/button[1]'
XPATH_DELETE_MSG = '//body[1]/div[1]/div[1]/div[2]/div[4]/div[1]/div[1]/div[3]/div[1]/div[1]/div[1]/div[1]'
XPATH_CLONE = '//body[1]/div[1]/div[1]/div[2]/div[4]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[3]/div[1]/div[2]/div[1]/table[1]/tbody[1]/tr[1]/td[9]/div[1]/div[1]/div[1]/div[3]/button[1]'
XPATH_POLICY_IMPORT_MSG = '//body[1]/div[1]/div[1]/div[2]/div[4]/div[1]/div[1]/div[3]/div[1]/div[1]'

CP_POLICY1 = 'test_2'
CP_POLICY2 = 'test_Get'
UP_POLICY1 = 'Get_UP'
UP_POLICY2 = 'test_uesrname'
DU_POLICY1 = 'test2'
DU_POLICY2 = 'test3'
XPATH_POLICY_IMPORT_BUTTON = '//*[@id="DC_DeviceLicense_ImportButton"]'


Policy_Name_field='//*[@id="DC_Policy_Events_FilterTable"]/div[1]/div[1]/div/table/tbody/tr[2]/td[2]/div/input'
Policy_search='//*[@id="DC_Filter_Search_Container"]'
Cert_policy_name='EnableAutomaticRPKeyCertsDownload_SPV'
Cert_policy_name_GPV='EnableAutomaticRPKeyCertsDownload_GPV'
XPATH_Cert_value="//span[text()='EnableAutomaticRPKeyCertsDownload - (rw)']"
XPATH_Security_tree="//span[text()='Security']"
XPATH_Factory_CA_SERVER="//span[text()='X_0005B9_FactoryCAServer']"
XPATH_USERFIELD_VALUE='//*[@id="deviceaction_uservaluetextfield"]'
XPATH_DP_DEVICEOPERATION_GPV="//span[text()='GetParameterValues']"
POLICY_SEARCH_VALUE='EnableAutomaticRP'

XPATH_DP_DEVICEOPERATION_GCD="//span[text()='Get Configured Data']"
OnDemand_policy_name_GCD='GCD_policy'
POLICY_SEARCH_VALUE_GCD='vesListenerUrl'
XPATH_DP_DEVICE_lIST_Model="//span[text()='Model Parameters']"
XPATH_DP_DEVICE_lIST_VesListener="//span[text()='commscope-ves-listener-info:VesListenerInfo - (rwp)']"
XPATH_DP_DEVICE_LIST_PARAM_VESURL="//span[text()='VesListenerUrl']"

XPATH_DP_DEVICEOPERATION_GOD="//span[text()='Get Operational Data']"
OnDemand_policy_name_GOD='GOP_policy'
POLICY_SEARCH_VALUE_GOD='vesListenerUrl'

Schedule_policy_name='Schedule_policy'
XPATH_DP_DEVICEOPERATION_Editconfig="//span[text()='Edit Configuration']"
XPATH_DP_EXECUTION_SCHEDULE_RADIOBTN="//label[text()='Scheduled']"
XPATH_3GPP="//span[text()='_3gpp-common-managed-element:ManagedElement[id] - (rwp)']"
POLICY_SEARCH_VALUE_Schedule='administrativeState'
XPATH_PerfMetric="//span[text()='PerfMetricJob[id] - (rw)']"
XPATH_ATTRIBUTE="//span[text()='attributes - (rw)']"
XPATH_ADMNIN_STATE="//span[text()='administrativeState - (rw)']"
#XPATH_Managed_element_index='//*[@id="1"]/div[3]'
XPATH_Managed_element_index="(//input[@id='id'])[1]"
XPATH_Perf_metrics_job="(//input[@id='id'])[2]"
XPATH_admin_new_value='//*[@id="deviceaction_uservaluetextfield"]'
XPATH_SAVE_POLICY='//*[@id="saveHandler"]'

EventType_policy_name_GOD='GOD_Eventtype_Policy'
XPATH_DP_EXECUTION_EventType_RADIOBTN="//label[text()='Event Type']"
XPATH_REBOOT='(//span[contains(@class,"event-type-checkBox-margin")])[2]'
XPATH_RESET='(//span[contains(@class,"event-type-checkBox-margin")])[1]'

EnableBanner_policy_name_GPV='EnableBanner_GPV'
POLICY_ENABLE_SEARCH_VALUE='EnableBanner'
XPATH_ENABLE_BANNER = "//span[text()='X_0005B9_FactoryCAServer']"
XPATH_DeviceInfo_tree="//span[text()='DeviceInfo']"
XPATH_EnableBanner_value = "//span[text()='X_0005B9_EnableBanner - (rw)']"
ID_DP_SAVE_EXECUTE_BUTTON = 'id=saveExecuteHandler'
XPATH_DP_SEARCH_POLICY = "//*[@id='DC_Policy_Events_FilterTable']/div[1]/div[1]/div/table/tbody/tr[2]/td[2]/div/input"
ID_DP_APPLY_SEARCH = 'id=applyFilter'
XPATH_POLICY_RESPONSE_ROW = "//div[contains(text(),'Policy Response')]"
XPATH_HISTORY_DETAIL = "//*[@id='DC_DHDetails_Window_Content']/div/div/div/div[2]/div/div"

XPATH_ACTIVE_PARAM = '//span[contains(text(),"active - (rw)")]'
XPATH_ADD_PARAM = '//*[@id="addButton"]'
XPATH_ORAN_AGGREGATION = '//span[contains(text(),"o-ran-aggregation-base:aggregated-o-ru - (rw)")]'
XPATH_RU_INSTANCE = '//span[contains(text(),"aggregation[ru-instance] - (rw)")]'
XPATH_ORAN_AGG_UPLANE = '//span[contains(text(),"o-ran-agg-uplane-conf:uplane-conf-model - (rw)")]'
XPATH_USER_PLANE = '//span[contains(text(),"user-plane-configuration - (rw)")]'
XPATH_TX_CARRIER = '//span[contains(text(),"tx-array-carriers[name] - (rw)")]'
XPATH_NEWVALUE_TEXT = '//*[@id="deviceaction_uservaluetextfield"]'
XPATH_INPUT_RUINSTANCE = '//input[@id="ru-instance"]'
XPATH_INPUT_NAME1 = '//*[@id="name"]'
XPATH_SAVE_EXECUTE = '//span[contains(text(),"Save & Execute")]'
XPATH_CLICK_CHECKBOX1 = '//tbody/tr[1]/td[1]/div[1]/span[1]/label[1]'
XPATH_CELL_STATE_INACTIVE = '//*[@id="DUCellDetailsInuseView"]/div'