*** Settings ***
Resource          ../../Common/User Keywords/MMB/KeywordsMMB.robot


*** Test Cases ***
abrirpagina
    abrir MMB        QAIN      gc
    Loguearse        XIPD9E     Copeland
    ir cambio vuelo