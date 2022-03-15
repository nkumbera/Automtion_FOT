*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           Import_ui_controls.py

*** Variables ***


*** Keywords ***
Click On Import Menu Item
    BuiltIn.Sleep  10s
    [Documentation]  click on import page
    Click DMS Element  ${Import_Menu}
    BuiltIn.Sleep  15s

Click on Schedule Import Menu Item
    [Documentation]  click on schedule import page
    Click DMS Element  ${Schedule_import}
    BuiltIn.Sleep  10s

Click on File Import Menu Item
    [Documentation]  click on file import page
    Click DMS Element  ${File_import}
    BuiltIn.Sleep  10s

Click on Inprogress Import Menu Item
    [Documentation]  click on file import page
    Click DMS Element  ${Import_inprogress}
    BuiltIn.Sleep  10s



