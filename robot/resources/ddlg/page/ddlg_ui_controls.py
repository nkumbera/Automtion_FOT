ddlg_url='http://10.212.2.22:7001/ddlg/'
DDLG_USERNAME='//input[@name="j_username"]'
DDLG_PASSWORD='//input[@name="j_password"]'
DDLG_UI_USER='ddlg'
DDLG_UI_PASSWORD='ddlg123'
DDLG_LOGIN_SIGNIN='//input[@class="ddlg-button"]'
PARAM_MAPPING = {'RP2000': ['//*[text()="Params for REM VC"]/parent::*/td[3]','conf/device/SIQ/params/ru-params_RP2000.properties']}
DDLG_PENDING_JOB= '{ddlg_url}?sec=job&subsec=view_pending'
DDLG_RUNNING_JOB= '{ddlg_url}?sec=job&subsec=view_running'
XPATH_VIEW_PENDING_JOBS = '//a[starts-with(text(),"View Pending Jobs")]'
#XPATH_PENDING_JOB_CHECKBOX ='//tXPATH_EDIT_PENDING_JOB_BUTTONd[text()="{job_name}"]/parent::*/td/input'
XPATH_PENDING_JOB_CHECKBOX = '//td[contains(text(),"{job_name}")]/parent::*//*[@type="CHECKBOX"]'
XPATH_RUNNING_SELECT_JOB= '//*[contains(text(),"{job_name}")]/parent::*//input[@name="job_id"]'
XPATH_ENABLE_BUTTON= '//input[@value="Enable"]'
XPATH_SUBMIT_BOTTON= '//input[@type="SUBMIT"]'
XPATH_RUNNING_CLONE_BUTTON='//input[@value="Clone"]'
XPATH_CLONE_YES_BUTTON='//input[@value="Yes"]'
XPATH_CANCLE_RUNNING_JOB_BUTTON='//input[@value="Cancel"]'
XPATH_SELECT_JOB_TO_EDIT_ddlg= '//*[contains(text(),"{job_name}")]/parent::*//*[contains(@href,"ddlg")]'
XPATH_EDIT_PENDING_JOB_BUTTON='//*[@value="Edit"]'
ID_NAME_SOFTWARE_VERSION_EDIT_TEXT='name=param_fapSWVersion'
XPATH_INFORM_TYPE_SELECT = '//select[@name="param_Informtype"]'
XPATH_UPDATE_PENDING_JOB='//*[@value="Update Job"]'
XPATH_SLAMD_PARAMS_FOR_RU_VC = '//*[text()="Params for RU VC"]/parent::*/td[3]'
XPATH_LINK_OF_RUNNING_JOB = '//*[contains(text(),"{job_name}")]/parent::*//td[3]'
XPATH_PARAM_REM_VC_INPUT='//input[@name="param_REMParams"]'
XPATH_SLAMD_GET_VARIABLE_VALUE= '//td[contains(text(),"{value}")]/parent::*/td[3]'

#SECTOR_WHITE_LIST='0005B95091,0005B95092;0005B95093,0005B95094'
#SECTOR_WHITE_LIST='0005B9ABB1,0005B9ABB2,0005B9ABB3,0005B9ABB4,0005B9ABB5'
#SECTOR_WHITE_LIST='0005B9431B0E,0005B9431B0F'
SECTOR_WHITE_LIST='0005B9431B0E'

ID_NAME_NOTIFICATION_CONFIG_EDIT_TEXT ='name=param_notificationConfigPath'
ID_NAME_Params_for_NGRP_VC_EDIT_TEXT = 'name=param_ngrp_props'




