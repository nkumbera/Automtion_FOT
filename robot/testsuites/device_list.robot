*** Settings ***

#Suite Setup         DMS UI Login    # Login DMS Network Console UI with AdminUser
Suite Setup         DMS Network Console UI Login
Suite Teardown      DMS UI Logout    # Logging off
Resource            ../resources/common/ui_common.robot
Resource            ../resources/device_list/device_list_keywords.robot
Library             String


*** Test Cases ***
Device list filter creation
    [Documentation]  device_list filter creation with ALL device type with macid and filter listed in manage filter page
    [Tags]   device_list  device_list_filter_macid  regression    sustenance6.0
    Verify device list filter creation with macid

device list filter search
    [Documentation]  Search filter and apply
    [Tags]  device_list  search_filter_apply  regression    sustenance6.0
    Verify device list filter search

device list filter creation contains macid
    [Documentation]  filter creation contains macid
    [Tags]  device_list  filter_create_contains_macid  regression    sustenance6.0
    Verify device list filter creation contains macid

filter creation factory serial number
    [Documentation]  filter create with factory serial number
    [Tags]  device_list  filter_create_factory_serial_number  regression    working
    Verify filter with factory serial Onecell

filter creation friendly name
    [Documentation]  filter create with friendly name
    [Tags]  device_list  filter_create_friendly_name  regression    sustenance6.0
    Verify filter creation with friendly name

filter creation with ngrp macid
    [Documentation]  filter create with ngrp macid
    [Tags]  device_list  filter_create_ngrp_macid  regression    sustenance6.0
    Verify filter creation with ngrp macid

filter creation with software version
    [Documentation]  filter create with software version
    [Tags]  device_list  filter_create_software_version  regression    working
    Verify filter creation with software version

filter creation with enodeB name
    [Documentation]  filter create with enodeB name
    [Tags]  device_list  filter_create_enodeB_name    regression    sustenance6.0
    Verify filter creation with enodeB name

filter creation with venue name
    [Documentation]  filter create ngrp macid with venue name
    [Tags]  device_list    filter_create_ngrp_venue_name    regression    working
    Verify filter creation with ngrp macid with venue name

filter creation with cgrp macid
    [Documentation]  filter create cgrp macid
    [Tags]  device_list    filter_create_cgrp_macid    regression    working
    Verify filter creation with cgrp macid

filter creation with cgrp BC macid
    [Documentation]  filter create cgrp BC macid
    [Tags]  device_list    filter_create_cgrp_BC_macid    regression    working
    Verify filter creation with cgrp BC macid

filter creation with NGRadio RFModule
    [Documentation]  filter create NGRadio RFModule
    [Tags]  device_list  filter_create_NGRadio_RFModule  regression    working
    Verify filter creation with NGRadio RFModule

Modify Created filter and Apply
    [Documentation]  Modify Created filter and Apply
    [Tags]  device_list  modify_created_filter_apply    regression    sustenance6.0
    Verify created filter modification and apply

device list filter delete
    [Documentation]  device list existing filter deletion
    [Tags]  device_list  device_list_filter_delete  regression    sustenance6.0
    Verify device list filter delete

CP device list filter Creation
    [Documentation]  CP filter create
    [Tags]  device_list    gnb_filter_Verification    cp_device_filter_creation    regression    regression_6.0    sustenance6.0
    Verify CP device list Create

UP device list filter Creation
    [Documentation]  UP filter create
    [Tags]  device_list    gnb_filter_Verification    up_device_filter_creation    regression    regression_6.0     sustenance6.0
    Verify UP device list Create

DU device list filter Creation
    [Documentation]  DU filter create
    [Tags]  device_list    gnb_filter_Verification    du_device_filter_creation    regression    regression_6.0    sustenance6.0
    Verify DU device list Create

Modify CP filter and Apply
    [Documentation]  Modify CP filter and Apply
    [Tags]  device_list     edit_cp_filter   gnb_filter_edit    regression    regression_6.0    sustenance6.0
    Verify CP created filter edit and apply

Modify UP filter and Apply
    [Documentation]  Modify UP filter and Apply
    [Tags]  device_list     edit_up_filter    gnb_filter_edit   regression      regression_6.0    sustenance6.0
    Verify UP created filter edit and apply

Modify DU filter and Apply
    [Documentation]  Modify DU filter and Apply
    [Tags]  device_list     edit_du_filter    gnb_filter_edit   regression    regression_6.0    sustenance6.0
    Verify DU created filter edit and apply


Manage CP from device list
    [Documentation]  verify Manage CP device
    [Tags]  device_list     Manage_cp_device_devicelist     Manage  Manage_Unmanage    regression    regression_6.0    sustenance6.0
    Verify Manage CP device from device list


Unmanage CP from device list
    [Documentation]  verify Unmanage CP device
    [Tags]  device_list     Unmanage_cp_device_devicelist   Unmanage    Manage_Unmanage    regression    regression_6.0    sustenance6.0
    Verify Unmanage CP device from device list

Manage UP from device list
    [Documentation]  verify Manage UP device
    [Tags]  device_list     Manage_up_device_devicelist     Manage  Manage_Unmanage    regression    regression_6.0    sustenance6.0
    Verify Manage UP device from device list


Unmanage UP from device list
    [Documentation]  verify Unmanage UP device
    [Tags]  device_list     Unmanage_up_device_devicelist   Unmanage    Manage_Unmanage    regression    regression_6.0    sustenance6.0
    Verify Unmanage UP device from device list

Manage DU from device list
    [Documentation]  verify Manage DU device
    [Tags]  device_list     Manage_du_device_devicelist     Manage  Manage_Unmanage    regression    regression_6.0    sustenance6.0
    Verify Manage DU device from device list

Unmanage DU from device list
    [Documentation]  verify Unmanage DU device
    [Tags]  device_list     Unmanage_du_device_devicelist   Unmanage    Manage_Unmanage    regression    regression_6.0    sustenance6.0
    Verify Unmanage DU device from device list

Add CP device from device list
    [Documentation]  verify Add CP device
    [Tags]  device_list     Add_cp_device_devicelist    Add_device    regression    regression_6.0    sustenance6.0
    Verify Add CP device from device list

Add UP device from device list
    [Documentation]  verify Add UP device
    [Tags]  device_list     Add_up_device_devicelist    Add_device    regression    regression_6.0    sustenance6.0
    Verify Add UP device from device list

Add DU device from device list
    [Documentation]  verify Add DU device
    [Tags]  device_list     Add_du_device_devicelist    Add_device    regression    regression_6.0    sustenance6.0
    Verify Add DU device from device list

Add BC device from device list
    [Documentation]  verify Add BC device
    [Tags]  device_list     Add_bc_device_devicelist    Add_device    regression_6.0    sustenance6.0
    Verify Add BC device from device list

gNB dashboard navigation from CP device list
    [Documentation]  gNB dashboard navigation from CP device list
    [Tags]  gNB_navigation_cp_device_list   gNBdashboard_navigation     regression    regression_6.0    sustenance6.0
    Verify gNB navigation from CP device list

gNB dashboard navigation from UP device list
    [Documentation]  gNB dashboard navigation from UP device list
    [Tags]  gNB_navigation_up_device_list   gNBdashboard_navigation     regression    regression_6.0    sustenance6.0
    Verify gNB navigation from UP device list

gNB dashboard navigation from DU device list
    [Documentation]  gNB dashboard navigation from DU device list
    [Tags]  gNB_navigation_du_device_list   gNBdashboard_navigation     regression    regression_6.0    sustenance6.0
    Verify gNB navigation from DU device list