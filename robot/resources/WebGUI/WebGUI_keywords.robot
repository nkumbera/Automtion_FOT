*** Settings ***
Library             DateTime
#Resource            page/dashboard_page_helper.robot
#Resource            ../dashboard/device_operation.robot
#Resource            ../overwrridden_params/overwrridden_params.robot
#Resource            ../notification/notification_helper.robot
#Resource            ../common/ui_common.robot
#Resource            ../pnp/pnp_keywords.robot
#Resource            ../operational_rp_params/rp_params_keywords.robot
Resource            page/WebGUI_helper.robot
Variables           testdata/WebGUI_testdata.py


*** Variables ***



*** Keywords ***
Update Nominal GPS WEBGUI
   Update GPS Teardown
   Update Nominal GPS values Webgui

Validate WEBGUI Overridden Param
   Open WebGUI Console
   Validate WebGUI Overridden Params

Validate Operationl Param
   Open Operational Param
   Validate Operational Param NGPS Data

Validate Provision Data
   Open Provision Data
   Validate Provision Data NGPS

Validate Device History
    Open Device History
    Validate Device History for NGPS  Tabular  Last 1 hour  INFORMS

Update whitelist WEBGUI
    open and configure whitelist

Validate whitelist WEBGUI Overridden Param
    Open WebGUI Console
    Validate WebGUI Overridden Params Whitelist

Validate whitelist operationl Param
   Open Operational Param
   Validate Operational Param whitelist Data

Validate whitelist Provision Data
   Open Provision Data
   Validate Provision Data whitelist

Validate whitelist Device History
    Open Device History
    Validate Device History for whitelist  Tabular  Last 1 hour  COMPUTATION

Delete Webgui params
    #Open WebGUI Console
    Delete overridden param


Delete Nominal GPS Webgui params
    Open WebGUI Console
    Delete overridden param Nominal GPS

Open WebGUI from DeviceConsole
     Click on WebGUI Acces