# DMS_UI_URL =  'http://10.211.240.89:7001/deviceconsole'
DMS_URL = 'http://10.212.2.245:7001/'
#DMS_URL = 'http://10.211.240.171:7001/'
#SMALD_SIMULATOR = 'http://10.211.240.75:8080/slamd/'
SMALD_SIMULATOR = 'http://10.212.121.131:8080/slamd'
DMS_URL1 = 'http://10.212.2.245:7001/'
#DMS_URL1 = 'http://10.211.240.171:7001/'
# SMALD_SIMULATOR = 'http://10.212.121.131:8080/slamd'
# DMS_UI_URL = 'http://54.255.119.196:7001/deviceconsole/'
DMS_UI_URL = DMS_URL + 'deviceconsole/'
DMS_NC_URL = DMS_URL1 + 'networkconsole/'
SLAMD_NC_SIMULATOR = 'http://10.212.121.131:8080/slamd/'
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
DEVICE3_MACID = '0005B97C01'
DEVICE4_MACID = '0005B900A05'
DEVICE5_MACID = '0005B900A01' #REBOOT
DEVICE6_MACID = '0005B911A01' #REBOOT
DEVICE7_MACID = '0005B911A02' #REBOOT
DEVICE8_MACID = '0005B900A02' #REBOOT
DEVICE10_MACID ='0005B97C03'
DEVICE11_MACID ='0005B900A03' #RESET
DEVICE12_MACID ='0005B900A04' #RESET
DEVICE13_MACID ='0005B911A03' #RESET
DEVICE14_MACID ='0005B911A04' #RESET
DEVICE15_MACID ='0005B97B52'  #Navya
DEVICE16_MACID = '0005B900A06'
DEVICE17_MACID = '0005B900A07'
DEVICE18_MACID = '0005B900A08'
DEVICE_NEW='0005B97C02'
#DEVICE16_MACID ='0005B951FFB0' #Realdevice
BROWSER_ELEMENT_TIMEOUT = "60s"
REBOOT_WORKFLOW_TIMEOUT = "60s"
SOFTWARE_VERSIONS = ['1.7.00.169', '4.0.00.169', '4.3.00.169', '4.5.00.169']
#SOFTWARE_VERSIONS = ['4.3.00.169', '4.5.00.169']
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
Test_Alarm_MACID = '0005B951FF70'

DMS_Network_Console_Alarm_URL = DMS_NETWORK_CONSOLE_URL + '#!dmsui-systemAlarms/?C0'
DMS_Network_Console_Device_Alarm_URL = DMS_NETWORK_CONSOLE_URL + '#!dmsui-deviceAlarms/?C0'
DMS_NETWORK_DEVICE_LIST_PAGE_URL= DMS_NETWORK_CONSOLE_URL + '#!dmsui-deviceList/?C0'