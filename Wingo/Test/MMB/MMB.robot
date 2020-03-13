*** Settings ***
Resource          ../../Common/User Keywords/MMB/KeywordsMMB.robot


*** Test Cases ***
abrirpagina
    abrir MMB        QAL       gc
    Loguearse        5K3119    Barker
    ir cambio vuelo