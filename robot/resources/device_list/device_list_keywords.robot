*** Settings ***
Resource            page/device_list_helper.robot
Variables           testdata/device_list_testdata.py

*** Variables ***

*** Keywords ***

Verify device list filter creation with macid
    Open Device list
    Show Search Options
    Select Device Type Enter Filter name
    Select MAC ID Enter Expression Value

Verify device list filter search
    Filter search and apply

Verify device list filter creation contains macid
    Filter create contains macid

Verify filter with factory serial Onecell
    Filter Factory Serial number Onecell

Verify filter creation with friendly name
    Filter Creation friendly name

Verify filter creation with ngrp macid
    filter creation with ngrp macid

Verify filter creation with software version
    filter creation with software version

Verify filter creation with enodeB name
    filter creation with enodeB name

Verify filter creation with ngrp macid with venue name
    filter creation with ngrp macid with venue name

Verify filter creation with cgrp macid
    filter creation with cgrp macid

Verify filter creation with cgrp BC macid
    filter creation with cgrp BC macid

Verify filter creation with NGRadio RFModule
    filter creation with NGRadio RFModule

Verify created filter modification and apply
    Modify Created filter and Apply

Verify device list filter delete
    search Filter name and delete

Verify CP device list Create
    CP Filter creation and verification    Automation_Venue    Building_1    1    6.0.00.001    401

Verify UP device list Create
    UP Filter creation and verification    Automation_Venue    Building_1    1    6.0.00.001

Verify DU device list Create
    DU Filter creation and verification    Automation_Venue    Building_1    1    6.0.00.001

Verify CP created filter edit and apply
    Modify CP Created filter and Apply

Verify UP created filter edit and apply
    Modify UP Created filter and Apply

Verify DU created filter edit and apply
    Modify DU Created filter and Apply

Verify Manage CP device from device list
    Manage CP device from device list

Verify Unmanage CP device from device list
    Unmanage CP device from device list

Verify Manage UP device from device list
    Manage UP device from device list

Verify Unmanage UP device from device list
    Unmanage UP device from device list

Verify Manage DU device from device list
    Manage DU device from device list

Verify Unmanage DU device from device list
    Unmanage DU device from device list

Verify Add CP device from device list
    Add CP device from device list

Verify Add UP device from device list
    Add UP device from device list

Verify Add DU device from device list
    Add DU device from device list

Verify Add BC device from device list
    Add BC device from device list

Verify gNB navigation from CP device list
    gNB navigation from CP device list

Verify gNB navigation from UP device list
    gNB navigation from UP device list

Verify gNB navigation from DU device list
    gNB navigation from DU device list