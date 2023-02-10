*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${Base_URL}    http://localhost:8080/

*** Test Cases ***
1- Positive Test case for Single insert Person
    Create session     mysession       ${Base_URL}
    ${body}=    create dictionary     birthday=01012016  gender=M  name=AWSED  natid=111333  salary=535.55  tax=50.0
    ${header}=   create dictionary      Content-Type=application/json

    ${response}=    POST request    mysession     /calculator/insert    data=${body}  headers=${header}
    ${statusCode}=    convert to string    ${Response.status_code}
    should be equal    ${statusCode}    202
    log to console   ${response.status_code}

2- Negative Test case for Single insert Person "Post Request Expect Anything Status And Continue On Error"
    Create session     mysession       ${Base_URL}
    ${body}=    create dictionary     birthday=01012016  gender=M   tax=50.0
    ${header}=   create dictionary      Content-Type=application/json
    ${response}=    POST request    mysession     /calculator/insert    data=${body}  headers=${header}
    ${statusCode}=    convert to string    ${Response.status_code}
    should be equal    ${statusCode}    500
    log to console   ${response.status_code}

