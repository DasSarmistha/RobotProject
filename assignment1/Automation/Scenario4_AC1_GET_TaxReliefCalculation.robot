*** Settings ***
Library    Common.py
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${Base_URL}     http://localhost:8080/
${FilePath}     C://mama//GovTech//oppenheimer-project-dev//
${FileName}     Document.CSV

*** Test Cases ***
Simple Positive Testcase for TaxRelief check
    Create session     mysession       ${Base_URL}
    ${Get_Response}=          GET On Session              mysession       calculator/taxRelief
    ${list1}=         set variable                ${Get_Response.json()}
    log to console      ${list1}

    ${list2}=       Common.get_relief_details_from_csv      ${FilePath}${FileName}
    log to console  ${list2}

    ${result}=       Common.list_compare      ${list1}       ${list2}
    log to console      ${result}
    SHOULD BE EQUAL     ${result}       ${TRUE}