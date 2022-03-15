SERVER_IP='10.211.240.171'
SERVER_USERNAME='dmsadmin'
SERVER_PASSWORD='airvana123'
# DMS_UI_URL =  'http://10.211.240.89:7001/deviceconsole'
DMS_URL = 'http://10.211.240.171:7001/'
#DMS_URL = 'http://10.211.240.171:7001/'
#SMALD_SIMULATOR = 'http://10.211.240.75:8080/slamd/'
SMALD_SIMULATOR = 'http://10.212.2.13:8080/slamd'
DMS_URL1 = 'http://10.211.240.171:7001/'
#DMS_URL1 = 'http://10.211.240.171:7001/'
# SMALD_SIMULATOR = 'http://10.212.121.131:8080/slamd'
# DMS_UI_URL = 'http://54.255.119.196:7001/deviceconsole/'
DMS_UI_URL = DMS_URL + 'deviceconsole/'
DMS_NC_URL = DMS_URL1 + 'networkconsole/'
SLAMD_NC_SIMULATOR = 'http://10.212.2.13:8080/slamd'
DMS_NETWORK_CONSOLE_URL = DMS_URL + 'networkconsole/'
DMS_Network_PAGE_URL= DMS_NETWORK_CONSOLE_URL + '#!dmsui-reports/?C0'
DMS_NC_UI_USER = 'dmsadmin'
DMS_NC_UI_PASSWORD = 'Airvana123!'
#DMS_DEVICE_URL = '#!mv/dashboard/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
DMS_DEVICE_URL = '#!mv/dashboard/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
DMS_UI_USER = 'dmsadmin'
DMS_UI_PASSWORD = 'Airvana123!'
DEVICE1_MACID = '0005B97C05'
DEVICE2_MACID = '0005B9519F1'
DEVICE3_MACID = '0005B97A13'
DEVICE4_MACID = '0005B97A05'
DEVICE5_MACID = '0005B97A01' #REBOOT
DEVICE6_MACID = '0005B925A01' #REBOOT
DEVICE7_MACID = '0005B911A02' #REBOOT
DEVICE8_MACID = '0005B97A02' #REBOOT
DEVICE10_MACID ='0005B97A15'
DEVICE11_MACID ='0005B97A03' #RESET
DEVICE12_MACID ='0005B97A04' #RESET
DEVICE13_MACID ='0005B925A03' #RESET
DEVICE14_MACID ='0005B925A04' #RESET
DEVICE15_MACID ='0005B97A09'  #Navya
DEVICE16_MACID = '0005B97A06'
DEVICE17_MACID = '0005B97A07'
DEVICE18_MACID = '0005B97A08'
DEVICE_NEW='0005B97C02'
DEVICE_19_MACID = '0005B9519F2'
DEVICE20_MACID='0005B97A18'
DEVICE21_MACID='0005B94238A0'
#DEVICE16_MACID ='0005B951FFB0' #Realdevice
BROWSER_ELEMENT_TIMEOUT = "60s"
REBOOT_WORKFLOW_TIMEOUT = "60s"
#SOFTWARE_VERSIONS = ['1.7.00.169', '4.0.00.169', '4.3.00.169', '4.5.00.169','5.5.00.100']
#SOFTWARE_VERSIONS = ['4.3.00.169', '4.5.00.169']
SOFTWARE_VERSIONS = ['4.0.00.169', '4.3.00.169', '4.5.00.169','5.5.00.100']
DEVICE_MACID = '00000000'
DEVICE_RP_OVERRIDDEN_PARAM=DMS_UI_URL+'#!mv/rpdmsparams/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
DEVICE_RP_PROVSIONED_DATA=DMS_UI_URL+'#!mv/rpprovisioneddata/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
DEVICE_PROVSIONED_DATA=DMS_UI_URL+'#!mv/provisioneddata/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
#DEVICE_TIMING_SOURCE=DMS_UI_URL+'#!mv/timingsource/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
DEVICE_TIMING_SOURCE=DMS_UI_URL+'#!mv/timingsource/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'

Device_list_URL=DMS_NETWORK_CONSOLE_URL + '#!dmsui-deviceList/?C0'
Proactive_job=DMS_NETWORK_CONSOLE_URL+ '#!dmsui-proactiveProvisioning/?C0'

# Alarm
DEVICE_ALARM_MACID = '0005B9A503'
DEVICE_ALARM_Delete_MACID = '0005B9A504'
Test_Alarm_MACID = '0005B94238A0'

DMS_Network_Console_Alarm_URL = DMS_NETWORK_CONSOLE_URL + '#!dmsui-systemAlarms/?C0'
DMS_Network_Console_Device_Alarm_URL = DMS_NETWORK_CONSOLE_URL + '#!dmsui-deviceAlarms/?C0'
DMS_NETWORK_DEVICE_LIST_PAGE_URL= DMS_NETWORK_CONSOLE_URL + '#!dmsui-deviceList/?C0'
DMS_NC_Health = DMS_NETWORK_CONSOLE_URL + '#!dmsui-dmsHealth/?C0'
DMS_NC_Network_License = DMS_NETWORK_CONSOLE_URL + '#!dmsui-network-unlicensed/?C0'
DMS_NC_Enterprise_View = DMS_NETWORK_CONSOLE_URL + '#!dmsui-enterpriseview/?C0'

BACKUP_RESTORE_FILE_LOCATION='C:\\Users\\commscope\\Desktop\\Automation_software\\DMSAutomation_3_9_2021\\DMSAutomation\\robot\\properties\\File_For_Import\\LTE_Enterprise_C-RANSC_Cntrl_0005B97A18_SERVICECONFIGURATIONS.xml'
SETTINGS_FILE_LOCATION='C:\\Users\\commscope\\Desktop\\Automation_software\\DMSAutomation_3_9_2021\\DMSAutomation\\robot\\properties\\File_For_Import\\ServiceSetting_ONECELL_5.5_Automation.xml'
SERVER_IMPORT_PATH='/xmldb/appdata/dms/import/network/'
SERVER_FILE_COPY_FROM_PATH='/xmldb/appdata/dms/import/network/ServiceSetting_ONECELL_5.5_Automation.xml'
SERVER_COPY_TO_PATH='/xmldb/appdata/dms/import/network/success/'

IMPORT_POLICY_FILE_LOCATION = 'C:\\Users\\commscope\\Desktop\\Automation_software\\DMSAutomation_3_9_2021\\DMSAutomation\\robot\\properties\\File_For_Import\\policies2.zip'

DEVICE_CONSOLE_ALARM_PAGE_URL='{dms_device_console}#!mv/devicealarms/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
DEVICE_CONSOLE_ALARM_PAGE_URL_Delete = '{dms_device_console}#!mv/devicealarms/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
DEVICE_CONSOLE_TEST_ALARM_URL = '{dms_device_console}#!mv/devicealarms/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'

DMS_FILE_IMPORT_URL=DMS_NETWORK_CONSOLE_URL +'#!dmsui-fileImports/?C0'
#DEVICE_IP='10.194.158.1:6002'
#DEVICE_IP='10.194.157.1:6002'
DEVICE_IP='10.194.105.1:6002'


DMS_WEBGUI_URL='https://'+DEVICE_IP+'/login/?next=/ManagementDashBoard/'
DMS_WEBGUI_UI_USER = 'admin'
DMS_WEBGUI_UI_PASSWORD = 'admin1234'
WEBUI_CONSOLE=DMS_UI_URL+'#!mv/webuiparams/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
#DEVICE_TIMING_SOURCE=DMS_UI_URL+'#!mv/timingsource/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
OPERATIONAL_PAGE=DMS_UI_URL+'#!mv/parameter/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
DEVICE_PROVSIONED_DATA_URL=DMS_UI_URL+'#!mv/provisioneddata/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'




REAl_DEVICE_RESET_TIMEOUT='720s'
REAl_DEVICE_REBOOT_TIMEOUT='720s'
REAL_DEVICE_REPLAN_TIMEOUT='200s'