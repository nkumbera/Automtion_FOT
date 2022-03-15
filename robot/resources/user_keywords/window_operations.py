import pyautogui,time
device_url = '{}#!mv/dashboard/?srchKey=MAC&id={}&dt=onecell&context=null'
def inputfile():
    time.sleep(2)
    pyautogui.typewrite("C:\\LTE\\DMS_Automation\\robot\\assets\\service_setting_files\\ServiceSetting_onecell_0005B9519E0A_4.5.xml")
    #pyautogui.TypewriteC:\\LTE\\DMS_Automation\\robot\\assets\\service_setting_files\\ServiceSetting_onecell_0005B9519E0A_4.5.xml
    time.sleep(2)
    pyautogui.keyDown('enter')
    time.sleep(2)
    pyautogui.keyDown('enter')
    pyautogui.press('enter')


def get_device_url(base_url,device_macid):
    final_rul = device_url.format(base_url,device_macid)
    return final_rul



if __name__ == '__main__':
    dms_url = 'http://10.212.2.245:7001/deviceconsole/'
    devic_id = '0005B97C01'
    final_url = get_device_url(dms_url,devic_id)
    print(final_url)