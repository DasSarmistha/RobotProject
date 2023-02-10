*** Settings ***
Library    SeleniumLibrary
Suite Setup     SeleniumLibrary.Open Browser    ${Base_URL}     ${BROWSER}
Suite Teardown  SeleniumLibrary.Close Browser

*** Variables ***
${BROWSER}      Chrome
${Base_URL}     http://localhost:8080/
${Dispense_Button}    //a[normalize-space()='Dispense Now']
${Dispense_Button_Colour}    //background-color:#dc3545

*** Test Cases ***
Dispense
    ${dispense_class_attributes}=    SeleniumLibrary.Get Element Attribute   xpath=${Dispense_Button}    attribute=class
    log to console  ${dispense_class_attributes}


#    ${css}=     Get WebElement      ${Dispense_Button}
#    log to console  ${css}
#
#    ${prop_val}=    Call Method       ${css}    value_of_css_property    background-color
#    log to console  ${prop_val}

#    ${temp}=    SeleniumLibrary.Get Styles Attribute   btn-danger    attribute=background-color
#    log to console  ${temp}

#style = document.querySelector('h1').style; return style.background == "red" && style.color == "white"
#    ${prop_val}=    Call Method       ${dispense_class_attributes}    value_of_css_property    background-color
#    log to console  ${prop_val}

#    ${value}=       Run Keyword If    ${attr} in ${list_of_attributes}    Get Attribute    ${element}${attr}
#    [Return]    ${value}




#    Click element    xpath:${Dispense_Button}
#    colour:${Dispense_Button_Colour}
#    ${Dispense_Button_Colour}   should be equal     background-color:#dc3545
#    log to consol    ${Dispense_Button_Colour}