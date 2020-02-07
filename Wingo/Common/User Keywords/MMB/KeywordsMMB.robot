*** Settings ***
Resource    ../../../Common/TodasLasLibrerias.robot
Resource    ../../../PO/MMB/1-Login.robot
Resource    ../../../PO/MMB/3-CambioVuelo.robot
Resource    ../../../Common/VariablesMMB/Variables.robot



*** Keywords ***
abrir MMB
    [Arguments]      ${AMBIENTE}    ${NAVEGADOR}
    set test variable    ${AMBIENTE}
    Asigna PO pagina principal    ${LENGUAJE.${AMBIENTE}}
    Open Browser    ${URL.${AMBIENTE}}       ${NAVEGADOR}
    Maximize Browser Window

Loguearse
    [Arguments]     ${PNR}    ${APELLIDO}
    Wait Until Page Contains Element    ${CampoPNR}
    Input Text      ${CampoPNR}     ${PNR}
    Input Text      ${CampoApellido}    ${APELLIDO}
    Wait Until Page Contains Element    ${BotonEntrar}
    Click Button    ${BotonEntrar}
    Wait Until Page Contains    ${TextoHaEntrado}

ir cambio vuelo
     Asigna PO cambio vuelo    ${LENGUAJE.${AMBIENTE}}
     Wait Until Page Contains Element     ${BtnIrCambio}    10s
     Click Button    ${BtnIrCambio}



