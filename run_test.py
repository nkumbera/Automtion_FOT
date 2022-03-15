from robot import run_cli
from datetime import datetime
import sys

def create_command():
    dateTimeObj = str(datetime.now())
    dateTimeObj=  dateTimeObj.replace('-','_').replace(' ','_').replace(':','_')
    dateTimeObj = dateTimeObj[:dateTimeObj.find('.')]
    #tag =''
    robot_argument=''
    for index,value in enumerate(sys.argv[1:]):
        if value == '-i':
            tag = sys.argv[index+2]
            print(tag)
        robot_argument = robot_argument+ " " +value

    #robot_argument =  robot_argument + ' -d output/'+tag+'_'+dateTimeObj + " -V robot/properties/common.py -V robot/properties/dms_ui_controls.py -V robot/properties/slamd_ui_controls.py robot/."
    robot_argument = robot_argument + ' -d output/' + tag + '_' + dateTimeObj + " -V robot/properties/common.py robot/."
    return robot_argument

if __name__ == '__main__':
    command = create_command()
    command = command.strip()
    command_arg = command.split(' ')
    print(command_arg)
    run_cli(command_arg)


