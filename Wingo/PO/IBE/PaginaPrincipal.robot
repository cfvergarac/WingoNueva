*** Variables ***

#FECHAS



#PASAJEROS

${SltPASAJEROS}     xpath=//span[@class='info-select']
${ADULTOS}          xpath=(//div[contains(@class,'plus')])[1]
${NINOS}            xpath=(//div[contains(@class,'plus')])[2]
${INFANTES}         xpath=(//div[contains(@class,'plus')])[3]

#BOTON CONTINUAR
${BtnCONTINUAR}     xpath=//div[@name='searchFlight']
${BtnINFANTES}      xpath=//button[@class='bt-wingo-blue-pop-up']

${LblPrecio}       xpath=//div[@class='price']
#GIFs
#${GIFMALETAS}      xpath=//img[contains(@class,'wng-icon-loader')]

#Pop up de rutas

${PopUpRutas}         id=_wingocomponentsibenew_INSTANCE_ctyl_titleMessageIbe
${BtnPopUpRutas}      xpath=//button[contains(.,'OK')]

*** Keywords ***
Asignar elementos Pagina principal
    [Arguments]      ${LENGUA}
    set test variable    ${LENGUA}
    ${ChkTVUELO}=    Set Variable  xpath=//div[@class='circle']
    set test variable    ${ChkTVUELO}
    ${SltDESDE}=  set variable     xpath=//div[@class='styledSelect styledSelectOrigen']
    set test variable    ${SltDESDE}
    ${TxtORIGEN}=     Set Variable      id=_wingocomponentsibenew_INSTANCE_ctyl_inputOrigen
    set test variable    ${TxtORIGEN}
    ${SltDESTINO}=    Set Variable      xpath=//input[@class='searchSelect searchSelectIbeD'][contains(@id,'inputDestino')]
    set test variable    ${SltDESTINO}
    ${CiuORIGEN}=     Set Variable      xpath=//li[contains(@data-cod,'XXX')]
    set test variable    ${CiuORIGEN}
    ${CiuDESTINO}=    Set Variable      xpath=(//li[@data-cod='XXX'])[2]
    set test variable    ${CiuDESTINO}
    ${SlcMONEDA}=     Set Variable        xpath=//div[@class='styledSelect styledSelectMoneda']
    set test variable    ${SlcMONEDA}
    ${MONEDACOP}=     set variable if      ${LENGUA}=='ES'       xpath=//li[contains(.,'Peso Colombiano (COP)')]     xpath=//li[contains(.,'Colombian Peso (COP)')]
    set test variable      ${MONEDACOP}
    ${MONEDAUSD}=     set variable if      ${LENGUA}=='ES'       xpath=//li[contains(.,'Dólar Americano (USD)')]     xpath=//li[contains(.,'US Dollar (USD)')]
    set test variable      ${MONEDAUSD}

    set test variable    ${SlcANOPARTIDA}    xpath=(//select[contains(@class,'year')])[1]
    set test variable    ${SlcANOSALIDA}     xpath=(//select[contains(@class,'year')])[3]

    ${SltFECHAIDA}=     Set Variable         xpath=//div[@class='info-airport info-airport-ida']
    set test variable      ${SltFECHAIDA}
    ${SIGMES}=     Set Variable              xpath=//span[@class='next']
    set test variable      ${SIGMES}
    ${MESIDA}=         Set Variable            xpath=(//select[@class='month'])[1]
    set test variable      ${MESIDA}
    ${MESVUELTA}=      Set Variable          xpath=(//select[@class='month'])[3]
    set test variable     ${MESVUELTA}

    ${DtePARTIDA}=     set variable if      ${LENGUA}=='ES'       xpath=(.//*[normalize-space(text()) and normalize-space(.)='Do'])[1]/following::div[XXX]      xpath=(.//*[normalize-space(text()) and normalize-space(.)='Su'])[1]/following::div[XXX]
    set test variable      ${DtePARTIDA}

    ${DteREGRESO}=     set variable if      ${LENGUA}=='ES'         xpath=(.//*[normalize-space(text()) and normalize-space(.)='Do'])[3]/following::div[XXX]    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Su'])[3]/following::div[XXX]
    set test variable      ${DteREGRESO}

    ${TxtInfantes}=     set variable if      ${LENGUA}=='ES'       ¿Viajas con un infante?        Do you travel with an infant?
    set test variable       ${TxtInfantes}


    ${TxtTarifas}=     set variable if      ${LENGUA}=='ES'       Elige tu mejor tarifa        Select your best fare
    set test variable       ${TxtTarifas}

    ${BtnCONTINUARPV}=     set variable if      ${LENGUA}=='ES'        xpath=(//button[contains(.,'Continuar')])[1]       xpath=(//button[contains(.,'Continue')])[1]
    set test variable       ${BtnCONTINUARPV}