*** Settings ***
Library  Process

*** Tasks ***
Run an external thing!
    # Run anything by placing it after "Run Process"
    ${result} =  Run Process  go.bat
    Log To Console  ${result}