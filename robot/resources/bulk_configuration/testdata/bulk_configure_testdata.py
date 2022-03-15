# Device Filter
DEVICE_FILTER = 'Automation_Bulk'
#DEVICE_MACID_LIST = {'0005B911A03', '0005B911A04'}
#DEVICE_MACID_LIST_BOOT = {'0005B911A01','0005B911A02'}
DEVICE_MACID_LIST = {'0005B925A03', '0005B925A04'}
DEVICE_MACID_LIST_BOOT = {'0005B925A01','0005B925A02'}
BULK_CONFIG_DICT = {'Device Filter': DEVICE_FILTER, 'Device MACID List': DEVICE_MACID_LIST}
BULK_CONFIG_DICT_BOOT = {'Device Filter': DEVICE_FILTER, 'Device MACID List Boot': DEVICE_MACID_LIST_BOOT}
# RFparameters
UplinkBandwidth = 50
DownlinkBandwidth = 50
RF_PARAM_DICT = {'Uplink Bandwidth': UplinkBandwidth, 'Downlink Bandwidth': DownlinkBandwidth}
# PLMNparameters
PLMN_INDEX = 1
PLMN_ALIAS = "cpe-1239"
PLMN_ID = "123320"
PLMN_PARAM_DICT = {'DC_PLMN': PLMN_INDEX, 'Alias': PLMN_ALIAS, 'PLMNID': PLMN_ID}
# LTEparaters
LTE_INDEX = 1
LTE_CARRIER = 222
LTE_PHYCELLID = 154
LTE_ALIAS = "dms-test-neighbor-24"
LTE_PLMNID = "123431"
LTE_CID = '224'
LTE_RST = '-26'
LTE_TAC = '2'
LTE_PARAM_DICT = {'DC_LteNeighborList': LTE_INDEX, 'EUTRACarrierARFCN': LTE_CARRIER, 'PhyCellID': LTE_PHYCELLID,
                  'Alias': LTE_ALIAS, 'PLMNID': LTE_PLMNID, 'CID': LTE_CID, 'RSTxPower': LTE_RST, 'TAC': LTE_TAC}
# ECSFBparameters
ECSFB_MULTIPLENID = 0
ECSFB_MULTIPLESID = 1
ECSFB_HOMEREG = 0
ECSFB_PARAM_DICT = {'Multiple NID': ECSFB_MULTIPLENID, 'Multiple SID': ECSFB_MULTIPLESID, 'Home Reg': ECSFB_HOMEREG}
# DAS Driver Parameters
DAS_MODE = 'TRUE'
DAS_RTT_DELAY = 314
DAS_PARAM_DICT = {'Enable DAS Mode': DAS_MODE, 'RTT': DAS_RTT_DELAY}
# QAM Parameters
QAM_DL_256 = 'FALSE'
QAM_UL_64 = 'FALSE'
QAM_PARAM_DICT = {'Enable DL 256 QAM': QAM_DL_256, 'Enable UL 64 QAM': QAM_UL_64}
# RP5000 Parameters
 # Scalar
RP5000_FIRMWARE_UPGD = 'TRUE'
RP5000_PLATFORM_MGMT = 'TRUE'
 # Tabular
RP5000_Index = 1
RP5000_PART_NO = 1234565
RP5000_SCALAR_PARAM_DICT = {'Enable RP5000 Firmware Upgrade': RP5000_FIRMWARE_UPGD, 'Enable Platform Management': RP5000_PLATFORM_MGMT}
RP5000_TABULAR_PARAM_DICT = {'DC_SlotRes': RP5000_Index, 'PartNumber': RP5000_PART_NO}
# Core Network Parameter
CNP_SECURITY_GATEWAY_SERVER2 = '10.2.212.34'
CNP_SECURITY_GATEWAY2_SERVER2 = '10.2.212.38'
CNP_LOCAL_TIME_ZONE = 'IST+5:00'
CNP_PARAM_DICT = {'Security Gateway Server2': CNP_SECURITY_GATEWAY_SERVER2, 'Security Gateway2 Server2': CNP_SECURITY_GATEWAY2_SERVER2, 'Local Time Zone': CNP_LOCAL_TIME_ZONE}
# Carrier Aggregation
CA_DOWNLINK_CA = 'TRUE'
CA_PARAM_DICT = {'Downlink CA': CA_DOWNLINK_CA}
# LTE Neighbor List
LTE_NL_X2_PCI_CONFIG = 'TRUE'
LTE_NL_X2_MAX_LINKS = 2
LTE_NL_X2_ENABLE = 'FALSE'
#LTE_NL_PARAM_DICT = {'X2 Triggered Pci Reconfig Allowed': LTE_NL_X2_PCI_CONFIG, 'Maximum Number of X2 Links': LTE_NL_X2_MAX_LINKS, 'X2 Enable': LTE_NL_X2_ENABLE}
LTE_NL_PARAM_DICT = {'X2 Triggered Pci Reconfig Allowed': LTE_NL_X2_PCI_CONFIG, 'Maximum Number of LTE X2 links': LTE_NL_X2_MAX_LINKS, 'X2 Enable': LTE_NL_X2_ENABLE}
LTE_NL_PARAM_DICT3 = {'X2 Triggered Pci Reconfig Allowed': LTE_NL_X2_PCI_CONFIG, 'Maximum Number of LTE X2 links': LTE_NL_X2_MAX_LINKS, 'X2 Enable': LTE_NL_X2_ENABLE}
LTE_NL_X2_PCI_CONFIG1 = 'FALSE'
LTE_NL_X2_MAX_LINKS1 = 3
LTE_NL_X2_ENABLE1 = 'TRUE'
LTE_NL_PARAM_DICT2 = {'X2 Triggered Pci Reconfig Allowed': LTE_NL_X2_PCI_CONFIG1, 'Maximum Number of LTE X2 links': LTE_NL_X2_MAX_LINKS1, 'X2 Enable': LTE_NL_X2_ENABLE1}
#LTE_NL_PARAM_DICT1 = {'X2 Triggered Pci Reconfig Allowed': LTE_NL_X2_PCI_CONFIG1, 'Maximum Number of X2 Links': LTE_NL_X2_MAX_LINKS1, 'X2 Enable': LTE_NL_X2_ENABLE1}
# File Transfer
FT_INDEX = 1
FT_FILE_SERVER_URL = 'ftp://10.211.240.177'
FT_USERNAME = 'dmsadmin'
FT_PASSWORD = 'airvana123'
FT_FILE_TYPE_INDEX = 1
FT_FILE_TYPE_VALUE = 'DEBUG'
FT_FILE_TYPE_WIN_START_TIME = '05:30'
FT_FILE_TYPE_WIN_DURATION = 160
FT_FILE_TYPE_WIN_INTERVAL = 1020
FT_FILE_TYPE = {}


Security_Gateway_Server1='10.125.10.1'
Security_Gateway_Server2='10.125.10.2'
Security_Gateway_Server3='10.125.10.3'
Security_Gateway_Server4='10.125.10.4'
Core_Network_parameter_dict1={'Security Gateway Server1':Security_Gateway_Server1,'Security Gateway Server2':Security_Gateway_Server2,
                              'Security Gateway2 Server1':Security_Gateway_Server3,'Security Gateway2 Server2':Security_Gateway_Server4}


Security_Gateway_Server5='10.125.10.5'
Security_Gateway_Server6='10.125.10.6'
Security_Gateway_Server7='10.125.10.7'
Security_Gateway_Server8='10.125.10.8'
Core_Network_parameter_dict={'Security Gateway Server1':Security_Gateway_Server5,'Security Gateway Server2':Security_Gateway_Server6,
                              'Security Gateway2 Server1':Security_Gateway_Server7,'Security Gateway2 Server2':Security_Gateway_Server8}

DL_Bandwidth="75"
UL_Bandwidth="75"
Device_RF_parameter_dict1={'Downlink Bandwidth':DL_Bandwidth,'Uplink Bandwidth':UL_Bandwidth}

UplinkBandwidth = 100
DownlinkBandwidth = 100
RF_PARAM_DICT = {'Uplink Bandwidth': UplinkBandwidth, 'Downlink Bandwidth': DownlinkBandwidth}

Network_Param_config_mac='0005B925A04'
#Network_Param_config_mac='0005B911A04'
Device_Job_name='Test_Device_Param'
Network_Job_name='Test_Network_Param'
Network_Operation_type='Network Related Replan'
Device_Operation_type='Device Related Replan'
#Device_Param_config_mac='0005B911A04'
Device_Param_config_mac='0005B925A04'
Reset_job_name='Test_Factory_Reset'
Reset_Opeartion_Type='Factory Reset'
Reboot_job_name='Test_Reboot'
Reboot_Opeartion_Type='Reboot'
Rechability_job_name='Test_Rechability'
Rechability_Opeartion_Type='Reachability Check'
Frequency_type='Minutes'

#REACHABILITY_DEVICE = '0005B94238A0'
REACHABILITY_DEVICE = '0005B925A04'

PLMN_INFO_LIST_MCC1 = 310
PLMN_INFO_LIST_MNC1 = 410
PLMN_INFO_LIST_MCC2 = 220
PLMN_INFO_LIST_MNC2 = 550
CUCP_NR_CELL_PARAM_DICT1 = {'PLMNInfoList.mcc': PLMN_INFO_LIST_MCC1, 'PLMNInfoList.mnc': PLMN_INFO_LIST_MNC1}
CUCP_NR_CELL_PARAM_DICT2 = {'PLMNInfoList.mcc': PLMN_INFO_LIST_MCC2, 'PLMNInfoList.mnc': PLMN_INFO_LIST_MNC2}

HB_PERIOD1 = 10
HB_PERIOD2 = 15
HB_PARAM_DICT1 = {'Heartbeat Period (minutes)': HB_PERIOD1}
HB_PARAM_DICT2 = {'Heartbeat Period (minutes)': HB_PERIOD2}

VES_COLLECTOR_URL1 = 'https://10.212.2.12:7001/eventListener/v7'
VES_COLLECTOR_USERNAME1 = 'vesadmin'
VES_COLLECTOR_PASSWORD1 = 'Commscope@123!'
VES_COLLECTOR_URL2 = 'https://10.212.2.22:7001/eventListener/v7'
VES_COLLECTOR_USERNAME2 = 'dmsvesadmin'
VES_COLLECTOR_PASSWORD2 = 'CommScope@789!'
VES_COLLECTOR_PARAM_DICT1 = {'VES Collector URL': VES_COLLECTOR_URL1, 'Username': VES_COLLECTOR_USERNAME1, 'Password': VES_COLLECTOR_PASSWORD1}
VES_COLLECTOR_PARAM_DICT2 = {'VES Collector URL': VES_COLLECTOR_URL2, 'Username': VES_COLLECTOR_USERNAME2, 'Password': VES_COLLECTOR_PASSWORD2}

GNBID_LENGTH1 = '26'
GNBID_LENGTH2 = '23'
CUUP_GNBID_LENGTH_PARAM_DICT1 = {'gNB ID Length': GNBID_LENGTH1}
CUUP_GNBID_LENGTH_PARAM_DICT2 = {'gNB ID Length': GNBID_LENGTH2}

NR_PCI1 = '15'
NR_PCI2 = '12'
NR_ARFCNDL1 = '1100'
NR_ARFCNDL2 = '1200'
NR_ARFCNUL1 = '110'
NR_ARFCNUL2 = '120'
NR_DL_BW1 = '10'
NR_DL_BW2 = '20'
NR_UL_BW1 = '10'
NR_UL_BW2 = '20'
NR_FREQ_BAND_DL1 = '40'
NR_FREQ_BAND_DL2 = '66'
NR_RSI1 = '130'
NR_RSI2 = '120'
NRCELL_CONFIG_PARAMS_DICT1 = {'NR PCI': NR_PCI1, 'ARFCN DL': NR_ARFCNDL1, 'ARFCN UL': NR_ARFCNUL1, 'DL BS Channel BW (MHz)': NR_DL_BW1, 'UL BS Channel BW (MHz)': NR_UL_BW1, 'NR Frequency Band DL': NR_FREQ_BAND_DL1, 'Root Sequence Index': NR_RSI1}
NRCELL_CONFIG_PARAMS_DICT2 = {'NR PCI': NR_PCI2, 'ARFCN DL': NR_ARFCNDL2, 'ARFCN UL': NR_ARFCNUL2, 'DL BS Channel BW (MHz)': NR_DL_BW2, 'UL BS Channel BW (MHz)': NR_UL_BW2, 'NR Frequency Band DL': NR_FREQ_BAND_DL2, 'Root Sequence Index': NR_RSI2}

BULK_CUCP_FILTER = 'Automation_Bulk_CUCP'
CUCP_VNF_LIST = {'sszblndrblr-7777cucp1'}
CUCP_BULK_CONFIG_DICT = {'Device Filter': BULK_CUCP_FILTER, 'CUCP VNF List': CUCP_VNF_LIST}

BULK_CUUP_FILTER = 'Automation_Bulk_CUUP'
CUUP_VNF_LIST = {'sszblndrblr-7777cuup1','sszblndrblr-7778cuup1'}
CUUP_BULK_CONFIG_DICT = {'Device Filter': BULK_CUUP_FILTER, 'CUUP VNF List': CUUP_VNF_LIST}

BULK_DU_FILTER = 'Automation_Bulk_DU'
DU_VNF_LIST = {'sszblndrblr-7777du1','sszblndrblr-7778du1'}
DU_BULK_CONFIG_DICT = {'Device Filter': BULK_DU_FILTER, 'DU VNF List': DU_VNF_LIST}
