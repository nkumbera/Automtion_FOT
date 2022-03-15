
#Device_Console_Alarm_Proable_Cause = '//body[1]/div[1]/div[1]/div[2]/div[4]/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[4]/div[1]/div[2]/div[1]/div[1]/div[6]/input[1]'
Device_Console_Alarm_Proable_Cause='//*[@id="DC_ACTIVE_DEVICE_ALARM_Events_FilterTable"]/div[1]/div[1]/div/table/tbody/tr[2]/td[6]/div/input'
#Device_Console_Alarm_Source = '//body[1]/div[1]/div[1]/div[2]/div[4]/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[4]/div[1]/div[2]/div[1]/div[1]/div[8]/input[1]'
Device_Console_Alarm_Source='//*[@id="DC_ACTIVE_DEVICE_ALARM_Events_FilterTable"]/div[1]/div[1]/div/table/tbody/tr[2]/td[8]/div/input'
Apply_filter_alarm = 'id=applyFilter'
Header_Checkbox = 'id=headerCheckBox'
Device_Console_Alarm_Comment = 'id=DC_ACTIVE_DEVICE_ALARM_ACTION_ANNOTATION'
Device_Console_Alarm_Comment_Content = '//body[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[1]/div[3]/textarea[1]'
Device_Console_Alarm_Comment_Confirm = 'id=DC_ACTIVE_DEVICE_ALARM_Annotation_Submit_Button'

Device_Console_Alarm_Ackno = 'id=DC_ACTIVE_DEVICE_ALARM_ACTION_ACKNOWLEDGE'
Device_Console_Alarm_Ackno_Comment = '//body[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[1]/div[5]/textarea[1]'
Device_Console_Alarm_Ackno_Confirm = 'id=DC_ACTIVE_DEVICE_ALARM_Action_Submit_Button'

Device_Console_Alarm_UnAckno = 'id=DC_ACTIVE_DEVICE_ALARM_ACTION_UNACKNOWLEDGE'
Device_Console_Alarm_UnAckno_Content = '//body[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[1]/div[5]/textarea[1]'
Device_Console_Alarm_UnAckno_Confirm = 'id=DC_ACTIVE_DEVICE_ALARM_Action_Submit_Button'

Device_Console_Alarm_Clear = 'id=DC_ACTIVE_DEVICE_ALARM_ACTION_CLEAR'
Device_Console_Alarm_Clear_Content = '//body[1]/div[2]/div[3]/div[1]/div[1]/div[3]/div[1]/div[1]/div[5]/textarea[1]'
Device_Console_Alarm_Clear_Confirm = 'id=DC_ACTIVE_DEVICE_ALARM_Action_Submit_Button'

Device_Console_Alarm_Delete = 'id=DC_ACTIVE_DEVICE_ALARM_ACTION_DELETE'
Device_Console_Alarm_Delete_Confirm = 'id=DC_ACTIVE_DEVICE_ALARM_Action_Submit_Button'

#E2E Test Alarm
Test_Alarm_Button = 'id=TestAlarmsButton'
Clear_Test_Alarm = "//label[contains(text(),'Clear Alarm')]"
Trigger_Test_Alarm = "//div[@class='v-label v-widget v-label-undef-w'][contains(text(),'Trigger Test Alarm')]"
Drop_down = "//div[@id='TestAlarmDropDown']//div"
NTP_Alarm = "//tr[2]//td[1]//span[1]"
Back_Button = "//span[contains(text(),'<< Back')]"
Type_Alarm_Page = "//div[@class='v-captiontext'][contains(text(),'Type')]"
All_Alarm_Page = "//div[contains(text(),'All')]"
Active_Alarm_Page = "//div[contains(text(),'Active')]"
BC_Alarm = 'id=NC_Alarm_BC_Filter_Btn'
Header_Checkbox_TEST_Alarm = 'id=headerCheckBox'

navigate_tab="/*[@id='NAVIGATION']"


XPATH_EVENTTYPE_SEARCH_INPUT = '//*[@id="DC_ACTIVE_DEVICE_ALARM_Events_FilterTable"]/div[1]/div[1]/div/table/tbody/tr[2]/td[4]/div/input'
ID_ALARM_APPLY_BUTTON = 'id=applyFilter'
XPATH_ALARM_SEVERITY = '//*[@id="DC_ACTIVE_DEVICE_ALARM_Events_FilterTable"]/div[2]/div[1]/table/tbody/tr/td[3]/div/div'
XPATH_ALARM_PROBABLE_CAUSE = '//*[@id="DC_ACTIVE_DEVICE_ALARM_Events_FilterTable"]/div[2]/div[1]/table/tbody/tr/td[6]/div'
XPATH_ALARM_SPECIFIC_PROBLEM = '//*[@id="DC_ACTIVE_DEVICE_ALARM_Events_FilterTable"]/div[2]/div[1]/table/tbody/tr/td[7]/div'

XPATH_NW_ALARM_SEVERITY = '//*[@id="DC_DeviceAlarms_FilterTable"]/div[2]/div[1]/table/tbody/tr/td[3]/div/div'
XPATH_NW_ALARM_PROBABLE_CAUSE = '//*[@id="DC_DeviceAlarms_FilterTable"]/div[2]/div[1]/table/tbody/tr/td[6]/div'
XPATH_NW_ALARM_SPECIFIC_PROBLEM = '//*[@id="DC_DeviceAlarms_FilterTable"]/div[2]/div[1]/table/tbody/tr/td[7]/div'

XPATH_NWEVENTTYPE_SEARCH_INPUT = '//*[@id="DC_DeviceAlarms_FilterTable"]/div[1]/div[1]/div/table/tbody/tr[2]/td[4]/div/input'
ID_NWALARM_APPLY_BUTTON = 'id=DeviceAlarms_AppyFilterButton'
XPATH_ALL_ALARM ='//div[contains(text(),"All")]'

XPATH_GET_ALARM_DETAILS= '//div[contains(text(),"No alarms found")]'

XPATH_NW_SPECIFIC_PROBLEM_SEARCH_INPUT = '//*[@id="DC_DeviceAlarms_FilterTable"]/div[1]/div[1]/div/table/tbody/tr[2]/td[7]/div/input'
XPATH_ALL_SPECIFIC_PROBLEM_SEARCH_INPUT ='//*[@id="DC_ALL_DEVCIE_ALARM_Events_FilterTable"]/div[1]/div[1]/div/table/tbody/tr[2]/td[7]/div/input'

