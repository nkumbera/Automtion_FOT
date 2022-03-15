#!/bin/ksh
#
# Copyright (c) 2016 CommScope. All rights reserved.
#
# 23/05/2016 - Added check to not delete device if part of cluster #femto00135554
# 25/10/2016 - Added check to not delete device if there are any device policies
#              configured for the device - BCMA: femto00159500

. /opt/sw/dms/platform/scripts/shell_env.sh
$ECHO "This utitlity script for to delete a Device from DMS .This Script can only run in DMS Admin Server\n"
$ECHO "Starting deleting a Device ...\n"
error ()
{
    show "Script deleteDevice.sh FAILED"
    exit 1;
}
show ()
{
        $ECHO $*
}

check_dd_db_connectivity()
{
show "Checking DD Database connectivity"
sqlplus -s <<EOF
$dddmsdbuser/$dddmsdbpasswd@$ddtns
whenever sqlerror exit 99
SELECT 'CONNECTION IS FINE' FROM DUAL;
exit;
EOF
if [ $? -ne 0 ] ;then
        show "ERROR: Checking DD Database connectivity Failed. \n"
        error
else
        show "Successfully connected to the DD Database \n"
fi
}

check_np_db_connectivity()
{
show "Checking NP Database connectivity"
sqlplus -s <<EOF
$npdmsdbuser/$npdmsdbpasswd@$nptns
whenever sqlerror exit 99
SELECT 'CONNECTION IS FINE' FROM DUAL;
exit;
EOF
if [ $? -ne 0 ] ;then
        show "ERROR: Checking NP Database connectivity Failed. \n"
        error
else
        show "Successfully NP connected to the Database \n"
fi
}

check_sp_db_connectivity()
{
show "Checking SP Database connectivity"
sqlplus -s <<EOF
$spdmsdbuser/$spdmsdbpasswd@$sptns
whenever sqlerror exit 99
SELECT 'CONNECTION IS FINE' FROM DUAL;
exit;
EOF
if [ $? -ne 0 ] ;then
        show "ERROR: Checking SP Database connectivity Failed. \n"
        error
else
        show "Successfully SP connected to the Database \n"
fi
}
#check_dd_db_connectivity
#check_np_db_connectivity
#check_sp_db_connectivity

get_level_column_name_by_deviceId()
{
level_column_name=`sqlplus -s $npdmsdbuser/$npdmsdbpasswd@$nptns << EOF
                SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF
                select ParamValue  from servicetaskparameters_ stp
                inner join servicetasks_ st on stp.servicetaskid_fk = st.SERVICETASKID
                inner join devicetype_ dt on dt.SERVICEPACKID_FK = st.servicepackid_fk
                inner join device_alt_keys_ dak on dt.devicetypeid=dak.device_type_id
                where st.servicename = 'device_identifiers_key_mapping' and stp.paramname = 'DEPLOYMENT' and dak.device_Id = '$deviceid' ;
       exit;
EOF`
if [ x"$level_column_name" = x ] ; then
show "Device ID incorrect. Enter valid ID for a Device. Exiting"
error
fi
echo "$level_column_name"
}

get_levelId_by_deviceId()
{
levelid=`sqlplus -s $npdmsdbuser/$npdmsdbpasswd@$nptns << EOF
                SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF
        select $level_column_name from device_alt_keys_ where DEVICE_ID = '$deviceid' ;
        exit;
EOF`
if [ x"$levelid" = x ] ; then
show "Device ID incorrect. Enter valid ID for a Device. Exiting"
error
fi
echo "$levelid"
}


#show "Enter Device Id :\c"
#read deviceid
#if [ x"$deviceid" = x ] ; then
#show "Device ID can't be empty. Enter valid ID for a Device. Exiting"
#error
#fi

#show "Entered Device Id = $deviceid \n"
#get_level_column_name_by_deviceId $level_column_name
#echo $level_column_name
#get_levelId_by_deviceId $levelid
#echo $levelid

delete_dd_device_records()
{
sqlplus -s $dddmsdbuser/$dddmsdbpasswd@$ddtns << EOF
WHENEVER SQLERROR EXIT 99 ROLLBACK;
delete from DEVICE_ACTION_ where DEVICE_ID = '$deviceid';
delete from DEVICE_ALARM_ where SOURCE='$deviceid';
delete from DEVICE_NBI_CONFIG_OVERRIDE_ where LEVEL_TYPE=0 and LEVEL_ID='$deviceid';
delete from DEVICE_UI_CONFIG_OVERRIDE_ where LEVEL_TYPE=0 and LEVEL_ID='$deviceid';
delete from DEVICE_NBI_CONFIG_OVERRIDE_ where LEVEL_TYPE=1 and LEVEL_ID='$levelid';
delete from DEVICE_UI_CONFIG_OVERRIDE_ where LEVEL_TYPE=1 and LEVEL_ID='$levelid';
delete from MAP_ACTION_ where DEVICE_ID='$deviceid';
delete from NBI_DEVICE_MO_ where DEVICEID='$deviceid';
delete from NBI_PENDING_REQUEST_ where DEVICEID='$deviceid';
delete from NBI_PROCESSED_REQUESTS_ where DEVICEID='$deviceid';
delete from OVERRIDE_RF_PARAMETERS_ where DEVICEID='$deviceid';
delete from DEVICE_ACTION_DETAILS_ where DEVICE_ID='$deviceid';
commit;
exit
EOF

if [ $? = 99 ]; then
    show "\nDB error. Error executing DD Device Delete SQL queries."
    error
fi
}

delete_np_device_records()
{
sqlplus -s $npdmsdbuser/$npdmsdbpasswd@$nptns << EOF
WHENEVER SQLERROR EXIT 99 ROLLBACK;
delete from DEVICE_COMPUTATION_REQUEST_ where DEVICE_ID = '$deviceid';
delete from DEVICE_CONFIG_DELTA_ where LEVEL_TYPE=0 and LEVEL_ID='$deviceid';
delete from DEVICE_CONFIGURATION_ where LEVEL_TYPE=0 and LEVEL_ID='$deviceid';
delete from DEVICE_CONFIG_DELTA_ where LEVEL_TYPE=1 and LEVEL_ID='$levelid';
delete from DEVICE_CONFIGURATION_ where LEVEL_TYPE=1 and LEVEL_ID='$levelid';
delete from DEVICE_NEIGHBOR_INFO_ where DEVICE_ID='$deviceid';
delete from FACTORY_DATA_ where SERIAL_NUMBER='$deviceid';
delete from OM_KPI_V2_ where MAC_ID='$deviceid';
delete from LOCATION_INFO_ where FEMTO_ID='$deviceid';
delete from DEVICE_CSON_ where DEVICE_ID='$deviceid';
update RADIO_UNIT_ set DEVICEID=null where DEVICEID='$deviceid';
delete from DEVICE_ALT_KEYS_ where DEVICE_ID='$deviceid';
commit;
exit
EOF

if [ $? = 99 ]; then
    show "\nDB error. Error executing NP Device Delete SQL queries."
    error
fi
}

delete_sp_device_records()
{
sqlplus -s $spdmsdbuser/$spdmsdbpasswd@$sptns << EOF
WHENEVER SQLERROR EXIT 99 ROLLBACK;
delete from DEVICE_DATA_ where DEVICE_ID = '$deviceid';
delete from PROVISIONING_DATA_ where LEVEL_TYPE=0 and LEVEL_ID='$deviceid';
delete from PROVISIONED_DATA_ where LEVEL_TYPE=0 and LEVEL_ID='$deviceid';
delete from PROVISIONING_DATA_ where LEVEL_TYPE=1 and LEVEL_ID='$levelid';
delete from PROVISIONED_DATA_ where LEVEL_TYPE=1 and LEVEL_ID='$levelid';
delete from WORKFLOW_EVENT_PROCESS_ where DEVICE_ID='$deviceid';
delete from DEVICE_MASTER_ where ID='$deviceid';
delete from ENTITY_MAPPING_ where Primary_Entity='$deviceid';
commit;
exit
EOF
if [ $? = 99 ]; then
    show "\nDB error. Error executing SP Device Delete SQL queries."
    error
fi
}

get_cluster_count()
{
sqlplus -s $npdmsdbuser/$npdmsdbpasswd@$nptns << EOF
set heading off
set feedback off
set pages 0

select count(*) from device_cluster_member_ dcm, device_cluster_ dc where dc.id = dcm.cluster_id and device_id = '$deviceid';
EOF
}

check_cluster()
{

clustercount=$(get_cluster_count)

if [ "$clustercount" -gt 0 ] ; then
    show "\nERROR : Device cannot be deleted as it is part of cluster"
    error
fi

}

get_policy_count()
{
sqlplus -s $npdmsdbuser/$npdmsdbpasswd@$nptns << EOF
set heading off
set feedback off
set pages 0
SELECT COUNT(*) FROM DEPLOYMENT_POLICY_TARGET_ dpt, DEPLOYMENT_POLICY_ dp WHERE dp.ID = dpt.POLICY_ID AND dpt.TARGET_TYPE = 1 AND dpt.TARGET_ID = '$deviceid';
EOF
}

check_policy()
{
    policycount=$(get_policy_count)
    if [ "$policycount" -gt 0 ] ; then
        show "\nERROR : Device cannot be deleted as there are one or more Device Policies configured for the device"
        error
    fi
}


###Manullay Added Code
################################################
dddmsdbuser=dms_dd
dddmsdbpasswd=xairv
ddtns=dmsdb_a
npdmsdbuser=dms_np
npdmsdbpasswd=xairv
nptns=dmsdb_a
spdmsdbuser=dms_sp
spdmsdbpasswd=xairv
sptns=dmsdb_a
for macid in `cat /opt/sw/dms/platform/bin/Device.txt`
do
        deviceid=$macid

echo $deviceid

devicestate=`sqlplus -s $spdmsdbuser/$spdmsdbpasswd@$sptns << EOF
                SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF
        select state from device_ where ID = '$deviceid' ;
        exit;
EOF`
echo $devicestate
if [ "$devicestate" -eq 0 ] ; then
echo loop1
check_cluster
check_policy
delete_dd_device_records
delete_np_device_records
delete_sp_device_records
else

echo loop2
get_level_column_name_by_deviceId $level_column_name
echo $level_column_name
get_levelId_by_deviceId $levelid
echo $levelid

check_cluster
check_policy
delete_dd_device_records
delete_np_device_records
delete_sp_device_records
fi

if [ $? != 0 ]; then
show "Unable to execute query \n"
error
else
show "Device '$deviceid' Deleted Successfully"
fi
done