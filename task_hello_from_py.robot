*** Settings ***
Library  my_lib.py

*** Keywords ***
# Empty

# Need to have this or Tasks for something to actually happen (also can't have both)
#*** Test Cases ***

*** Tasks ***
Let's See
    # Calling python function - note () not needed.
    ${result}=  my_lib.greet
    Log To Console  >> ${result} <<