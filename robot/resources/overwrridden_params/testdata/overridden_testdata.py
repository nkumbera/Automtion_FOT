# RFparameters
UplinkBandwidth = 100
DownlinkBandwidth = 100
RF_PARAM_DICT = {'Uplink Bandwidth': UplinkBandwidth, 'Downlink Bandwidth': DownlinkBandwidth}
UplinkBandwidth1 = 75
DownlinkBandwidth1 = 75
RF_PARAM_DICT1 = {'Uplink Bandwidth': UplinkBandwidth1, 'Downlink Bandwidth': DownlinkBandwidth1}
# PLMNparameters
PLMN_INDEX = 1
PLMN_ALIAS = "cpe-559"
PLMN_ID = "123458"
PLMN_PARAM_DICT = {'DC_PLMN': PLMN_INDEX, 'Alias': PLMN_ALIAS, 'PLMNID': PLMN_ID}
PLMN_INDEX1 = 2
PLMN_ALIAS1 = "cpe-560"
PLMN_ID1 = "123459"
PLMN_PARAM_DICT1 = {'DC_PLMN': PLMN_INDEX1, 'Alias': PLMN_ALIAS1, 'PLMNID': PLMN_ID1}
# LTEparaters
LTE_INDEX = 1
LTE_CARRIER = 228
LTE_PHYCELLID = 159
LTE_ALIAS = "dms-test-neighbor-12"
LTE_PLMNID = "123446"
LTE_CID = '222'
LTE_RST = '-30'
LTE_TAC = '2'
LTE_PARAM_DICT = {'DC_LteNeighborList': LTE_INDEX, 'EUTRACarrierARFCN': LTE_CARRIER, 'PhyCellID': LTE_PHYCELLID,
                  'Alias': LTE_ALIAS, 'PLMNID': LTE_PLMNID, 'CID': LTE_CID, 'RSTxPower': LTE_RST, 'TAC': LTE_TAC}

LTE_INDEX1 = 2
LTE_CARRIER1 = 229
LTE_PHYCELLID1 = 160
LTE_ALIAS1 = "dms-test-neighbor-13"
LTE_PLMNID1 = "123447"
LTE_CID1 = '223'
LTE_RST1 = '-31'
LTE_TAC1 = '3'
LTE_PARAM_DICT1 = {'DC_LteNeighborList': LTE_INDEX1, 'EUTRACarrierARFCN': LTE_CARRIER1, 'PhyCellID': LTE_PHYCELLID1,
                  'Alias': LTE_ALIAS1, 'PLMNID': LTE_PLMNID1, 'CID': LTE_CID1, 'RSTxPower': LTE_RST1, 'TAC': LTE_TAC1}

# ECSFBparameters
ECSFB_MULTIPLENID = 1
ECSFB_MULTIPLESID = 0
ECSFB_HOMEREG = 1
ECSFB_PARAM_DICT = {'Multiple NID': ECSFB_MULTIPLENID, 'Multiple SID': ECSFB_MULTIPLESID, 'Home Reg': ECSFB_HOMEREG}
ECSFB_MULTIPLENID1 = 0
ECSFB_MULTIPLESID1 = 1
ECSFB_HOMEREG1 = 0
ECSFB_PARAM_DICT1 = {'Multiple NID': ECSFB_MULTIPLENID1, 'Multiple SID': ECSFB_MULTIPLESID1, 'Home Reg': ECSFB_HOMEREG1}
ECSFB_MULTIPLENID2 = 0
ECSFB_MULTIPLESID2 = 0
ECSFB_HOMEREG2 = 0
ECSFB_PARAM_DICT2 = {'Multiple NID': ECSFB_MULTIPLENID2, 'Multiple SID': ECSFB_MULTIPLESID2, 'Home Reg': ECSFB_HOMEREG2}

# DAS Driver Parameters
DAS_MODE = 'FALSE'
DAS_RTT_DELAY = 600
DAS_PARAM_DICT = {'Enable DAS Mode': DAS_MODE, 'RTT': DAS_RTT_DELAY}

DAS_MODE1 = 'TRUE'
DAS_RTT_DELAY1 = 601
DAS_PARAM_DICT1 = {'Enable DAS Mode': DAS_MODE1, 'RTT': DAS_RTT_DELAY1}

# QAM Parameters
QAM_DL_256 = 'TRUE'
QAM_UL_64 = 'TRUE'
QAM_PARAM_DICT = {'Enable DL 256 QAM': QAM_DL_256, 'Enable UL 64 QAM': QAM_UL_64}

AM_DL_256_1 = 'FALSE'
QAM_UL_64_1 = 'FALSE'
QAM_PARAM_DICT1 = {'Enable DL 256 QAM': AM_DL_256_1, 'Enable UL 64 QAM': QAM_UL_64_1}

# RP5000 Parameters
 # Scalar
RP5000_FIRMWARE_UPGD = 'FALSE'
RP5000_PLATFORM_MGMT = 'FALSE'
RP5000_SCALAR_PARAM_DICT = {'Enable RP5000 Firmware Upgrade': RP5000_FIRMWARE_UPGD, 'Enable Platform Management': RP5000_PLATFORM_MGMT}

RP5000_FIRMWARE_UPGD1 = 'TRUE'
RP5000_PLATFORM_MGMT1 = 'TRUE'
RP5000_SCALAR_PARAM_DICT1= {'Enable RP5000 Firmware Upgrade': RP5000_FIRMWARE_UPGD1, 'Enable Platform Management': RP5000_PLATFORM_MGMT1}

 # Tabular
RP5000_Index = 1
RP5000_PART_NO = 1234569
RP5000_TABULAR_PARAM_DICT = {'DC_SlotRes': RP5000_Index, 'PartNumber': RP5000_PART_NO}

RP5000_Index1 = 2
RP5000_PART_NO1 = 1234570
RP5000_TABULAR_PARAM_DICT1 = {'DC_SlotRes': RP5000_Index1, 'PartNumber': RP5000_PART_NO1}
# Core Network Parameter
CNP_SECURITY_GATEWAY_SERVER2 = '10.2.212.38'
CNP_SECURITY_GATEWAY2_SERVER2 = '10.2.212.39'
CNP_LOCAL_TIME_ZONE = 'IST+6:30'
CNP_PARAM_DICT = {'Security Gateway Server2': CNP_SECURITY_GATEWAY_SERVER2, 'Security Gateway2 Server2': CNP_SECURITY_GATEWAY2_SERVER2, 'Local Time Zone': CNP_LOCAL_TIME_ZONE}

CNP_SECURITY_GATEWAY_SERVER1 = '10.2.212.40'
CNP_SECURITY_GATEWAY2_SERVER1 = '10.2.212.41'
CNP_LOCAL_TIME_ZONE1 = 'IST+5:30'
CNP_PARAM_DICT1 = {'Security Gateway Server2': CNP_SECURITY_GATEWAY_SERVER1, 'Security Gateway2 Server2': CNP_SECURITY_GATEWAY2_SERVER1, 'Local Time Zone': CNP_LOCAL_TIME_ZONE1}

# Carrier Aggregation
CA_DOWNLINK_CA = 'FALSE'
CA_PARAM_DICT = {'Downlink CA': CA_DOWNLINK_CA}

CA_DOWNLINK_CA1 = 'TRUE'
CA_PARAM_DICT1 = {'Downlink CA': CA_DOWNLINK_CA1}

# LTE Neighbor List
LTE_NL_X2_PCI_CONFIG = 'FALSE'
LTE_NL_X2_MAX_LINKS = 3
LTE_NL_X2_ENABLE = 'FALSE'
#LTE_NL_PARAM_DICT = {'X2 Triggered Pci Reconfig Allowed': LTE_NL_X2_PCI_CONFIG, 'Maximum Number of X2 Links': LTE_NL_X2_MAX_LINKS, 'X2 Enable': LTE_NL_X2_ENABLE}
LTE_NL_PARAM_DICT = {'X2 Triggered Pci Reconfig Allowed': LTE_NL_X2_PCI_CONFIG, 'Maximum Number of LTE X2 links': LTE_NL_X2_MAX_LINKS, 'X2 Enable': LTE_NL_X2_ENABLE}
LTE_NL_X2_PCI_CONFIG1 = 'TRUE'
LTE_NL_X2_MAX_LINKS1 = 4
LTE_NL_X2_ENABLE1 = 'TRUE'
#LTE_NL_PARAM_DICT1 = {'X2 Triggered Pci Reconfig Allowed': LTE_NL_X2_PCI_CONFIG1, 'Maximum Number of X2 Links': LTE_NL_X2_MAX_LINKS1, 'X2 Enable': LTE_NL_X2_ENABLE1}
LTE_NL_PARAM_DICT1 = {'X2 Triggered Pci Reconfig Allowed': LTE_NL_X2_PCI_CONFIG1, 'Maximum Number of LTE X2 links': LTE_NL_X2_MAX_LINKS1, 'X2 Enable': LTE_NL_X2_ENABLE1}
# File Transfer
FT_INDEX = 1
FT_FILE_SERVER_URL = 'ftp://10.211.240.188'
FT_USERNAME = 'airvana'
FT_PASSWORD = 'dmsadmin123'
FT_FILE_TYPE_INDEX = 1
FT_FILE_TYPE_VALUE = 'ALARM'
FT_FILE_TYPE_WIN_START_TIME = '05:30'
FT_FILE_TYPE_WIN_DURATION = 150
FT_FILE_TYPE_WIN_INTERVAL = 1020
FT_FILE_TYPE = {}

ADMIN_STATUS1 = 'FALSE'
ADMIN_STATUS_DICT1 = {'Admin State': ADMIN_STATUS1}

ADMIN_STATUS = 'TRUE'
ADMIN_STATUS_DICT = {'Admin State': ADMIN_STATUS}

enode_sector1 = '1'
enode_sector_DICT1 = {'Number of Sectors:': enode_sector1}

enode_sector = '2'
enode_sector_DICT = {'Number of Sectors:': enode_sector}

cell_value_input='12345'
CELL_VALUE_dict = {'Cell Mode and Cell Identity':'eNB','Cell Mode and Cell Identity':cell_value_input}

FreqBandIndictorPriority_value='TRUE'
MultiBandInfoList_value='12323'
#'FreqBandIndicatorPriority':FreqBandIndictorPriority_value
LTE_PARAM_Multi_Fre_Band_DICT = {'DC_LteNeighborList': LTE_INDEX, 'EUTRACarrierARFCN': LTE_CARRIER, 'PhyCellID': LTE_PHYCELLID,
                  'Alias': LTE_ALIAS, 'PLMNID': LTE_PLMNID, 'CID': LTE_CID, 'RSTxPower': LTE_RST, 'TAC': LTE_TAC,
                                 'MultiBandInfoList':MultiBandInfoList_value}

FreqBandIndictorPriority_value1='FALSE'
MultiBandInfoList_value1='123233'
Include='TRUE'
LTE_PARAM_Multi_Fre_Band_DICT1 =  {'DC_LteNeighborList': LTE_INDEX1, 'EUTRACarrierARFCN': LTE_CARRIER1, 'PhyCellID': LTE_PHYCELLID1,
                  'Alias': LTE_ALIAS1, 'PLMNID': LTE_PLMNID1, 'CID': LTE_CID1, 'RSTxPower': LTE_RST1, 'TAC': LTE_TAC1,
                'MultiBandInfoList':MultiBandInfoList_value1}

Configured_Process='1'
MCS_Override='8'
Max_Downlink='2'
Max_Uplink='2'
Release_Time='4'
Max_Hybrid_Automatic_Repeat_Request='3'
SPS_Param_Dict= {'Number Of Configured Process':Configured_Process,'MCS Override':MCS_Override,
                 'Max Downlink':Max_Downlink,'Max Uplink':Max_Uplink,
                 'Release Time':Release_Time,
                 'Max Hybrid Automatic Repeat Request':Max_Hybrid_Automatic_Repeat_Request}

Configured_Process_1='2'
MCS_Override_1='3'
Max_Downlink_1='4'
Max_Uplink_1='5'
Release_Time_1='6'
Max_Hybrid_Automatic_Repeat_Request_1='7'
SPS_Param_Dict_1= {'Number Of Configured Process':Configured_Process_1,'MCS Override':MCS_Override_1,
                 'Max Downlink':Max_Downlink_1,'Max Uplink':Max_Uplink_1,
                 'Release Time':Release_Time_1,
                 'Max Hybrid Automatic Repeat Request':Max_Hybrid_Automatic_Repeat_Request_1}

#Blacklist_RP='0005B951D651'
Blacklist_RP='0005B9ABB2'
#Blacklist_RP='0005B9ABB9'

CATM1_STATUS1 = 'FALSE'
CATM1_DICT1 = {'Cat M1 Enable': CATM1_STATUS1}

CATM1_STATUS = 'TRUE'
CATM1_DICT = {'Cat M1 Enable': CATM1_STATUS}

# SPID Parameter
SPID_PARAM = 'TRUE'
SPID_PARAM_DICT = {'SPID Enable': SPID_PARAM}

SPID_PARAM_1 = 'FALSE'
SPID_PARAM_DICT1 = {'SPID Enable': SPID_PARAM_1}

# MIMO Parameter
MIMO_PARAM = 'TRUE'
MIMO_PARAM_DICT = {'Enable 4X4 MIMO': MIMO_PARAM}

MIMO_PARAM_1 = 'FALSE'
MIMO_PARAM_DICT1 = {'Enable 4X4 MIMO': MIMO_PARAM_1}

#ENDC Parameter
ENDCEnable_PARAM = 'FALSE'
ENDCEnable_PARAM_DICT = {'EN-DC Enable': ENDCEnable_PARAM}
#ENDCEnable_PARAM_1 = 'TRUE'
#ENDCEnable_PARAM_DICT1 = {'EN-DC Enable': ENDCEnable_PARAM_1}
ENDCX2_PARAM = '0'
ENDCX2_PARAM_DICT = {'EN-DC X2': ENDCX2_PARAM}


Physical_ID= '152'
RF_Physical_Cell_ID= {'Physical Cell ID':Physical_ID}
Physical_ID1= '153'
RF_Physical_Cell_ID1= {'Physical Cell ID':Physical_ID1}

S1SignalLinkServerList='10.23.213.12'
S1SignalLinkServerList1='10.23.212.24'