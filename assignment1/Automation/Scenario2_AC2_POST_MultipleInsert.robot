*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections


*** Variables ***
${Base_URL}    http://localhost:8080/

*** Test Cases ***
1- Positive Test case for Multiple inserts
    Create session     mysession       ${Base_URL}
    ${body}=    convert to string   [{"birthday": "02091990", "gender": "F", "name": "JK KQWAS", "natid": "111444", "salary": "6000.00", "tax": "60.0"}, {"birthday": "02091980", "gender": "M", "name": "QWAS", "natid": "111445", "salary": "567.89", "tax": "20.3"}]
    log to console   ${body}

    ${header}=   create dictionary     Content-Type=application/json
    ${response}=    POST On Session      mysession       /calculator/insertMultiple    data=${body}  headers=${header}
    log to console   ${response.status_code}
    log to console   ${response.content}

2- Negative Test case for Multiple inserts
    Create session     mysession       ${Base_URL}

    ${body}=    convert to string   [{"birthday": "02091990", "gender": "F", "tax": "60.0"}, {"birthday": "02091980", "gender": "M", "tax": "20.3"}]

    ${header}=   create dictionary      Content-Type=application/json
    ${response}=    POST request    mysession     /calculator/insertMultiple    data=${body}  headers=${header}
    ${statusCode}=    convert to string    ${Response.status_code}

    should be equal    ${statusCode}    500

    log to console   ${response.status_code}
