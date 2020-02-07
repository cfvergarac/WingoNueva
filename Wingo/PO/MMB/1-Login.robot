*** Settings ***


*** Variables ***

${BtnLoginCH}

${CHKPASAJEROSCH}          xpath=(//label[contains(.,'Hacer Check-in')])[XXX]
${BtnContinuarCH}          xpath=//button[contains(.,'Continuar')]
${BtnSiguienteCH}          id=nextInfoAd
${BtnPasabordoCH}          xpath=//button[contains(.,'Descarga tu pasabordo')]

*** Keywords ***
Asigna PO pagina principal
    [Arguments]      ${IDIOMA}
    Import Library       ${CURDIR}/LoginPO.py    ${IDIOMA}
    ${CampoPNR}=         TxtPnr
    set test variable    ${CampoPNR}
    ${CampoApellido}=    TxtApellido
    set test variable    ${CampoApellido}
    ${BotonEntrar}=      BtnEntrar
    set test variable    ${BotonEntrar}
    ${TextoHaEntrado}=   Msgconfirmacion
    set test variable    ${TextoHaEntrado}

