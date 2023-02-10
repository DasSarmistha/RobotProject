*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Library    OperatingSystem
Library    String

*** Keywords ***
Get CSV File


*** Variables ***
${Base_URL}    http://localhost:8080/
${FilePath}  C://mama//GovTech//oppenheimer-project-dev//
${FileName}  Document.CSV

*** Test Cases ***
Simple Positive Testcase for request TaxReliefSummaryPage
    ${singlelist}       Read CSV As Single List     ${FilePath}${FileName}
    Logs to console     ${singlelist}

#     ${csv}     Get File    ${FilePath}${FileName}
#     @{read}    Create List     ${csv}
#     @{lines}   Split To Lines  @{read}
#
#     For   ${line}   IN    @{lines}
#        Logs to Console    \n${line}
#     END

#    Create Session            mysession                   ${Base_URL}
#    ${Get_Response}=          GET On Session              mysession       calculator/taxRelief
#    ${json_response}=         set variable                ${Get_Response.json()}
#
#
#    Log to console    ${json_response}
#    FOR   ${item}   IN      @{json_response}
#        #Log to console      ${item}
#        Log to console      ${item['natid']}
#        Log to console      ${item['name']}
#        Log to console      ${item['relief']}
#        Log to console      "============================="
#    END

#    @{natid}=     get value from json       ${json_response}     natid
#    Log to console    ${natid}
#    @{name}=        get value from json       ${json_response}     name
#    Log to console    ${name}
#    @{statusCode}=     get value from json       ${json_response}     statusCode
#    ${statusCode}=    convert to string    ${GET_Response.status_code}
#    should be equal    ${statusCode}    200
#    Log to console    ${statusCode}
