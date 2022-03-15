*** Settings ***
Documentation    DMS Network Policy VNF Test Suite
#Suite Setup         DMS UI Login    # Login DMS Network Console UI with AdminUser
#Suite Setup         DMS Network Console UI Login
Suite Teardown      DMS UI Logout    # Logging off
Resource            ../resources/common/ui_common.robot
Resource            ../resources/dashboard_6.0/dashboard_keywords.robot
Resource            ../resources/NetworkPolicy_VNF/NetworkPolicy_VNF_Keywords.robot
Library             String
Test Setup          DMS Network Console UI Login
Test Teardown       DMS Network Console UI Logout

*** Test Cases ***
Create Schedule Network Policy from Network console GUI CUCP
     [Documentation]   Create Schedule Network Policy from Network console GUI CUCP
     [Tags]  TC_135  MJ_R60_NP  regression    regression_6.0
     Schedule Network Policy from Network console GUI CUCP

Create Schedule Network Policy from Network console GUI CUUP
     [Documentation]   Create Schedule Network Policy from Network console GUI CUUP
     [Tags]  TC_136  MJ_R60_NP  regression    regression_6.0
     Schedule Network Policy from Network console GUI CUUP

Create Schedule Network Policy from Network console GUI DU
     [Documentation]   Create Schedule Network Policy from Network console GUI DU
     [Tags]  TC_137  MJ_R60_NP  regression    regression_6.0
     Schedule Network Policy from Network console GUI DU

Create on demand Network Policy for CUCP
     [Documentation]   Create on demand Network Policy for CUCP
     [Tags]  TC_138  MJ_R60_NP  regression    regression_6.0
     On demand Network Policy for CUCP

Create on demand Network Policy for CUUP
     [Documentation]   Create on demand Network Policy for CUUP
     [Tags]  TC_139  MJ_R60_NP  regression    regression_6.0
     On demand Network Policy for CUUP

Create on demand Network Policy for DU
     [Documentation]   Create on demand Network Policy for DU
     [Tags]  TC_140  MJ_R60_NP  regression    regression_6.0
     On demand Network Policy for DU

Create Event Type based Network policy for CUCP
     [Documentation]   Create Event Type based Network policy for CUCP
     [Tags]  TC_141  MJ_R60_NP  regression    regression_6.0
     Event Type based Network policy for CUCP

Create Event Type based Network policy for CUUP
     [Documentation]   Create Event Type based Network policy for CUUP
     [Tags]  TC_142  MJ_R60_NP  regression     regression_6.0
     Event Type based Network policy for CUUP

Create Event Type based Network policy for DU
     [Documentation]   Create Event Type based Network policy for DU
     [Tags]  TC_143  MJ_R60_NP  regression    regression_6.0
     Event Type based Network policy for DU

Create Import Export of VNF Network Policies
     [Documentation]   Import Export of VNF Network Policies
     [Tags]  TC_144  MJ_R60_NP  regression    regression_6.0
     Import of Network Policies
     Export of Network Policies