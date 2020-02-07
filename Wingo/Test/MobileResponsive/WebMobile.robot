*** Settings ***
Resource          ../../Common/User Keywords/WebResposive/KeywordsWR.robot



*** Test Cases ***
Flujo IBE
    abrir pagina       QA     motoe
    Tipo vuelo         RT
    Ingresar_ruta      BOG     CCS
    Ingresar pasajeros
    #Ingresar Moneda    COP

    #debug



*** Keywords ***
Provided precondition
    Setup system under test

