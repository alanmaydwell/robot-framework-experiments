*** Settings ***
Library  Process
Library  DateTime
Library  cypress_runner.py


*** Variables ***
${CYPRESS_EXECUTABLE_PATH}    node_modules\\.bin\\cypress

*** Keywords ***
What time is it
    [Arguments]   ${message}= ""
    ${now} =  Get Current date
    Log To Console  ${message} ${now}

# This one uses Run Process keyword to run the subprocess
Cypress runner
    [Arguments]    ${cypress_script_path}
    What time is it  "Start "
    # Care with spaces - two (or more) after Run Process but the each component of the command to be executed are only separated by one,
    # after this back to 2 (or more) spaces for any subsequent parameters.
    ${result} =    Run Process  ${CYPRESS_EXECUTABLE_PATH} run ${cypress_script_path}  stderr=STDOUT  stdout=PIPE  shell=True
    What time is it  "Stop "
    [return]  ${result}


# This one imports a python function to run the subprocess
Cypress runner python
    [Arguments]    ${cypress_script_path}
    What time is it  "Start "
    # Care with spaces - two (or more) after Run Process but the each component of the command to be executed are only separated by one,
    # after this back to 2 (or more) spaces for any subsequent parameters.
    ${result} =    cypress_runner.run_cypress_script  ${cypress_script_path}  ${CYPRESS_EXECUTABLE_PATH}
    What time is it  "Stop "
    [return]  ${result}    


*** Tasks ***

Cypress simple
    ${response} =  Cypress runner  cypress\\e2e\\quick_spec.cy.js
    Log To Console   ${response.stdout}
    ${response} =  Cypress runner python  cypress\\e2e\\quick_spec.cy.js
    # This one is already stdout
    Log To Console   ${response}