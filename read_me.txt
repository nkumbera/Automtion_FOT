Env Setup:
  - Install Python and set the evironment
     cmd> python
  - Install PyCharm Community Edition
    - Set up the compiler
  - run below command to setup dependent library
     pip install -r requirement.txt

Folder Description:
  - Testsuites :  Robot test cases/Entry Point file or test cases to be run, the test script under heading *** Test Cases ***.
  - Resources : Re-usable or robot keyworks to be called from Testsuites Test Cases. Create directory base on functionality
  - Properties : Environment variables used by test suites
  - Assets : XMS or Configuration repository

DMS Setup:
   - Update DMS URL and configuration parameter in  properties-> common.py


Run the script
    - from command line or pycharm terminal, run below command
      python run_test.py   -i regression   ( regression is a tag in the robot  test cases )
      python run_test.py -i init_device_pnp -v device:0005B9519F1
      python run_test.py -i init_device_pnp -v device:0005B9519F1  -V robot/properties/DMS_SVT1.py