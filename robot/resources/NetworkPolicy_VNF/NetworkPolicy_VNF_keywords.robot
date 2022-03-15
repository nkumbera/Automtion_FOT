*** Settings ***
Resource            page/NetworkPolicy_VNF_helper.robot
Resource            ../provisioning/provisioning_keywords.robot

*** Variables ***


*** Keywords ***
Schedule Network Policy from Network console GUI CUCP
    [Documentation]   Schedule Network Policy from Network console GUI CUCP
    Log   Schedule Network Policy from Network console GUI CUCP
    Add VNF Policy Scheduled    Test_Schedule_CUCP    ${NETWORK_POLICY_DEVICETYPE_CUCP}
    Verify VNF Policy Creation  Test_Schedule_CUCP
    Delete VNF Network Policy  Test_Schedule_CUCP

Schedule Network Policy from Network console GUI CUUP
    [Documentation]   Schedule Network Policy from Network console GUI CUUP
    Log   Schedule Network Policy from Network console GUI CUUP
    Add VNF Policy Scheduled   Test_Schedule_CUUP    ${NETWORK_POLICY_DEVICETYPE_CUUP}
    Verify VNF Policy Creation  Test_Schedule_CUUP
    Delete VNF Network Policy  Test_Schedule_CUUP

Schedule Network Policy from Network console GUI DU
    [Documentation]   Schedule Network Policy from Network console GUI DU
    Log   Schedule Network Policy from Network console GUI DU
    Add VNF Policy Scheduled    Test_Schedule_DU    ${NETWORK_POLICY_DEVICETYPE_DU}
    Verify VNF Policy Creation  Test_Schedule_DU
    Delete VNF Network Policy  Test_Schedule_DU

On demand Network Policy for CUCP
    [Documentation]   On demand Network Policy for CUCP
    Log   On demand Network Policy for CUCP
    Add VNF Policy On Demand    Test_OnDemand_CUCP    ${NETWORK_POLICY_DEVICETYPE_CUCP}
    Verify VNF Policy Creation  Test_OnDemand_CUCP
    Delete VNF Network Policy  Test_OnDemand_CUCP

On demand Network Policy for CUUP
    [Documentation]   On demand Network Policy for CUUP
    Log   On demand Network Policy for CUUP
    Add VNF Policy On Demand    Test_OnDemand_CUUP    ${NETWORK_POLICY_DEVICETYPE_CUUP}
    Verify VNF Policy Creation  Test_OnDemand_CUUP
    Delete VNF Network Policy  Test_OnDemand_CUUP

On demand Network Policy for DU
    [Documentation]   On demand Network Policy for DU
    Log   On demand Network Policy for DU
    Add VNF Policy On Demand    Test_OnDemand_DU    ${NETWORK_POLICY_DEVICETYPE_DU}
    Verify VNF Policy Creation  Test_OnDemand_DU
    Delete VNF Network Policy  Test_OnDemand_DU

Event Type based Network policy for CUCP
    [Documentation]   Event Type based Network policy for CUCP
    Log   Event Type based Network policy for CUCP
    Add VNF Policy Event Type    Test_EventType_CUCP    ${NETWORK_POLICY_DEVICETYPE_CUCP}
    Verify VNF Policy Creation  Test_EventType_CUCP
    Delete VNF Network Policy  Test_EventType_CUCP

Event Type based Network policy for CUUP
    [Documentation]   Event Type based Network policy for CUUP
    Log   Event Type based Network policy for CUUP
    Add VNF Policy Event Type    Test_EventType_CUUP    ${NETWORK_POLICY_DEVICETYPE_CUUP}
    Verify VNF Policy Creation  Test_EventType_CUUP
    Delete VNF Network Policy  Test_EventType_CUUP

Event Type based Network policy for DU
    [Documentation]   Event Type based Network policy for DU
    Log   Event Type based Network policy for DU
    Add VNF Policy Event Type    Test_EventType_DU    ${NETWORK_POLICY_DEVICETYPE_DU}
    Verify VNF Policy Creation  Test_EventType_DU
    Delete VNF Network Policy  Test_EventType_DU

Import of Network Policies
    [Documentation]   Import of Network Policies
    Log   Import of Network Policies
    Import Network Policies VNF CUCP Schedule
    Verify VNF Policy Import    TestImport_Schedule_CUCP
    Verify VNF Policy Creation    TestImport_Schedule_CUCP
    Import Network Policies VNF CUUP Schedule
    Verify VNF Policy Import   TestImport_Schedule_CUUP
    Verify VNF Policy Creation  TestImport_Schedule_CUUP
    Import Network Policies VNF DU Schedule
    Verify VNF Policy Import  TestImport_Schedule_DU
    Verify VNF Policy Creation  TestImport_Schedule_DU
    Import Network Policies VNF CUCP Event Type
    Verify VNF Policy Import  TestImport_EventType_CUCP
    Verify VNF Policy Creation  TestImport_EventType_CUCP
    Import Network Policies VNF CUUP Event Type
    Verify VNF Policy Import  TestImport_EventType_CUUP
    Verify VNF Policy Creation  TestImport_EventType_CUUP
    Import Network Policies VNF DU Event Type
    Verify VNF Policy Import  TestImport_EventType_DU
    Verify VNF Policy Creation  TestImport_EventType_DU
    Import Network Policies VNF CUCP OnDemand
    Verify VNF Policy Import  TestImport_OnDemand_CUCP
    Verify VNF Policy Creation  TestImport_OnDemand_CUCP
    Import Network Policies VNF CUUP OnDemand
    Verify VNF Policy Import  TestImport_OnDemand_CUUP
    Verify VNF Policy Creation  TestImport_OnDemand_CUUP
    Import Network Policies VNF DU OnDemand
    Verify VNF Policy Import  TestImport_OnDemand_DU
    Verify VNF Policy Creation  TestImport_OnDemand_DU

Export of Network Policies
    [Documentation]   Export of Network Policies
    Log   Export of Network Policies
    Export Network Policies VNF  TestImport_Schedule_CUCP
    Delete VNF Network Policy  TestImport_Schedule_CUCP
    Export Network Policies VNF  TestImport_Schedule_CUUP
    Delete VNF Network Policy  TestImport_Schedule_CUUP
    Export Network Policies VNF  TestImport_Schedule_DU
    Delete VNF Network Policy  TestImport_Schedule_DU
    Export Network Policies VNF  TestImport_EventType_CUCP
    Delete VNF Network Policy  TestImport_EventType_CUCP
    Export Network Policies VNF  TestImport_EventType_CUUP
    Delete VNF Network Policy  TestImport_EventType_CUUP
    Export Network Policies VNF  TestImport_EventType_DU
    Delete VNF Network Policy  TestImport_EventType_DU
    Export Network Policies VNF  TestImport_OnDemand_CUCP
    Delete VNF Network Policy  TestImport_OnDemand_CUCP
    Export Network Policies VNF  TestImport_OnDemand_CUUP
    Delete VNF Network Policy  TestImport_OnDemand_CUUP
    Export Network Policies VNF  TestImport_OnDemand_DU
    Delete VNF Network Policy  TestImport_OnDemand_DU
