# DMS ssh login Server Details for file copy

SERVER_IP='10.212.2.12'
#SERVER_IP='10.211.240.171'
SERVER_USERNAME='dmsadmin'
SERVER_PASSWORD='airvana123'

# DMS URL

# DMS_UI_URL =  'http://10.211.240.89:7001/deviceconsole'
#DMS_URL = 'http://13.232.140.61:7001/'
DMS_URL = 'http://10.212.2.12:7001/'
#DMS_URL = 'http://10.211.240.171:7001/'
#DMS_URL = 'http://10.211.240.171:7001/'
DMS_URL1 = 'http://10.212.2.12:7001/'
#DMS_URL1 = 'http://10.211.240.171:7001/'
#DMS_URL1 = 'http://10.211.240.171:7001/'
# DMS_UI_URL = 'http://54.255.119.196:7001/deviceconsole/'
SO_TOOL_URL ='http://10.212.2.6:30102/'
SO_TOOL_DMS_URL = 'http://10.212.2.17:7001/'
# DDLG / SLAMD URL

#SMALD_SIMULATOR = 'http://10.211.240.75:8080/slamd/'
DDLG_SIMULATOR = 'http://10.212.2.22:7001/ddlg'
# SMALD_SIMULATOR = 'http://10.212.121.131:8080/slamd'
SLAMD_NC_SIMULATOR = 'http://10.212.2.22:7001/ddlg'

# Creating complete URL for Device and Network console
DMS_UI_URL = DMS_URL + 'deviceconsole/'
DMS_NC_URL = DMS_URL1 + 'networkconsole/'
DMS_NETWORK_CONSOLE_URL = DMS_URL + 'networkconsole/'
SO_TOOL_UI_URL = SO_TOOL_URL
SO_TOOL_DMS_NETWORK_CONSOLE_URL = SO_TOOL_DMS_URL + 'networkconsole/'

# Login to reports page Network console
DMS_Network_PAGE_URL= DMS_NETWORK_CONSOLE_URL + '#!dmsui-reports/?C0'

# DMS Network console login credentails
DMS_NC_UI_USER = 'dmsadmin'
DMS_NC_UI_PASSWORD = 'Airvana123!'

# SO-TOOL login credentails
SO_TOOL_UI_USER = 'soadmin'
SO_TOOL_UI_PASSWORD = 'password'

# DMS Device console login URL
#DMS_DEVICE_URL = '#!mv/dashboard/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
DMS_DEVICE_URL = '#!mv/dashboard/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
#DMS_DEVICE_URL = '#!mv/dashboard/?srchKey=MAC&id={device_macid}&dt=ONECELL5GDU&context=null'

# DMS device console login credentials
DMS_UI_USER = 'dmsadmin'
DMS_UI_PASSWORD = 'Airvana123!'

# 6.0 VES JOB
VES_JOB_DU='VES_du_Automation_working'
VES_JOB_CUCP='VES_cucp_Automation_working'
VES_JOB_CUUP='VES_cuup_Automation_working'


#gNB Alarm Job
CUCP_ALARM_RAISE_JOB = 'Raise_Alarm_CUCP'
CUCP_ALARM_CLEAR_JOB='Clear_Alarm_CUCP'
CUUP_ALARM_RAISE_JOB = 'Raise_Alarm_CUUP'
CUUP_ALARM_CLEAR_JOB='CLear_Alarm_CUUP'
DU_ALARM_RAISE_JOB = 'Raise_Alarm_DU'
DU_ALARM_CLEAR_JOB='Clear_Alarm_DU'
RP_ALARM_RAISE_JOB = 'Raise_Alarm_RP'
RP_ALARM_CLEAR_JOB='Clear_Alarm_RP'

# 6.0 VNF ID
CU_UP_DEVICE1_MACID = 'mjsimuauto-1101cuup1'
CU_CP_DEVICE1_MACID ='mjsimuauto-1101cucp1'
DU_DEVICE1_MACID ='mjsimuauto-1101du1'

# 6.0 Azmath-VNF ID
CU_UP_DEVICE2_MACID = 'drop2-3031cuup1'
CU_CP_DEVICE2_MACID ='drop2-3031cucp1'
DU_DEVICE2_MACID ='drop2-3031du1'

# 6.0 Venue ipsec VNF ID
CU_CP_VENUE_DEVICE1 = 'ipsec2-2051cucp1'
CU_UP_VENUE_DEVICE1 = 'ipsec2-2051cuup1'
DU_VENUE_DEVICE1 = 'ipsec2-2051du1'
BC_VENUE_DEVICE1 = '0005B9423AB2'
CU_UP_REAL_DEVICE_MACID='csblrlabsvtcc1ec16-1016cuup1'
CU_CP_REAL_DEVICE_MACID='csblrlabsvtcc1ec16-1016cucp1'
DU_REAL_DEVICE_MACID='csblrlabsvtcc1ec16-1016du1'

# 6.0 Min Mandatory test VNF ID
#CU_UP_MinMan_MACID = 'minmantest-7001cuup1'
#CU_CP_MinMan_MACID ='minmantest-7001cucp1'
#DU_MinMan_MACID ='minmantest-7001du1'

CU_CP_DEVICE22_MACID ='auto-4201cucp1'
CU_UP_DEVICE22_MACID ='auto-4201cuup1'
DU_DEVICE22_MACID ='auto-4201du1'

CU_CP_DEVICE23_MACID = 'alarmtest-8001cucp1'
CU_UP_DEVICE23_MACID = 'alarmtest-8001cuup1'
DU_DEVICE23_MACID ='alarmtest-8001du1'

#6.0 auto devices
CU_UP_auto2_MACID = 'auto2-2101cuup1'
CU_CP_auto2_MACID ='auto2-2101cucp1'
DU_auto2_MACID ='auto2-2101du1'
CU_UP_auto3_MACID = 'auto3-3101cuup1'
CU_CP_auto3_MACID ='auto3-3101cucp1'
DU_auto3_MACID ='auto3-3101du1'

# 6.0 VINOD Device ID's:
CU_CP_VNF_ID = 'sszblndrblr-7777cucp1'
CU_UP_VNF_ID = 'sszblndrblr-7777cuup1'
DU_VNF_ID = 'sszblndrblr-7777du1'
BC_ID = '0005B960A401'

CU_CP_DEVICE24_MACID = 'servicetest-1101cucp1'
CU_UP_DEVICE24_MACID = 'servicetest-1101cuup1'
DU_DEVICE24_MACID = 'servicetest-1101du1'

systemunmanaged_CP = 'autotest-101cucp1'
systemunmanaged_UP = 'autotest-101cuup1'
systemunmanaged_DU = 'autotest-501du1'

rutest_CP = 'ruentity-7001cucp1'
rutest_UP = 'ruentity-7001cuup1'
rutest_DU = 'ruentity-7001du1'

CP_DEVICE25_MACID = 'auto2-2101cucp1'
#CU_UP_DEVICE2_MACID = 'mjsimuauto-1101cuup1'
#CU_CP_DEVICE2_MACID ='mjsimuauto-1101cucp1'
#DU_DEVICE2_MACID ='mjsimuauto-1101du1'
#CU_UP_DEVICE2_MACID = 'resetrebootcomm-7001cuup1'
#CU_CP_DEVICE2_MACID = 'resetrebootcomm-7001cucp1'
#DU_DEVICE2_MACID = 'resetrebootcomm-7001du1'
#DU_RP_MACID='mjsimuauto-1101du1'
#DU_RP_MACID='resetrebootcomm-7001du1'

# Simulator Device 5.5

#DEVICE1_MACID = '0005B97C05'
#DEVICE2_MACID = '0005B9519F1'
DEVICE3_MACID = '0005B97A13'

DEVICE4_MACID = '0005B97A05'
DEVICE5_MACID = '0005B97A01' #REBOOT
DEVICE6_MACID = '0005B925A01' #REBOOT
#DEVICE7_MACID = '0005B911A02' #REBOOT
DEVICE8_MACID = '0005B97A02' #REBOOT
DEVICE10_MACID ='0005B97A15'
DEVICE11_MACID ='0005B97A03' #RESET
DEVICE12_MACID ='0005B97A04' #RESET
DEVICE13_MACID ='0005B925A03' #RESET
DEVICE14_MACID ='0005B925A04' #RESET
DEVICE15_MACID ='0005B97A09'
DEVICE16_MACID = '0005B97A06'
DEVICE17_MACID = '0005B97A07'
DEVICE18_MACID = '0005B97A08'
#DEVICE_NEW='0005B97C02'
#DEVICE_19_MACID = '0005B9519F2'
DEVICE19_MACID = '0005B9100A1'
DEVICE20_MACID='0005B97A18'
#DEVICE21_MACID='0005B925A04'
# Alarm
DEVICE_ALARM_MACID = '0005B9A503'
DEVICE_ALARM_Delete_MACID = '0005B9A504'
Test_Alarm_MACID = '0005B94238A0'
RP_MAC='0005B9423AB2'
RP_UPGRADE_DEVICE1 = '0005B97A13'

# Real Device 5.5
DEVICE21_MACID='0005B94238A0'
DEVICE22_MACID='0005B94238A0'
#DEVICE16_MACID ='0005B951FFB0' #Realdevice


BROWSER_ELEMENT_TIMEOUT = "60s"
REBOOT_WORKFLOW_TIMEOUT = "60s"
#SOFTWARE_VERSIONS = ['1.7.00.169', '4.0.00.169', '4.3.00.169', '4.5.00.169','5.5.00.100']
#SOFTWARE_VERSIONS = ['4.3.00.169', '4.5.00.169']

# Software Upgarde
SOFTWARE_VERSIONS = ['4.0.00.169', '4.3.00.169', '4.5.00.169','5.5.00.100','6.0.00.104']
SOFTWARE_VERSIONS_DOWNGRADE = ['6.0.00.104','5.5.00.100','6.0.00.104']
DEVICE_MACID = '00000000'

# URL to different page in DMS
DEVICE_RP_OVERRIDDEN_PARAM=DMS_UI_URL+'#!mv/rpdmsparams/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
DEVICE_RP_PROVSIONED_DATA=DMS_UI_URL+'#!mv/rpprovisioneddata/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
DEVICE_PROVSIONED_DATA=DMS_UI_URL+'#!mv/provisioneddata/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
#DEVICE_TIMING_SOURCE=DMS_UI_URL+'#!mv/timingsource/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
DEVICE_TIMING_SOURCE=DMS_UI_URL+'#!mv/timingsource/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
Device_list_URL=DMS_NETWORK_CONSOLE_URL + '#!dmsui-deviceList/?C0'
Proactive_job=DMS_NETWORK_CONSOLE_URL+ '#!dmsui-proactiveProvisioning/?C0'
DMS_Network_Console_Alarm_URL = DMS_NETWORK_CONSOLE_URL + '#!dmsui-systemAlarms/?C0'
DMS_Network_Console_Device_Alarm_URL = DMS_NETWORK_CONSOLE_URL + '#!dmsui-deviceAlarms/?C0'
DMS_NETWORK_DEVICE_LIST_PAGE_URL= DMS_NETWORK_CONSOLE_URL + '#!dmsui-deviceList/?C0'
DMS_NC_Health = DMS_NETWORK_CONSOLE_URL + '#!dmsui-dmsHealth/?C0'
DMS_NC_Network_License = DMS_NETWORK_CONSOLE_URL + '#!dmsui-network-unlicensed/?C0'
DMS_NC_Enterprise_View = DMS_NETWORK_CONSOLE_URL + '#!dmsui-enterpriseview/?C0'
DMS_NC_Network_SystemProperty = DMS_NETWORK_CONSOLE_URL + '#!dmsui-systemProperties/?C0'
DEVICE_CONSOLE_ALARM_PAGE_URL='{dms_device_console}#!mv/devicealarms/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
DEVICE_CONSOLE_ALARM_PAGE_URL_Delete = '{dms_device_console}#!mv/devicealarms/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
DEVICE_CONSOLE_TEST_ALARM_URL = '{dms_device_console}#!mv/devicealarms/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
DEVICE_CONSOLE_RPPAGE_URL='{dms_device_console}#!mv/rpinuseparams/?srchKey=MAC&id={device_macid}&dt=ONECELL5GDU&context=null'
RP_Mapping_Dashboard_URL = '{dms_device_console}#!mv/rpdashboard/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
RP_Mapping_Operational_URL = '{dms_device_console}#!mv/rpinuseparams/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
RP_Mapping_Provisioned_URL = '{dms_device_console}#!mv/rpprovisioneddata/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
RP_Mapping_DMS_Params_URL = '{dms_device_console}#!mv/rpdmsparams/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
RP_Mapping_WebGUI_Params_URL = '{dms_device_console}#!mv/rpwebuiparams/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
DMS_FILE_IMPORT_URL=DMS_NETWORK_CONSOLE_URL +'#!dmsui-fileImports/?C0'
DMS_FILE_IMPORT_URL1=DMS_NETWORK_CONSOLE_URL +'#!dmsui-importsSchedule/?C0'
#DEVICE_TIMING_SOURCE=DMS_UI_URL+'#!mv/timingsource/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
OPERATIONAL_PAGE=DMS_UI_URL+'#!mv/parameter/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
DEVICE_PROVSIONED_DATA_URL=DMS_UI_URL+'#!mv/provisioneddata/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
DEVICE_ENTITY_MAPPING_URL =DMS_UI_URL+ '#!mv/entitymappingparams/?srchKey=MAC&id={device_macid}&dt=ONECELL5GCU&context=null'


# File import location
BACKUP_RESTORE_FILE_LOCATION='\\robot\\properties\\File_For_Import\\LTE_Enterprise_C-RANSC_Cntrl_0005B97A18_SERVICECONFIGURATIONS.xml'
SETTINGS_FILE_LOCATION_profile='\\robot\\properties\\File_For_Import\\ServiceSetting_ONECELL_5.5_Automation.xml'
SERVER_IMPORT_PATH='/xmldb/appdata/dms/import/network/'
SERVER_FILE_COPY_FROM_PATH='/xmldb/appdata/dms/import/network/ServiceSetting_ONECELL_5.5_Automation.xml'
SERVER_COPY_TO_PATH='/xmldb/appdata/dms/import/network/success/'
IMPORT_POLICY_FILE_LOCATION = '\\robot\\properties\\File_For_Import\\policies2.zip'
SETTINGS_FILE_LOCATION_ENDC='\\robot\\properties\\File_For_Import\\ServiceSetting_ONECELL_6.0_ENDC.xml'
SETTINGS_FILE_LOCATION_Config_Change='\\robot\\properties\\File_For_Import\\ServiceSetting_ONECELL_5.5_MinMand.xml'
SERVER_IMPORT_PATH1='/xmldb/appdata/dms/import/network/auto'
Factory_Import_Path= '/xmldb/appdata/dms/import/factory/auto'
Schedule_Factory_File_Location= '\\robot\\properties\\File_For_Import\\GEDF_factory_v55.xml'
GSV_File_Location='\\robot\\properties\\File_For_Import\\GoldStandardValue.xml'
GSV_Import_Path='/xmldb/appdata/dms/import/goldstandard'
OmKPi_File_Location='\\robot\\properties\\File_For_Import\\0005B9-LTE_Enterprise_C-RANSC_Cntrl_sectorkpi.csv'
OmKPi_Import_Path='/xmldb/appdata/dms/import/scan'
SS_File_Location= '\\robot\\properties\\File_For_Import\\servicesetting_onecell_4.5_Test.xml'


# Webgui ip

#DEVICE_IP='10.194.158.1:6002'
#DEVICE_IP='10.194.157.1:6002'
#DEVICE_IP='10.194.2.5:6002'
DEVICE_IP='10.187.1.10:6002'
DMS_WEBGUI_URL='https://'+DEVICE_IP+'/login/?next=/ManagementDashBoard/'
DMS_WEBGUI_UI_USER = 'admin'
DMS_WEBGUI_UI_PASSWORD = 'admin1234'
WEBUI_CONSOLE=DMS_UI_URL+'#!mv/webuiparams/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'




REAl_DEVICE_RESET_TIMEOUT='720s'
REAl_DEVICE_REBOOT_TIMEOUT='720s'
REAL_DEVICE_REPLAN_TIMEOUT='200s'

# 6.0 import file location
NETCONF_FILE_LOCATION = '\\robot\\properties\\File_For_Import\\netconfmount_Automation.xml'
NETCONF_FILE_IMPORT_PATH = '/xmldb/appdata/dms/import/netconfmount'
NETCONFauto2_FILE_LOCATION = '\\robot\\properties\\File_For_Import\\netconfmountauto2_Automation.xml'
NETCONFauto3_FILE_LOCATION = '\\robot\\properties\\File_For_Import\\netconfmountauto3_Automation.xml'


CUCP_SS_FILE_LOCATION = '\\robot\\properties\\File_For_Import\\ServiceSetting_ONECELL5GCU_CP_NC_Automation.xml'
CUUP_SS_FILE_LOCATION = '\\robot\\properties\\File_For_Import\\ServiceSetting_ONECELL5GCU_UP_NC_Automation.xml'
DU_SS_FILE_LOCATION = '\\robot\\properties\\File_For_Import\\ServiceSetting_ONECELL5GDU_NC_Automation.xml'
SS_FILE_IMPORT_PATH = '/xmldb/appdata/dms/import/network'

FACTORY_FILE_LOCATION = "\\robot\\properties\\File_For_Import\\GEDF_factory_NW.xml"
FACTORY_FILE_IMPORT_PATH = '/xmldb/appdata/dms/import/factory'

CU_CP_SETTINGS_FILE_LOCATION = '\\robot\\properties\\File_For_Import\\successSetting_ONECELL5GCU_cucp-base.xml'
CU_UP_SETTINGS_FILE_LOCATION = '\\robot\\properties\\File_For_Import\\successSetting_ONECELL5GCU_cuup-base.xml'
DU_SETTINGS_FILE_LOCATION = '\\robot\\properties\\File_For_Import\\ServiceSetting_ONECELL5GDU_Automation.xml'
DEVICE_OVERWRRIDDEN_PARAMETER = '{dms_device_console}#!mv/configuration/?srchKey=MAC&id={device_macid}&dt=onecell&context=null'
DEVICE_OVERWRRIDDEN_PARAMETER_DU = '{dms_device_console}#!mv/configuration/?srchKey=MAC&id={device_macid}&dt=ONECELL5GDU&context=null'
DEVICE_OVERWRRIDDEN_PARAMETER_CU='{dms_device_console}#!mv/configuration/?srchKey=MAC&id={device_macid}&dt=ONECELL5GCU&context=null'

NETWORK_CONSOLE_SERVICE_PACKAGE = DMS_NETWORK_CONSOLE_URL + '#!dmsui-servicePackage/?C0'
NETWORK_CONSOLE_SYSTEM_ALARM_PAGE = DMS_NETWORK_CONSOLE_URL + '#!dmsui-systemAlarms/?C0'

VENUE_FILE_LOCATION= '\\robot\\properties\\File_For_Import\\Automation_Venue.zip'
VENUE_UPDATED_FILE_LOCATION = '\\robot\\properties\\File_For_Import\\Automation_Venue_Updated.zip'
VENUE_FILE_IMPORT_PATH='/xmldb/appdata/dms/import/venue'

ENTITYMAPPING_FILE_LOCATION='\\robot\\properties\\File_For_Import\\Automation-ipsec2-device-entity.xml'
ENTITYMAPPING_FILE_IMPORT_PATH='/xmldb/appdata/dms/import/entitymapping'
ENTITYMAPPING_DEL_FILE_LOCATION = '\\robot\\properties\\File_For_Import\\Automation-ipsec2-device-entity_remove.xml'

NETCONF_FILE_IMPORT_INVALID_KEY_PATH='\\robot\\properties\\File_For_Import\\Test_keys.zip'
NETCONF_FILE_IMPORT_VALID_KEY_PATH='\\robot\\properties\\File_For_Import\\Correct_Keys.zip'

CU_CP_MinMand_SETTINGS_FILE_LOCATION='\\robot\\properties\\File_For_Import\\successSetting_MinMand_ONECELL5GCU_cucp-base.xml'
CU_UP_MinMand_SETTINGS_FILE_LOCATION='\\robot\\properties\\File_For_Import\\successSetting_MinMand_ONECELL5GCU_cuup-base.xml'
DU_MinMand_SETTINGS_FILE_LOCATION='\\robot\\properties\\File_For_Import\\ServiceSetting_MinMand_ONECELL5GDU_base.xml'

DEVICE_HISTORY_PARAMETER_CU='{dms_device_console}#!mv/devicehistory/?srchKey=MAC&id={device_macid}&dt=ONECELL5GCU&context=null'
DEVICE_HISTORY_PARAMETER_DU = '{dms_device_console}#!mv/devicehistory/?srchKey=MAC&id={device_macid}&dt=ONECELL5GDU&context=null'
DEVICE_PROVSIONED_DATA_CUCP='{dms_device_console}#!mv/provisioneddata/?srchKey=MAC&id={device_macid}&dt=ONECELL5GCU&context=null'
DEVICE_gNB_PROVISIONING_DATA_PAGE='{dms_device_console}#!mv/provisioneddata/?srchKey=MAC&id={device_macid}&dt=ONECELL5GDU&context=null'
DEVICE_gNB_PROVISIONING_STATUS_PAGE='{dms_device_console}#!mv/provisioningStatus/?srchKey=MAC&id={device_macid}&dt=ONECELL5GDU&context=null'
DEVICE_gNB_pnp_PAGE_DU='{dms_device_console}#!mv/devicepnp/?srchKey=MAC&id={device_macid}&dt=ONECELL5GDU&context=null'
DEVICE_gNB_pnp_PAGE_CP='{dms_device_console}#!mv/devicepnp/?srchKey=MAC&id={device_macid}&dt=ONECELL5GCU&context=null'
DEVICE_gNB_OVERIDDEN_PAGE='{dms_device_console}#!mv/configuration/?srchKey=MAC&id={device_macid}&dt=ONECELL5GCU&context=null'
DEVICE_gNB_OVERIDDEN_PAGE_DU='{dms_device_console}#!mv/configuration/?srchKey=MAC&id={device_macid}&dt=ONECELL5GDU&context=null'
DEVICE_gNB_PROVISIONING_STATUS_PAGE_CU='{dms_device_console}#!mv/provisioningStatus/?srchKey=MAC&id={device_macid}&dt=ONECELL5GCU&context=null'
ALARM_PARAMETER_CU ='{dms_device_console}#!mv/devicealarms/?srchKey=MAC&id={device_macid}&dt=ONECELL5GCU&context=null'
ALARM_PARAMETER_DU ='{dms_device_console}#!mv/devicealarms/?srchKey=MAC&id={device_macid}&dt=ONECELL5GDU&context=null'
FIRMWARE_UPGRADE_IMAGE_URL= DMS_NETWORK_CONSOLE_URL + '#!dmsui-firmwareImage/?C0'
FIRMWARE_UPGRADE_MANAGE_URL = DMS_NETWORK_CONSOLE_URL + '#!dmsui-manageUpgrade/?C0'

Realdevicemacaddress='0005B951FFB0'
#DMS_UI_URL_RealDevice='http://13.233.127.191:7001/deviceconsole/'
DMS_UI_URL_RealDevice='http://35.154.215.135:7001/deviceconsole/'
#DMS_NP_UI_URL_RealDevice='http://13.233.127.191:7001/networkconsole/'
DMS_NP_UI_URL_RealDevice='http://35.154.215.135:7001/networkconsole/'
DMS_CERTIFICATE_DOWNLOAD=DMS_UI_URL_RealDevice+'#!mv/rpdmsparams/?srchKey=MAC&id=0005B951FFB0&dt=onecell&context=null'
RP_PARM_PAGE=DMS_UI_URL_RealDevice+'#!mv/rpinuseparams/?srchKey=MAC&id=0005B951FFB0&dt=onecell&context=null'

CU_CP_POLICY_LOCATION = '\\robot\\properties\\File_For_Import\\Import_CP_Policies.zip'
CU_UP_POLICY_LOCATION = '\\robot\\properties\\File_For_Import\\Import_UP_Policies.zip'
DU_POLICY_LOCATION = '\\robot\\properties\\File_For_Import\\Import_DU_Policies.zip'

DMS_Realdevice_Policy_Page=DMS_UI_URL_RealDevice+'#!mv/deviceaction/?srchKey=MAC&id=0005B951FFB0&dt=onecell&context=null'
DMS_Realdevice_NetworkPolicy_Page=DMS_NP_UI_URL_RealDevice+'#!dmsui-bulkNetworkPolicy/?C0'

DEVICE_HISTORY_PARAMETER_DU_RealDevice = DMS_UI_URL_RealDevice+'#!mv/devicehistory/?srchKey=MAC&id={device_macid}&dt=ONECELL5GDU&context=null'
MOUNT_UMANAGED_FILE_LOCATION = '\\robot\\properties\\File_For_Import\\Netconf_VNF_Unmanaged.xml'

VENUE_FILE_LOCATION= '\\robot\\properties\\File_For_Import\\Automation_Venue.zip'
VENUE_FILE_LOCATION_SO_TOOL= '\\robot\\properties\\File_For_Import\\venue-drop2.zip'
NETCONFMOUNT_FILE_LOCATION_SO_TOOL='\\robot\properties\File_For_Import\\netconfmount_Drop2.zip'
NETCONFMOUNT_FILE_IMPORT_PATH= '\\xmldb\\appdata\\dms\\import\\netconfmount'
ENTITYMAPPING_FILE_LOCATION_SO_TOOL='\\robot\\service_setting_files\\ATT-drop2-device-entity.xml'
ENTITYMAPPING_FILE_IMPORT_PATH='\\xmldb\\appdata\\dms\\import\\entitymapping'
VENUE_UPDATED_FILE_LOCATION = '\\robot\\properties\\File_For_Import\\Automation_Venue_Updated.zip'
VENUE_FILE_IMPORT_PATH='\\xmldb\\appdata\\dms\\import\\venue'
CUCP_SS_FILE_LOCATION_SO_TOOL='\\robot\\service_setting_files\\serviceSetting_ONECELL5GCU_cucp-base-drop2.xml'
CUUP_SS_FILE_LOCATION_SO_TOOL='\\robot\\service_setting_files\\serviceSetting_ONECELL5GCU_cuup-base-drop2.xml'
DU_SS_FILE_LOCATION_SO_TOOL='\\robot\\service_setting_files\\serviceSetting_ONECELL5GDU_base-drop2.xml'
SOTOOL_FILE_IMPORT_PATH='\\xmldb\\appdata\\dms\\import\\network'
RP_Mapping_Dashboard_URL_DU = '{dms_device_console}#!mv/rpdashboard/?srchKey=MAC&id={device_macid}&dt=ONECELL5GDU&context=null'
DU_SETTINGS_FILE_LOCATION_whitelist='\\robot\\properties\\File_For_Import\\ServiceSetting_ONECELL5GDU_whitelist.xml'

Schedule_EntityMapping_File_Location = '\\robot\\properties\\File_For_Import\\Automation-alarmtest-device-auto-entity.xml'
Entity_Auto_Import_Path = '/xmldb/appdata/dms/import/entitymapping/auto'
SERVICE_SETTING_AUTO_IMPORT_PATH = '/xmldb/appdata/dms/import/network/auto'
Schedule_6_0_ServiceSetting_File_Location = '\\robot\\properties\\File_For_Import\\ServiceSetting_ONECELL_AutoImport_6.0.xml'
CP_ProfileAssociation_Location = '\\robot\\properties\\File_For_Import\\ServiceSetting_ONECELL5GCU_ProfileAssociateAuto.xml'
UP_ProfileAssociation_Location = '\\robot\\properties\\File_For_Import\\ServiceSetting_ONECELL5GUP_ProfileAssociateAuto.xml'
DU_ProfileAssociation_Location = '\\robot\\properties\\File_For_Import\\ServiceSetting_ONECELL5GDU_ProfileAssociateAuto.xml'


BC_NW_Factory_File_Location= '\\robot\\properties\\File_For_Import\\GEDF_factory_BC_NW.xml'
GSV_File_Location_for_5G='\\robot\\properties\\File_For_Import\\Automation_Venue-Venue.txt'
GSV_Schedule_Import_Path='/xmldb/appdata/dms/import/goldstandard/auto'
DEVICE_gNB_DASHBOARD_PAGE_CU='{dms_device_console}#!mv/dashboard/?srchKey=MAC&id={device_macid}&dt=ONECELL5GCU&context=null'
DEVICE_gNB_DASHBOARD_PAGE_DU='{dms_device_console}#!mv/dashboard/?srchKey=MAC&id={device_macid}&dt=ONECELL5GDU&context=null'