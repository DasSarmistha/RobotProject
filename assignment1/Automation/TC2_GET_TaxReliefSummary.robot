*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${Base_URL}    http://localhost:8080/

*** Test Cases ***
Simple Positive Testcase for request TaxReliefSummaryPage
    Create Session            mysession                   ${Base_URL}
    #${Response}=    GET    FetchData     calculator/taxReliefSummary
    #Log to console    ${Response.statusCode}
    ${Get_Response}=          GET On Session              mysession       calculator/taxReliefSummary
    ${json_response}=         set variable                ${Get_Response.json()}
    @{totalWorkingClassHeroes}=     get value from json       ${json_response}     totalWorkingClassHeroes
    Log to console    ${totalWorkingClassHeroes}
    @{totalTaxReliefAmount}=        get value from json       ${json_response}     totalTaxReliefAmount
    Log to console    ${totalTaxReliefAmount}
    @{statusCode}=     get value from json       ${json_response}     statusCode
    ${statusCode}=    convert to string    ${GET_Response.status_code}
    should be equal    ${statusCode}    200
    Log to console    ${statusCode}









