XPATH_PROACTIVEJOB_MENU = "//div[@id='ppj']"
#XPATH_NAME_FILTER = '//*[@id="NC_PProvisiong_FilterTable"]/div[2]/div/div/div[1]/input'
XPATH_NAME_FILTER='//*[@id="NC_PProvisiong_FilterTable"]/div[1]/div[1]/div/table/tbody/tr[2]/td[1]/div/input'
XPATH_APPLY_FILTER = "//span[contains(text(),'Apply Filter')]"
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
XPATH_JobState = "//tbody/tr[1]/td[6]/div[1]/div[1]/span[1]/img[1]"
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
XPATH_END_OF_PAGE = '//*[@id="DC_Menu_Content_Get_Menu_Content_Page"]'
#XPATH_HOUR_SELECTION = "//body[1]/div[1]/div[1]/div[2]/div[3]/div[2]/div[2]/div[1]/div[1]/div[1]/div[3]/div[1]/div[6]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[3]/div[1]/div[1]"
#XPATH_HOUR_SELECTOR = "//*[@id='NC_PPJ_Hour_CB']"
#XPATH_MINUTE_SELECTOR = "//*[@id='NC_PPJ_Minute_CB']"
XPATH_HOUR_SELECTOR = "//body[1]/div[1]/div[1]/div[2]/div[3]/div[2]/div[2]/div[1]/div[1]/div[1]/div[3]/div[1]/div[6]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[3]/div[1]/div[1]"
XPATH_MINUTE_SELECTOR = "//body[1]/div[1]/div[1]/div[2]/div[3]/div[2]/div[2]/div[1]/div[1]/div[1]/div[3]/div[1]/div[6]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[7]/div[1]/div[1]/div[1]"
HOUR_SELECTION = "//span[contains(text(),'0')]"
MINUTE_SELCETION = "//span[contains(text(),'30')]"
ID_IMAGE_ADD_BUTTON = 'id=NC_FWImg_ADDNew'
ID_IMAGE_NAME = 'id=NC_Firmware_Img_Name'
XPATH_DEVICETYPE= "//*[@id='NC_FWImg_DeviceType_Combobox']/div"
XPATH_BC_DEVICETYPE="//span[contains(text(),'0005B9-LTE_Enterprise_C-RANSC_Cntrl')]"
ID_FIRMWARE_VERSION = 'id=NC_FWImg_Version'
ID_IMAGE_LOCATION = 'NC_FWImg_URL'
XPATH_IMAGE_TYPE = "//*[@id='DC_Menu_Content_Get_Menu_Content_Page']/div[2]/div/div/div/div[3]/div/div[11]/div/div[1]/div/div/span"
ID_FILE_SIZE = 'NC_FWImg_Chksum'
ID_USERNAME = 'NC_FWImg_UserName'
ID_PASSWORD = 'NC_FWImg_Password'
ID_FIRMWARE_SAVE = 'NC_AFU_Save'
XPATH_FIRMWARE_NAME = "//*[@id='NC_FWImg_FilterTable']/div[1]/div[1]/div/table/tbody/tr[2]/td[1]/div/input"
ID_FIRMWARE_APPLY = 'id=NC_FWImg_ApplyFilter'
XPATH_IMAGE_TYPE_VALUE = "//*[@id='NC_FWImg_FilterTable']/div[2]/div[1]/table/tbody/tr/td[4]/div"
ID_FIRMWARE_DELETE = 'id=NC_FW_IMG_DELETE_BTN'
ID_FIRMWARE_DELETE_CONFIRM = 'id=NC_AFU_Window_Confirm'
ID_FIRMWARE_ADD_BUTTON = 'id=NC_MUpgrade_ADDNew'
ID_FIRMWARE_JOB_NAME = 'id=NC_AFU_Job_Name'
#XPATH_FIRMWARE_SCHE_STARTDATE = 'id=NC_AFU_JobSchedule_StartDate'
XPATH_FIRMWARE_SCHE_STARTDATE ="//*[@id='NC_AFU_JobSchedule_StartDate']/input"
XPATH_FIRMWARE_DEVICETYPE = "//*[@id='NC_AFU_Device_Type']/div"
XPATH_MACID_SEARCH = "//*[@id='NC_AvailablePPJDevice_Table']/div[1]/div[1]/div/table/tbody/tr[2]/td[2]/div/input"
ID_DEVICE_APPLY = 'id=ppj-apply-filter'
XPATH_SELECT_DEVICE="//*[@id='NC_AvailablePPJDevice_Table']/div[2]/div/table/tbody/tr/td[1]/div/span"
ID_ADD_BUTTON = 'id=NC_Add_AvailableDevices_Btn'
XPATH_IMAGE_SEARCH = "//*[@id='NC_ManageUpgrade_FilterTable']/div[1]/div[1]/div/table/tbody/tr[2]/td[2]/div/input"
ID_IMAGE_APPLY = 'id=NC_FUpgrade_ApplyFilter'
XPATH_SELECT_IMAGE = 'id=NC_AFU_ChkBox_'
ID_FIRMWARE_SAVE= 'id=NC_AFU_Save'
ID_IMAGE_NUMBER = 'id=NC_PProvisiong_NumofEntries_Label'
XPATH_JOBNAME_SEARCH = "//*[@id='NC_ManageUpgrade_FilterTable']/div[1]/div[1]/div/table/tbody/tr[2]/td[1]/div/input"
ID_JOBSEARCH_APPLY = 'id=NC_FUpgrade_ApplyFilter'
XPATH_JOB_STATUS= "//*[@id='NC_ManageUpgrade_FilterTable']/div[2]/div[1]/table/tbody/tr/td[7]"
XPATH_DOWNLOAD_ROW = "//div[contains(text(),'Initiate Download')]"
XPATH_FIRMWARE_NAME_HISTORY = "//*[@id='DC_DHDetails_Window_Content']/div/div/div/div[2]/div/div/div/div[2]/div[1]/table/tbody/tr[2]/td[4]/div/div"
ID_FIRMWARE_JOB_DELETE = 'id=NC_firmwareUpgrade_Delete_Action_Button'
ID_FIRMWARE_JOB_DELETE_CONFIRM='id=NC_AFU_Window_Confirm'
XPATH_DURATION="//div[contains(@class,'durationComboBox-firm-ext')]//input"
XPATH_RADIOBTN_ENDBY="//div[@id='NC_AFU_EndBy_Option']"
XPATH_RADIOBTN_SPLIT="//div[@id='NC_AFU_UpgradeType_RadioButton']//span[2]"
XPATH_FIRMWARE_ACTIVATE_STARTDATE="//div[@id='NC_AFU_ActivationSchedule_StartDt']//input"
XPATH_FIRMWARE_ACTIVATE_MINUTE="//div[@id='NC_AFU_ActivationSchedule_Minute']//input"
ID_SPLIT_FIRMWARE_ADD_BUTTON = 'id=NC_Firmware_ADDNew'
ID_SPLIT_FIRMWARE_SAVE_BUTTON= 'id=NC_FirmwareImg_SaveButton'