*** Settings ***
Documentation  Documentação API: https://petstore.swagger.io/
Resource       Resources.Robot
Suite Setup    Conectar a minha API      ### Setup é a inicialização do seu teste, basicamente podemos dizer que são os pré-requisitos 

*** Test Case ***

Adicionar um novo Pet 
     Incluir um Pet 
Buscar lista de Pets 
     Buscar Pet por ID 
     Conferir status code    200 

Excluir um Pet
    Delete Pet 
    Conferir status code    200 
    

