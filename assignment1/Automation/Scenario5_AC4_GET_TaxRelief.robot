*** Settings ***
Library    RequestsLibrary

*** Variables ***
${Base_URL}    http://localhost:8080/


*** Test Cases ***
Simple Positive Testcase for request TaxReliefPage
    Create Session    mysession    ${Base_URL}
    ${Get_Response}=    GET On Session    mysession    calculator/taxReliefSummary
    Log to console    ${Get_Response.status_code}
    Log to console    ${Get_Response.content}
#Validations
    ${statusCode}=    convert to string    ${GET_Response.status_code}
    should be equal    ${statusCode}    200
    ${body}=    convert to string    ${GET_Response.content}
    should contain    ${body}    totalWorkingClassHeroes


Simple Negative Testcase for request TaxReliefPage
    Create Session    mysession    ${Base_URL}
    ${Get_Response}=    GET On Session    mysession    calculator/taxReliefSummary1  expected_status=any
    Log to console    ${Get_Response.status_code}
#Validations
    ${statusCode}=     convert to string    ${GET_Response.status_code}
    should be equal    ${statusCode}    404









