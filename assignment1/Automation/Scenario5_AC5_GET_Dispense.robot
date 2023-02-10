*** Settings ***
Library    SeleniumLibrary
Suite Setup     SeleniumLibrary.Open Browser    ${Base_URL}     ${BROWSER}
Suite Teardown  SeleniumLibrary.Close Browser

*** Variables ***
${BROWSER}      Chrome
${Base_URL}     http://localhost:8080/
${Dispense_Button}    //a[normalize-space()='Dispense Now']

*** Test Cases ***
Dispense
    Click element    xpath:${Dispense_Button}
    Sleep   1s