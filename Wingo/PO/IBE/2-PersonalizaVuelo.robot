*** Variables ***

#FLEX
${FLEX}                  xpath=//div[@class='price col-xs-10']


#DATOS  ADULTO

${TxtNOMBREADULTO}       id=name-ad-XXX
${TxtAPELLIDO}           id=lastname-ad-XXX
${LblSEXO}               id=sex-ad-XXX
${LblSEXOSELECC}         xpath=//li[contains(.,'Masculino')]



${TxtMAIL}               id=email-ad-XXX
${TxtMAILC}              id=email-confirm-ad-XXX
${TxtCELULAR}            id=phone-ad-XXX
${TxtID}                 id=numero-ad-XXX
${ChkGUARDAR}            xpath=//label[contains(.,'Guardar datos en este dispositivo')]

#DATOS  NINO
${TxtNOMBRENINO}           id=name-i6
${TxtAPELLIDONINO}         id=lastname-i6

#DATOS  INFANTES

${TxtNOMBREINF}           id=name-i5
${TxtAPELLIDOINF}         id=lastname-i5


#${NOSERVICIOS}             xpath=//button[contains(.,'No, gracias')]


${BtnCONTINUARALI}          xpath=(//button[@class='btn-continuar'])[1]


*** Keywords ***
Asignar elementos pagina vuelos
   [Arguments]      ${LENGUA}
    ${TxtPasajeros}=     set variable if      ${LENGUA}=='ES'       Completa datos de los viajeros        Complete passenger data
    set test variable       ${TxtPasajeros}

    ${LblANO}=     set variable if      ${LENGUA}=='ES'       xpath=(.//*[normalize-space(text()) and normalize-space(.)="Fecha de nacimiento"])[XXX]/following::select[1]             xpath=(.//*[normalize-space(text()) and normalize-space(.)="Birth Date"])[XXX]/following::select[1]
    set test variable       ${LblANO}

    ${LblMES}=     set variable if      ${LENGUA}=='ES'       xpath=(.//*[normalize-space(text()) and normalize-space(.)="Fecha de nacimiento"])[XXX]/following::select[2]          xpath=(.//*[normalize-space(text()) and normalize-space(.)="Birth Date"])[XXX]/following::select[2]
    set test variable    ${LblMES}

    ${LblDIA}=     set variable if      ${LENGUA}=='ES'        xpath=(.//*[normalize-space(text()) and normalize-space(.)="Fecha de nacimiento"])[XXX]/following::select[3]        xpath=(.//*[normalize-space(text()) and normalize-space(.)="Birth Date"])[XXX]/following::select[3]
    set test variable    ${LblDIA}

    ${LblANONINO}=     set variable if      ${LENGUA}=='ES'           xpath=(.//*[normalize-space(text()) and normalize-space(.)="Fecha de nacimiento"])[XXX]/following::select[1]        xpath=(.//*[normalize-space(text()) and normalize-space(.)="Birth Date"])[XXX]/following::select[1]
    set test variable    ${LblANONINO}

    ${LblMESNINO}=     set variable if      ${LENGUA}=='ES'             xpath=(.//*[normalize-space(text()) and normalize-space(.)="Fecha de nacimiento"])[XXX]/following::select[2]       xpath=(.//*[normalize-space(text()) and normalize-space(.)="Birth Date"])[XXX]/following::select[2]
    set test variable    ${LblMESNINO}

    ${LblDIANINO}=     set variable if      ${LENGUA}=='ES'              xpath=(.//*[normalize-space(text()) and normalize-space(.)="Fecha de nacimiento"])[XXX]/following::select[3]    xpath=(.//*[normalize-space(text()) and normalize-space(.)="Birth Date"])[XXX]/following::select[3]
    set test variable    ${LblDIANINO}

    ${LblANOINF}=     set variable if      ${LENGUA}=='ES'          xpath=(.//*[normalize-space(text()) and normalize-space(.)="Fecha de nacimiento"])[XXX]/following::select[1]      xpath=(.//*[normalize-space(text()) and normalize-space(.)="Birth Date"])[XXX]/following::select[1]
    set test variable     ${LblANOINF}

    ${LblMESINF}=     set variable if      ${LENGUA}=='ES'              xpath=(.//*[normalize-space(text()) and normalize-space(.)="Fecha de nacimiento"])[XXX]/following::select[2]     xpath=(.//*[normalize-space(text()) and normalize-space(.)="Birth Date"])[XXX]/following::select[2]
    set test variable     ${LblMESINF}

    ${LblDIAINF}=     set variable if      ${LENGUA}=='ES'              xpath=(.//*[normalize-space(text()) and normalize-space(.)="Fecha de nacimiento"])[XXX]/following::select[3]     xpath=(.//*[normalize-space(text()) and normalize-space(.)="Birth Date"])[XXX]/following::select[3]
    set test variable     ${LblDIAINF}

    ${NOSERVICIOS}=     set variable if      ${LENGUA}=='ES'              xpath=//button[contains(.,'No, gracias')]     xpath=//button[contains(.,'No thanks')]
     set test variable     ${NOSERVICIOS}

   ${NOFILARAPIDA}=     set variable if      ${LENGUA}=='ES'             xpath=//button[contains(.,'Continuar sin Fila Rápida')]     xpath=//button[contains(.,'No thanks')]