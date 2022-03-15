*** Settings ***
Resource            ../../common/ui_common.robot
Library             SeleniumLibrary
Library             Collections
Library             String
Library             OperatingSystem
Variables           Enterprise_View_ui_controls.py

*** Variables ***


*** Keywords ***
Click On Enterprise View Menu Item
    BuiltIn.Sleep  10s
    [Documentation]  click on Enterprise View page
    go to  ${DMS_NC_Enterprise_View}
    #Scroll Element Into View  ${enterpriseview}
    #BuiltIn.Sleep  2s
    #Click DMS Element  ${enterpriseview}
    BuiltIn.Sleep  15s

