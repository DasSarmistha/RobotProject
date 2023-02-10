*** Settings ***
Library    SeleniumLibrary
Suite Setup     SeleniumLibrary.Open Browser    ${Base_URL}     ${BROWSER}
Suite Teardown  SeleniumLibrary.Close Browser

*** Variables ***
${BROWSER}      Chrome
${Base_URL}     http://localhost:8080/
${Upload_Button}    //input[@type='file']
${FilePath}  C://mama//GovTech//oppenheimer-project-dev//
${FileName}  Document.csv

*** Test Cases ***
Upload File
    Choose File     ${Upload_Button}    ${FilePath}${FileName}
    Sleep   2s