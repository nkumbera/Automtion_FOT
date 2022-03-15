*** Settings ***
Resource  page/search_device_helper.robot

*** Variables ***


*** Keywords ***
search using friendly name
   [Documentation]  search using the friendly name
   search using friendly name in homepage

search using cell identity
   [Documentation]  search using the cell Identity
   search using cell identity in homepage

search using NGRP device with validation
    [Documentation]  search using NGRP device and validates the image with summary
    search using NGRP ID and validate summary with image

search using NGRP device
    [Documentation]     search using NGRP device
    search using NGRP device in homepage


search using cu_up name
   [Documentation]  search using the cu_up name
   [Arguments]  ${device_id}
   search using cu_up name in homepage    ${device_id}

search using cu_cp name
   [Documentation]  search using the cu_cp name
   [Arguments]  ${device_id}
   search using cu_cp name in homepage    ${device_id}

search using du name
   [Documentation]  search using the du name
   [Arguments]  ${device_id}
   search using du name in homepage    ${device_id}

search using RP5100 device
    [Documentation]     search using RP5100 device
    search using RP5100 device in homepage

Verify gNB dashboard search using gNBid
    [Arguments]  ${gNBid}
    [Documentation]  search using the du name
    Search gNB dashboard using gNBid    ${gNBid}

Verify gNB dashboard search using gNBName
    [Documentation]  search using the du name
    Search gNB dashboard using gNBName

Verify gNB dashboard search using gNBName with multiple cucp
    [Documentation]  search using gNBName with multiple cucp
    Search gNB dashboard using gNBName with multiple cucp

Navigate to gNB dashboard
    gNB dashboard navigation

Navigate to gNB dashboard from UP
    gNB dashboard navigation from UP

Verify gNB dashboard page
    [Documentation]  Verify gNB dashboard page
    Verification of gNB dashboard

Verify gNB dashboard service status
    gNB dashboard service status when DU cell up
search using RP5200 device
    [Documentation]     search using RP5200 device
    search using RP5200 device in homepage