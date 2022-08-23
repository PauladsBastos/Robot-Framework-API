*** Settings ***
Documentation   Documentação da API: 
Library         RequestsLibrary 
Library         Collections
Library         OperatingSystem
Library    String

*** Variable ***
${URL_API}      https://petstore.swagger.io/v2/

*** Keywords ***

Conectar a minha API 
    Create Session    apipets    ${URL_API}

Incluir um Pet
     ${HEADERS}   Create Dictionary    content-type=application/json
     ${RESPOSTA}  POST On Session   apipets    ${URL_API}pet
     ...                            data={"id": 6667,"category": {"id": 6667,"name": "Dog"},"name": "Aishaa","photoUrls": ["string"],"tags": [{"id": 0,"name": "sef"}],"status": "sold"}
     ...                            headers=${HEADERS}
     Log       ${RESPOSTA.status_code} 
     Set Test Variable     ${RESPOSTA} 
Buscar Pet por ID
     ${RESPOSTA}   GET On Session    apipets   ${URL_API}pet/6667
     Log       ${RESPOSTA.status_code} 
     Set Test Variable     ${RESPOSTA} 

Conferir status code
    [Arguments]    ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings   ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}     


Delete Pet
    ${RESPOSTA}   DELETE On Session     apipets   ${URL_API}pet/6667
    Log       ${RESPOSTA.status_code} 
    Set Test Variable     ${RESPOSTA} 




     


