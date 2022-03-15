DEVICE_RP_PARAMS_PAGE='{dms_device_console}#!mv/rpinuseparams/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
PR_DASHBOARD_PAGE ='{dms_device_console}#!mv/cgrp_dashboard/?srchKey=CGRP_MAC&id={device_macid}&dt=onecell&context=null'
XPATH_RP_PARAMS_PAGE_HEADER= '//div[@id="DC_Operational RP Params_Header"]'
XPATH_RP_PRRAMS_DEVICE_LINK= '//div[@id="DC_RuMapping_FilterTable"]//span[contains(text(),"{device_name}")]'
RP_WEBGUI_OVERRIDDEN_PARAM='{dms_device_console}+#!mv/rpwebuiparams/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
#XPATH_RP_PRRAMS_DEVICE_LINK = '//span[contains(text(),"{device_name}")]'
XPATH_RP2000_IMAGE= '//*[contains(@src,"{image}")]'
XPATH_RP2000_Summary_Text='//*[@id="DC_SummaryOUIPC"]'
#RP2100-cgrp-Outdoor-icon
#green-btm-left

#<a href="40259#!mv/cgrp_dashboard/?srchKey=CGRP_MAC&amp;id=0005B95291&amp;dt=onecell&amp;context=null" xpath="1"><span>0005B95291</span></a>


#DEVICE_RP_OVERRIDDEN_PARAM='http://10.212.2.245:7001/deviceconsole/#!mv/rpdmsparams/?srchKey=MAC&id=0005B97B52&dt=onecell&context=null'
XPATH_EXPAND_BUTTON='//*[@id="DC_DMS_Button"]/span'
XPATH_RP_OVERRIDDEN_PARAMS_PAGE_HEADER='//*[@id="DC_DMS Overridden RP Params_Header"]'
XPATH_RP_PROVISIONED_DATA_HEADER='//*[@id="DC_RP Provisioned Data_Header"]'
RP_ENCLOSURE_TYPE='//*[@id="DC_RuMapping_FilterTable"]/div[4]/div/div/div[11]/div/input'
RP_OVERRIDDEN_PARAM_APPLY_FILTER='//*[@id="DC_ApplyFilter"]'
Enclosure_Value="Indoor"
RP_MAPPING_TAB='//*[@id="DC_RuMapping_Config_title_Label"]/div[2]/span'
RP_TABLE='//*[@id="DC_RuMapping_FilterTable"]/div[3]/div[1]/div/table/tbody/tr/td[2]/div[4]/span'
END_OF_RP_TABLE='//*[@id="RuMapping_Config_table_section"]/div[3]/div/div/div[1]/div/div[1]/div'
#ENCLOSURE_DROP_DOWN='//*[@id="DC_RuMapping_FilterTable"]/div[4]/div/div/div[10]/div/div'
ENCLOSURE_DROP_DOWN='//*[@id="DC_RuMapping_FilterTable"]/div/div/div/div[10]/div'
LIST_ITEM='//*[@id="VAADIN_COMBOBOX_OPTIONLIST"]/div/div[2]/table/tbody/tr[1]/td'


GET_TABLE_ENTRY_INFO='//*[@id="DC_RPMapping_TablePageInfo_Label"]'
GET_ENCLOSURE_VALUE='//*[@id="DC_RuMapping_FilterTable"]/div[5]/div[1]/table/tbody/tr[1]/td[11]'
XPATH_TABLE='//*[@id="DC_RuMapping_FilterTable"]/div[5]'
XAPTH_TABLE_BODY='//*[@id="DC_RuMapping_FilterTable"]/div[5]/div[1]/table'

XPATH_EDIT_ATTRIBUTE='//*[@id="DC_RuMapping_Edit_Attribute_Button"]'
ALL_AP_RADIO_BUTTON='//div[@class="v-gridlayout-slot"][1]/div/span[2]'
XPATH_RP_LOCATION_CHECKBOX='//*[@id="DC_RuMapping_EditAttribute_rplocation_CheckBox"]'
XPATH_RP_TX_POWER_CHECKBOX='//*[@id="DC_RuMapping_EditAttribute_rptxpower_CheckBox"]'
XPATH_SAVE_BUTTON='//*[@id="NC_RPEditAttrb_Submit_Button"]'
XPATH_RP_LOCATION_INPUT_TEXT_BOX='//*[@id="DC_RuMapping_EditAttribute_rplocation_Textfield"]'
XPATH_RP_TXPOWER_INPUT_TEXT_BOX='//*[@id="DC_RuMapping_EditAttribute_rptxpower_Textfield"]'
XAPTH_SAVE_MESSAGE='//*[@id="CONTENT_LAYOUT"]/div/div[3]/div[1]/div/div/div'


NEW_SAVE_VALUE="The RP configuration has been saved."
EXISTING_SAVE_VALUE="No configuration change found."
LOCATION_VALUE="Belandur"
RP_TX_POWER_VALUE="15"


XATH_RP_ID='//*[@id="DC_RP_0005B97B52_0005B98B05_2_RP Tx Power (dBm)_TextField"]'
XPATH_RP_COLUMN='//*[@id="DC_RuMapping_FilterTable"]/div[3]/div[1]/div/table/tbody/tr/td[7]/div[4]'
XPATH_RP_COLUMN_LOCATION='//*[@id="DC_RUData_Table"]/div[2]/div[1]/table/tbody/tr[1]/td[7]/div/div'
#//*[@id="DC_RUData_Table"]/div[2]/div[1]/table/tbody/tr/td[7]/div/div
XPATH_RP_COLUMN_TX_POWER='//*[@id="DC_RUData_Table"]/div[2]/div[1]/table/tbody/tr[1]/td[8]/div/div'
#GET_ENCLOSURE_VALUE     ='//*[@id="DC_RuMapping_FilterTable"]/div[5]/div[1]/table/tbody/tr[1]/td[11]'

COLLAPSE_EXPAND_ALL_BUTTON='//*[@id="DC_ExpandCollapse"]'
XPATH_PR_MAPPING_EXPAND_BUTTON='//*[@id="DC_RP Mapping"]/div[2]'
XPATH_PROVISIONED_DATA_TABLE='//*[@id="DC_RUData_Table"]/div[2]/div[1]/table/tbody'


AUto_Tx_Power_Filter_Box='//*[@id="DC_RuMapping_LTE_AutoTXPowerEnable_Combobox"]'
AUto_Tx_Power_Filter_Box_DropDown='//*[@id="DC_RuMapping_LTE_AutoTXPowerEnable_Combobox"]/div'
XPATH_Auto_Tx_Power_VALUE_TO_GET = '//input[@class="v-filterselect-input"]'
XPATH_Auto_Tx_Power_VALUE = '//span[contains(text(),"{value}")]'
XAPTH_OVERRIDDEN_SAVE_BUTTON='//*[@id="DC_RuMapping_Save_Button"]'
RP_PROV_PAGE_SEARCH_TEXTFIELD='//*[@id="DC_Search_TextField"]'
RP_PROV_PAGE_SEARCH_BUTTON='//*[@id="DC_Search_Button"]'
PROV_DATA_PAGE_AUTO_TX_POWER_NAME='//*[@id="DC_ProvisionedDataTable_Table"]/div[2]/div[1]/table/tbody/tr/td[1]'
PROV_DATA_PAGE_AUTO_TX_POWER_VALUE='//*[@id="DC_ProvisionedDataTable_Table"]/div[2]/div[1]/table/tbody/tr/td[2]'

#RP_EDIT_BUTTON='//*[@id="DC_RuMapping_FilterTable"]/div[5]/div[1]/table/tbody/tr[1]/td[15]/div/div'
#RP_EDIT_BUTTON='//*[@id="DC_RuMapping_Edit_Attribute_Button"]'
RP_EDIT_BUTTON='//*[@id="DC_RuMapping_FilterTable"]/div[5]/div[1]/table/tbody/tr[1]/td[14]/div/div'
XPATH_RP_PARAMS_PAGE_HEADER= '//div[@id="DC_Operational RP Params_Header"]'
RP_MAPPING_GPS_CONFIGURATION='//*[@id="RPMapping_Nominal GPS Configuration"]/div[2]'
#RP_MAPPING_GPS_CONFIGURATION="//*[contains(@class,'v-button-caption') and contains(text(),'GPS')]"

XPATH_LATITUDE_SIGN='//*[@id="DC_RuMapping_NominalGps_RUData.LatitudeSign_ComboBox"]'
XPATH_LATITUDE_DROPDOWN='//*[@id="DC_RuMapping_NominalGps_RUData.LatitudeSign_ComboBox"]/div'
XPATH_DEGREE_OF_LATITUDE='//*[@id="DC_RuMapping_NominalGps_RUData.DegreesOfLatitude_Textfield"]'
XPATH_DEGREE_OF_LONGITUTE='//*[@id="DC_RuMapping_NominalGps_RUData.DegreesOfLongitude_Textfield"]'
XPATH_DIRECTION_OF_LATITUDE='//*[@id="DC_RuMapping_NominalGps_RUData.DirectionOfAltitude_ComboBox"]'
XPATH_DIRECTION_OF_LATITUDE_DROPDOWN='//*[@id="DC_RuMapping_NominalGps_RUData.DirectionOfAltitude_ComboBox"]/div'
XPATH_ALTITUDE='//*[@id="DC_RuMapping_NominalGps_RUData.Altitude_Textfield"]'
XPATH_UNCERTAINTY_ALTITUDE='//*[@id="DC_RuMapping_NominalGps_RUData.UncertaintyAltitude_Textfield"]'
XPATH_UNCERTAINITY_SEMI_MAJOR='//*[@id="DC_RuMapping_NominalGps_RUData.UncertaintySemiMajor_Textfield"]'
XPATH_UNCERTAINITY_SEMI_MINOR='//*[@id="DC_RuMapping_NominalGps_RUData.UncertaintySemiMinor_Textfield"]'
XPATH_ORIENTATION='//*[@id="DC_RuMapping_NominalGps_RUData.OrientationOfMajorAxis_Textfield"]'
XPATH_CONFIDENCE='//*[@id="DC_RuMapping_NominalGps_RUData.Confidence_Textfield"]'
XPATH_RUMAPPING_SAVE='//*[@id="DC_RuMapping_Save_Button"]'


XPATH_PR_IDENTIFIER='//*[@id="DC_RuMapping_FilterTable"]/div[4]/div/div/div[2]/input'
XPATH_FILTER_APPLY_BUTTON='//*[@id="DC_ApplyFilter"]'
#RP_PROVISION_TABLE='//*[@id="DC_RUData_Table"]/div[2]'
RP_PROVISION_TABLE='//*[@id="DC_RUData_Table"]/div[2]/div[1]/table/tbody'

#RP_PROVISION_TABLE='//*[contains(text(),"005B9AD5")]'

XPATH_WEBGUI_RP_PARAMS_PAGE_HEADER='//*[@id="DC_WebGUI Overridden RP Params_Header"]'
#Location_param='//*[@id="DC_NBI-Overridden_Table"]/div[3]/div[1]/table/tbody/tr/td[8]/div/span'
Location_param='//*[@id="DC_NBI-Overridden_Table"]/div[2]/div[1]/table/tbody/tr[1]/td[8]'

RP_WEBGUI_DELETE='//*[@id="rpwebuiparams"]/div/div[1]/div/div/div[1]/div'
RP_WEBGUI_DELETE_CONFIRM='//*[@id="Annotation_Submit_Button"]'

Tx_power_param='//*[@id="DC_NBI-Overridden_Table"]/div[3]/div[1]/table/tbody/tr/td[9]/div/span'
#Deployment_type_xpath='//*[@id="DC_NBI-Overridden_Table"]/div[3]/div[1]/table/tbody/tr/td[9]/div/span'
Deployment_type_xpath='//*[@id="DC_NBI-Overridden_Table"]/div[2]/div[1]/table/tbody/tr[1]/td[10]'
#Installation_type_xpath='//*[@id="DC_NBI-Overridden_Table"]/div[3]/div[1]/table/tbody/tr/td[10]/div/span'
#Latitude_sign_xpath='//*[@id="DC_NBI-Overridden_Table"]/div[3]/div[1]/table/tbody/tr/td[11]/div'
Latitude_sign_xpath='//*[@id="DC_NBI-Overridden_Table"]/div[2]/div[1]/table/tbody/tr[1]/td[11]'
#Degree_of_latitude_xpath='//*[@id="DC_NBI-Overridden_Table"]/div[3]/div[1]/table/tbody/tr/td[12]/div/span'
Latitude_sign_xpath='//*[@id="DC_NBI-Overridden_Table"]/div[2]/div[1]/table/tbody/tr[1]/td[12]'
#Degree_of_longitude_xpath='//*[@id="DC_NBI-Overridden_Table"]/div[3]/div[1]/table/tbody/tr/td[13]/div/span'
Degree_of_longitude_xpath='//*[@id="DC_NBI-Overridden_Table"]/div[2]/div[1]/table/tbody/tr[1]/td[13]'
#Direction_of_altitude_xpath='//*[@id="DC_NBI-Overridden_Table"]/div[3]/div[1]/table/tbody/tr/td[14]/div/span'
Direction_of_altitude_xpath='//*[@id="DC_NBI-Overridden_Table"]/div[2]/div[1]/table/tbody/tr[1]/td[14]'
#altitude_xpath='//*[@id="DC_NBI-Overridden_Table"]/div[3]/div[1]/table/tbody/tr/td[15]/div/span'
altitude_xpath='//*[@id="DC_NBI-Overridden_Table"]/div[2]/div[1]/table/tbody/tr[1]/td[15]'
#semi_major_xpath='//tbody/tr[1]/td[16]/div[1]/span[1]/label[1]'
semi_major_xpath='//*[@id="DC_NBI-Overridden_Table"]/div[2]/div[1]/table/tbody/tr[1]/td[16]'
#semi_minor_xpath='//tbody/tr[1]/td[17]/div[1]/span[1]/label[1]'
semi_minor_xpath='//*[@id="DC_NBI-Overridden_Table"]/div[2]/div[1]/table/tbody/tr[1]/td[17]'
#uncertain_altitude_xpath='//tbody/tr[1]/td[18]/div[1]/span[1]/label[1]'
uncertain_altitude_xpath='//*[@id="DC_NBI-Overridden_Table"]/div[2]/div[1]/table/tbody/tr[1]/td[18]'
#confidence_xpath='//*[@id="DC_NBI-Overridden_Table"]/div[3]/div[1]/table/tbody/tr/td[19]/div'
confidence_xpath='//*[@id="DC_NBI-Overridden_Table"]/div[2]/div[1]/table/tbody/tr[1]/td[19]'
#Orientation_of_major_axis_xpath='//tbody/tr[1]/td[20]/div[1]/span[1]/label[1]'
Orientation_of_major_axis_xpath='//*[@id="DC_NBI-Overridden_Table"]/div[2]/div[1]/table/tbody/tr[1]/td[20]'