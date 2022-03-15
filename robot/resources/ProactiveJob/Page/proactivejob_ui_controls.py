XPATH_PROACTIVEJOB_MENU = "//div[@id='ppj']"
#XPATH_NAME_FILTER = '//*[@id="NC_PProvisiong_FilterTable"]/div[2]/div/div/div[1]/input'
XPATH_NAME_FILTER='//*[@id="NC_PProvisiong_FilterTable"]/div[1]/div[1]/div/table/tbody/tr[2]/td[1]/div/input'
XPATH_APPLY_FILTER_device = "//span[contains(text(),'Apply Filter')]"
CUCP_FRJOB = 'CS_ONECELL_CU-CP_ActivationRecoveryJob'
CUUP_FRJOB = 'CS_ONECELL_CU-UP_ActivationRecoveryJob'
DU_FRJOB = 'CS_ONECELL_DU_ActivationRecoveryJob'
XPATH_DEVICETYPE = "//div[contains(text(),'Device Types')]"
XPATH_EDITJOB = "//NC_ProProvisioning_Edit_Action_Button"
ID_EDIT_BUTTON = 'id=NC_ProProvisioning_Edit_Action_Button'
XPATH_FRJOBName = "//body[1]/div[1]/div[1]/div[2]/div[3]/div[2]/div[2]/div[1]/div[1]/div[1]/div[3]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/table[1]/tbody[1]/tr[1]/td[3]/div[1]"
XPATH_FROpType = "//*[@id='NC_PProvisiong_PPWindow_OperationType']/input"
XPATH_HOME_DEVICE_DROPDOWN_1 = "//*[@id='NC_PProvisiong_PPWindow_OperationType']/input"
OperationType = "Proactive Recovery"
JobType = "Scheduled"
XPATH_FRJobType = "//label[contains(text(),'Scheduled')]"
XPATH_FRJobExecFrequency = "//*[@id='NC_PPJ_Frequency']/input"
JobExecFrequency = "Hourly"
XPATH_FRJobFrequencyHours = "//*[@id='NC_PPJ_Hour_CB']/input"
JobFrequencyHours = '2'
XPATH_FRJobFrequencyMinutes = "//*[@id='NC_PPJ_Minute_CB']/input"
JobFrequencyMinutes = '00'
XPATH_FRDeviceType = "//body[1]/div[1]/div[1]/div[2]/div[3]/div[2]/div[2]/div[1]/div[1]/div[1]/div[3]/div[1]/div[8]/div[1]/div[1]/div[1]/div[1]/div[3]/div[1]/div[1]"
CUCP_DeviceType = "0005B9-CS_ONECELL_CU-CP"
CUUP_DeviceType = "0005B9-CS_ONECELL_CU-UP"
DU_DeviceType = "0005B9-CS_ONECELL_DU"
XPATH_DeviceSelection = "//label[contains(text(),'Entire Network')]"
Device_Selection_Criterion = "Entire Network"
XPATH_FRCriterion = "//body[1]/div[1]/div[1]/div[2]/div[3]/div[2]/div[2]/div[1]/div[1]/div[1]/div[3]/div[1]/div[8]/div[1]/div[1]/div[3]/div[1]"
XPATH_JobState_Mouse_Hover = "//tbody/tr[1]/td[6]/div[1]/div[1]/span[1]/img[1]"
XPATH_BACK_BUUTON = "//body[1]/div[1]/div[1]/div[2]/div[3]/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[3]/button[1]/span[1]"
XPATH_CANCEL_BUTTON = "//span[contains(text(),'Cancel')]"
XPATH_SAVE_BUTTON = "//span[contains(text(),'Save')]"
XPATH_CONFIRM_BUTTON = "//span[contains(text(),'Confirm')]"
helpText = "Enabled"
#XPATH_CompFail = "//body[1]/div[1]/div[1]/div[2]/div[3]/div[2]/div[2]/div[1]/div[1]/div[1]/div[3]/div[1]/div[8]/div[1]/div[1]/div[3]/div[1]/div[3]/span[1]/label[1]"
XPATH_CompFail = "//*[@id='ComputationFailure']"
#XPATH_CompFail = 'id=ComputationFailure'
CompFail = "Computation Failure"
ValFail = "Validation Failure"
ProvFail = "Provisioning Failure"
XPATH_ValFail = "//*[@id='ValidationFailure']"
XPATH_ProvFail = "//*[@id='ProvisioningFailure']"
XPATH_License = "//div[contains(text(),'Using Evaluation License of: Vaadin Charts 2')]"
XPATH_FR = "//body[1]/div[1]/div[1]/div[2]/div[3]/div[2]/div[2]/div[1]/div[1]/div[1]/div[3]/div[1]/div[8]/div[1]/div[1]/div[3]/div[1]/div[1]/div[1]"
#XPATH_END_OF_PAGE = '//*[@id="DC_Menu_Content_Get_Menu_Content_Page"]/div[2]/div/div[1]/div/div[3]/div/div[11]/div/div'
#XPATH_END_OF_PAGE = '//*[@id="DC_Menu_Content_Get_Menu_Content_Page"]'
#XPATH_HOUR_SELECTION = "//body[1]/div[1]/div[1]/div[2]/div[3]/div[2]/div[2]/div[1]/div[1]/div[1]/div[3]/div[1]/div[6]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[3]/div[1]/div[1]"
#XPATH_HOUR_SELECTOR = "//*[@id='NC_PPJ_Hour_CB']"
#XPATH_MINUTE_SELECTOR = "//*[@id='NC_PPJ_Minute_CB']"
XPATH_HOUR_SELECTOR = "//body[1]/div[1]/div[1]/div[2]/div[3]/div[2]/div[2]/div[1]/div[1]/div[1]/div[3]/div[1]/div[6]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[3]/div[1]/div[1]"
XPATH_MINUTE_SELECTOR = "//body[1]/div[1]/div[1]/div[2]/div[3]/div[2]/div[2]/div[1]/div[1]/div[1]/div[3]/div[1]/div[6]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[7]/div[1]/div[1]/div[1]"
HOUR_SELECTION = "//span[contains(text(),'0')]"
MINUTE_SELCETION = "//span[contains(text(),'30')]"


XPATH_ADD_BUTTON_PROACTIVE_JOB='//*[@id="NC_PProvisiong_ADDNew"]'
Network_Operation_type='Network Related Replan'
Device_Operation_type='Device Related Replan'
Replan_job_name_endby='Replan_proactive_job_endbydate'
ID_PROACTIVE_STATUS_HEADER='//*[@id="DC_Menu_Content_Get_Menu_Content_Page"]/div[1]/div/div'
XPATH_INPUT_JOB_NAME='//*[@id="NC_PProvisiong_FilterTable"]/div[1]/div[1]/div/table/tbody/tr[2]/td[1]/div/input'
XPATH_APPLY_FILTER_procative_job='//*[@id="NC_PProvisiong_ApplyFilter"]'

XAPTH_Job_Name='//*[@id="NC_PProvisiong_PPWindow_Name"]'
#XPATH_JOB_STATE='//*[contains(@class, "v-radiobutton")]/label[contains(text(),"ENABLED")]'
#XPATH_JOB_STATE='//*[contains(@class, "v-tooltip-text")]/label[contains(text(),"Enabled")]'
#XPATH_JOB_STATE='//*[@id="NC_PProvisiong_PPWindow_JobState"]'
XPATH_JOB_STATE='//*[@id="NC_PProvisiong_PPWindow_JobState"]/span[1]'
#XPATH_JOB_STATE="//div[contains(@class, 'v-tooltip-text') and  contains(text(),'Enabled')]"
#XPATH_JOB_STATE="//div[contains(@class, 'v-tooltip-text')]"
XPATH_OPERATION_TYPE='//*[@id="NC_PProvisiong_PPWindow_OperationType"]/input'
XPATH_JOBTYPE='//*[@id="NC_PPJ_JobType"]/span[1]'
#XPATH_DEVICE_TYPE='//*[contains(text(), "Cntrl")]'
XPATH_DEVICE_TYPE_CUCP='//label[contains(text(),"0005B9-CS_ONECELL_CU-CP")]'
#XPATH_DEVICE_TYPE_pro='/html[1]/body[1]/div[1]/div[1]/div[2]/div[3]/div[2]/div[2]/div[1]/div[1]/div[1]/div[3]/div[1]/div[9]/div[1]/div[1]/div[2]/div[1]/span[3]/label[1]'
XPATH_DEVICE_CRITERIA_ALL='//*[@id="NC_PProvisiong_PPWindow_DeviceCriteria"]'
XAPTH_DEVICE_CRITERIA='//*[@id="NC_PProvisiong_PPWindow_DeviceCriteria"]/span[3]'
XPATH_PROACTIVE_SAVE='//*[@id="NC_Proactive_Save"]'
XPATH_END_DATE='//*[@id="NC_PPJ_EndBy_Option"]/span'
XPATH_START_TIME='//*[@id="NC_PPJ_JobSchedule_StartDate"]/input'
XPATH_ADD_DEVICE_BUTTON='//*[@id="NC_Add_AvailableDevices_Btn"]'
XPATH_PATH_MACID_INPUT='//*[@id="NC_AvailablePPJDevice_Table"]/div[1]/div[1]/div/table/tbody/tr[2]/td[2]/div/input'
#XPATH_APPLY_FILTER='//*[@id="ppj-apply-filter"]'
XPATH_APPLY_FILTER_PROACTIVE_PAGE='//*[@id="NC_PProvisiong_ApplyFilter"]'
#XPATH_SELECT_DEVICE='//*[@id="NC_AvailablePPJDevice_Table"]/div[3]/div[1]/table/tbody/tr/td[1]/div'
XPATH_SELECT_DEVICE='//*[@id="NC_AvailablePPJDevice_Table"]/div[2]/div[1]/table/tbody/tr[1]/td[1]/div'
#XPATH_DEVICE_LIST_TABLE='//*[@id="NC_Device_List_Table"]/div[3]/div[1]/table/tbody/tr/td[1]'
XPATH_DEVICE_LIST_TABLE='//*[@id="NC_Device_List_Table"]/div[2]/div[1]/table/tbody/tr[1]/td[1]'
XPATH_BULK_CONFIG_SAVE_BUTTON = '//button[span[text()="Save"]]'
DELETE_PROACTIVE_JOB='//*[@id="NC_ProProvisioning_Delete_Action_Button"]'
CONFIRM_proactive='//*[@id="NC_PProvisiong_PPWindow_Confirm"]'
XPATH_DELETE_NOTIFICATION="//div[text()='Deleted Proactive Job successfully.']"

Replan_job_name_endafter='Replan_endafter'
Replan_job_name_endby='Replan_endby'
XPATH_END_AFTER='//*[@id="NC_PPJ_EndAfter_Option"]/span'
XPATH_DEVICE_TYPE_CUUP='//label[contains(text(),"0005B9-CS_ONECELL_CU-UP")]'
Replan_job_name_noenddate='Replan_noenddate'
XPATH_No_End_Date='//*[@id="NC_PPJ_NoEndTime_Option"]/span'
XPATH_DEVICE_TYPE_DU='//label[contains(text(),"0005B9-CS_ONECELL_DU")]'
Replan_job_name_run_immediate='Replan_run_immediately'
XPATH_JOBTYPE_Immediate='//*[@id="NC_PPJ_JobType"]/span[2]'
XPATH_PROACTIVE_JOb_TABLE='//*[@id="NC_PProvisiong_FilterTable"]/div[2]'

url_ves_DMS='http://10.211.1.11:7001/eventListener/v20'
Username_ves_DMS='admin'
Password_ves_DMS='admin'
#VES_DICT={'VES Collector URL': VES_URL_venue,'Username': VES_Username_venue,'Password': VES_Password_venue}
XAPTH_VES_PROVISIONED_DATA_DMSGUI='//*[@id="DC_VES Collector Configuration"]'
XPATH_END_OF_PAGE='//*[@id="DC_Menu_Content_Get_Menu_Content_Page"]/div[2]/div/div[1]/div/div[3]/div/div[11]/div/div'
PAGE_END='//*[@id="DC_Menu_Content_Get_Menu_Content_Page"]/div[2]/div/div[1]/div/div[3]/div/div[8]/div[1]/div[1]/div[3]'

Reset_Operation_type = 'Factory Reset'
Reset_job_name_run_immediate = 'Reset_run_immediately'

Reboot_job_name_endafter = 'Reboot_end_after'
ID_END_AFTER_OCCURANCE = 'id=NC_PPJ_EndAfter_Occurence'
XAPTH_FILTER_CRITERIA='//*[@id="NC_PProvisiong_PPWindow_DeviceCriteria"]/span[4]'
#XPATH_DEVICETYPE = '//*[@id="NC_DeviceType_Combobox"]/div'
XPATH_gNB_DEVICETYPE = '//*[@id="NC_DeviceType_Combobox"]/div'
XPATH_PPJ_DEVICETYPE = '//div[contains(text(),"Device Types")]'
XPATH_SELECT_DEVICETYPE = '//*[@id="VAADIN_COMBOBOX_OPTIONLIST"]/div/div[2]/table/tbody/tr[2]/td/span'
XPATH_DEVICE_FILTER = '//*[@id="NC_DeviceFilter_Combobox"]/div'
#XPATH_SELECT_FILTER = "//span[contains(text(),'ipsec_up_filter')]"
XPATH_SELECT_FILTER = '//span[contains(text(),"{Device_filter}")]'

parallel_cp_job = 'parallel_proactive_job_cp'
Device_Network_Operation_type ='Device And Network Related Replan'
parallel_up_job = 'parallel_proactive_job_up'