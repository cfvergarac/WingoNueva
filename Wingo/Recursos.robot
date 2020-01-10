*** Settings ***
Resource    Common/TodasLasLibrerias.robot
Resource    variables.robot
Resource    PO/PaginaPrincipal.robot
Resource    PO/2-PersonalizaVuelo.robot
Resource    PO/3-AsignaSillas.robot
Resource    PO/4-Pagos.robot
Resource    PO/5-EligeVuelo.robot


*** Keywords ***

Abrir_Pagina_Principal
    [Arguments]      ${AMBIENTE}    ${NAVEGADOR}
    set test variable     ${NAVEGADOR}
    Open Browser    ${URL.${AMBIENTE}}    ${NAVEGADOR}
    Maximize Browser Window
    Run Keyword If  ('${AMBIENTE}' == 'PRODNueva' )    Asignar elementos Pagina principal    'ES'

Ingresar_tipo_vuelo
    [Arguments]      ${TVUELO}
    Set Test Variable    ${TVUELO}
    Run Keyword If  ('${TVUELO}' == 'OW')    One_Way

One_Way
    Wait Until Page Contains Element    ${ChkTVUELO}
    Click Element    ${ChkTVUELO}

RoundTrip
    [Arguments]    ${MESLLEGADA}    ${DIALLEGADA}
    ${DIALLEGADA}=    Evaluate    ${DIALLEGADA} + ${SUMAFECHA.${MESLLEGADA}}
    ${DIALLEGADA}=    Convert To String    ${DIALLEGADA}
    ${DteREGRESO} =	 Replace String	  ${DteREGRESO}	   XXX	  ${DIALLEGADA}
    Select From List By Label   ${MESVUELTA}      ${MESLLEGADA}
    Click Element    ${DteREGRESO}

Ingresar_lugares
    [Arguments]      ${ORIGEN}    ${DESTINO}
    ${CiuORIGEN} =	 Replace String	  ${CiuORIGEN}	   XXX	  ${ORIGEN}
    ${CiuDESTINO} =	 Replace String	  ${CiuDESTINO}	   XXX	  ${DESTINO}
    Sleep   1s
    Click Element    ${SltDESDE}
    Input Text       ${TxtORIGEN}    ${ORIGEN}
    Click Element    ${CiuORIGEN}
    Input Text       ${SltDESTINO}   ${DESTINO}
    Click Element    ${CiuDESTINO}


Seleccionar_Fechas
    [Arguments]      ${MESSALIDA}   ${DIASALIDA}    ${MESLLEGADA}    ${DIALLEGADA}
    ${DIASALIDA}=    Evaluate    ${DIASALIDA} + ${SUMAFECHA.${MESSALIDA}}
    ${DIASALIDA}=    Convert To String    ${DIASALIDA}
    ${DtePARTIDA} =	 Replace String	  ${DtePARTIDA}	   XXX	  ${DIASALIDA}
    Click Element    ${SltFECHAIDA}
    wait until page contains element    ${MESIDA}
    Select From List By Label    ${MESIDA}        ${MESSALIDA}
    Click Element    ${DtePARTIDA}
    Run Keyword If  ('${TVUELO}' == 'RT')    RoundTrip    ${MESLLEGADA}    ${DIALLEGADA}

Ingresa_Pasajeros
    [Arguments]      ${NUMADULTOS}    ${NUMNINOS}    ${NUMINFANTES}
    Click Element     ${SltPASAJEROS}
    ${NUMADULTOS}=      Evaluate    ${NUMADULTOS}-1
    ${TIENEINFANTES}=   Evaluate    ${NUMINFANTES} > 0
    Run Keyword If  ('${TIENEINFANTES}' == 'False')    Set Test Variable    ${HAYINFANTES}    No
    Run Keyword If  ('${TIENEINFANTES}' == 'True')     Set Test Variable     ${HAYINFANTES}     Si
    Repeat Keyword    ${NUMADULTOS}       Click Element    ${ADULTOS}
    Repeat Keyword    ${NUMNINOS}         Click Element    ${NINOS}
    Repeat Keyword    ${NUMINFANTES}      Click Element    ${INFANTES}
    ${NUMADULTOS}=       Evaluate    ${NUMADULTOS}+2
    Set Test Variable    ${NUMADULTOS}
    Set Test Variable    ${NUMNINOS}
    Set Test Variable    ${NUMINFANTES}
    Set Test Variable    ${TIENEINFANTES}

Seleccionar_moneda
    [Arguments]      ${MONEDA}
    Click Element    ${SlcMONEDA}
    Capture Page Screenshot
    Run Keyword If  ('${MONEDA}'== 'COP')    Click Element    ${MONEDACOP}
    Run Keyword If  ('${MONEDA}'== 'USD')    Click Element    ${MONEDAUSD}

Continuar
    Click Element    ${BtnCONTINUAR}
    Select Window    title=Wingo
    Run Keyword If  ('${HAYINFANTES}' == 'Si')    Valida_infantes
    Wait Until Page Contains     Elige tu mejor tarifa    10s

Seleccionar_flex
    [Arguments]      ${TIENEFLEX}
    #TODO: este flex estaba generando el problema de carga de la pagina
    #Click Element     ${FLEX}
    #Seleccionar_avion
    Wait Until Page Contains Element    ${BtnCONTINUARPV}
    Click Javascript    ${BtnCONTINUARPV}

Seleccionar_avion
    Click Element    ${CERRARVIENDO}
    Wait Until Element Is Visible    ${CHkVUELO}
    Click Element      ${CHkVUELO}

Valida_infantes
     Wait Until Page Contains    ¿Viajas con un infante?
     Click Element     ${BtnINFANTES}

#TODO: ordenar esta infamia, poner fecha actual como variable global, el sleep
Llena_datos_viajero
    Wait Until Page Contains     Completa datos de los viajeros
    Sleep   2s
    Ingresa_adultos
    ${TIENENINOS}=   Evaluate    ${NUMNINOS} > 0
    Run Keyword If  ('${TIENENINOS}' == 'True')       Ingresa_ninos
    Run Keyword If  ('${TIENEINFANTES}' == 'True')    Ingresa_infantes
    Wait Until Page Contains Element     ${BtnCONTINUARALI}
    Click Javascript    ${BtnCONTINUARALI}
    Sleep   1s
    ${present}=   Run Keyword And Return Status    Wait Until Element Is Visible    ${NOSERVICIOS}    2s
    Run Keyword If    ${present}    Click Element      ${NOSERVICIOS}
    ${present}=   Run Keyword And Return Status    Wait Until Element Is Visible    ${NOFILARAPIDA}    2s
    Run Keyword If    ${present}    Click Element      ${NOFILARAPIDA}


Ingresa_adultos
    : FOR    ${INDEX}    IN RANGE    1    ${NUMADULTOS}
    \   ${NOMBREADULTO} =     FakerLibrary.first_name
    \   ${APELLIDOADULTO}=    FakerLibrary.last_name
    \   ${CORREOADULTO}=      FakerLibrary.Email
    \   ${CELULARADULTO}=     Set Variable       310
    \   ${TOKEN}=             FakerLibrary.Numerify  %######
    \   ${CELULARADULTO}=     Catenate   ${CELULARADULTO}    ${TOKEN}
    \   ${CELULARADULTO}=     Evaluate   '${CELULARADULTO}'.replace(" ", "")
    \   ${IDADULTO}=          Set Variable
    \   ${IDADULTO}=          Catenate   ${IDADULTO}    ${TOKEN}
    \   ${IDADULTO}=          Evaluate   '${IDADULTO}'.replace(" ", "")
    \   ${ANO}=               Get Current Date   result_format=%Y
    \   ${ANO}=               Convert To Integer   ${ANO}
    \   ${ANOADULTO}=         Evaluate   ${ANO}-30
    \   ${ANOADULTO}=         Convert To String    ${ANOADULTO}
    \   ${DIA}=               Get Current Date   result_format=%d
    \   ${DIA}=               Convert To String    ${DIA}
    \   ${MES}=               Get Current Date   result_format=%m
    \   ${MES}=               Convert To String    ${MES}
    \    ${TxtNOMBREADULTO}=     Evaluate   '${TxtNOMBREADULTO}'.replace("XXX", "${INDEX}")
    \    Input Text    ${TxtNOMBREADULTO}    ${NOMBREADULTO}
    \    ${TxtAPELLIDO}=     Evaluate   '${TxtAPELLIDO}'.replace("XXX", "${INDEX}")
    \    Input Text    ${TxtAPELLIDO}    ${APELLIDOADULTO}
    \    ${LblSEXO}=        Evaluate   '${LblSEXO}'.replace("XXX", "${INDEX}")
    \    Select From List By Index    ${LblSEXO}    1
    \    ${LblANO}=        Evaluate    '${LblANO}'.replace("XXX", "${INDEX}")
    \    Select From List By Label    ${LblANO}      ${ANOADULTO}
    \    ${LblMES}=        Evaluate    '${LblMES}'.replace("XXX", "${INDEX}")
    \    Select From List By Index    ${LblMES}      ${MES}
    \    ${LblDIA}=        Evaluate    '${LblDIA}'.replace("XXX", "${INDEX}")
    \    Select From List By Index    ${LblDIA}      4
    \    ${TxtMAIL}=     Evaluate   '${TxtMAIL}'.replace("XXX", "${INDEX}")
    \    Input Text    ${TxtMAIL}    ${CORREORESERVA}
    \    ${TxtMAILC}=     Evaluate   '${TxtMAILC}'.replace("XXX", "${INDEX}")
    \    Input Text    ${TxtMAILC}    ${CORREORESERVA}
    \    ${TxtCELULAR}=     Evaluate   '${TxtCELULAR}'.replace("XXX", "${INDEX}")
    \    Input Text    ${TxtCELULAR}    ${CELULARADULTO}
    \    ${TxtID}=     Evaluate   '${TxtID}'.replace("XXX", "${INDEX}")
    \    Input Text    ${TxtID}    ${IDADULTO}
    \    ${TxtNOMBREADULTO}=     Evaluate   '${TxtNOMBREADULTO}'.replace("${INDEX}", "XXX")
    \    ${TxtAPELLIDO}=         Evaluate   '${TxtAPELLIDO}'.replace("${INDEX}", "XXX")
    \    ${LblSEXO}=             Evaluate   '${LblSEXO}'.replace("${INDEX}", "XXX")
    \    ${LblANO}=              Evaluate   '${LblANO}'.replace("${INDEX}", "XXX",1)
    \    ${LblMES}=              Evaluate   '${LblMES}'.replace("${INDEX}", "XXX",1)
    \    ${LblDIA}=              Evaluate   '${LblDIA}'.replace("${INDEX}", "XXX",1)
    \    ${TxtMAIL}=             Evaluate   '${TxtMAIL}'.replace("${INDEX}", "XXX")
    \    ${TxtMAILC}=            Evaluate   '${TxtMAILC}'.replace("${INDEX}", "XXX")
    \    ${TxtCELULAR}=          Evaluate   '${TxtCELULAR}'.replace("${INDEX}", "XXX")
    \    ${TxtID}=               Evaluate   '${TxtID}'.replace("${INDEX}", "XXX")


Ingresa_ninos
    #TODO: hacer dinamicas las fechas de nacimiento de todos los tipos de pasajeros
    ${MES}=                 Get Current Date   result_format=%m
    ${MES}=                 Convert To String    ${MES}

    : FOR    ${INDEX}    IN RANGE    1    ${NUMNINOS}+1
    \    ${NOMBRENINO}=          FakerLibrary.first_name
    \    ${APELLIDONINO}=        FakerLibrary.last_name
    \    ${TxtNOMBRENINO}=      Catenate    SEPARATOR=-    ${TxtNOMBRENINO}  ${INDEX}
    \    Input Text    ${TxtNOMBRENINO}    ${NOMBRENINO}
    \    ${TxtAPELLIDONINO}=      Catenate    SEPARATOR=-    ${TxtAPELLIDONINO}  ${INDEX}
    \    Input Text    ${TxtAPELLIDONINO}    ${APELLIDONINO}
    \    ${INDICENINO}=        Evaluate    ${NUMADULTOS} + ${INDEX} - 1
    \    ${LblANONINO}=        Evaluate    '${LblANONINO}'.replace("XXX", "${INDICENINO}")
    \    Select From List By Label          ${LblANONINO}      2012
    \    ${LblMESNINO}=        Evaluate    '${LblMESNINO}'.replace("XXX", "${INDICENINO}")
    \    Select From List By Index          ${LblMESNINO}      4
    \    ${LblDIANINO}=        Evaluate    '${LblDIANINO}'.replace("XXX", "${INDICENINO}")
    \    Select From List By Index          ${LblDIANINO}      4
    \    ${TxtNOMBRENINO}=        Get Substring    ${TxtNOMBRENINO}    0  10
    \    ${TxtAPELLIDONINO}=      Get Substring    ${TxtAPELLIDONINO}  0  14
    \    ${LblANONINO}=           Evaluate   '${LblANONINO}'.replace("${INDICENINO}", "XXX",1)
    \    ${LblMESNINO}=           Evaluate   '${LblMESNINO}'.replace("${INDICENINO}", "XXX",1)
    \    ${LblDIANINO}=           Evaluate   '${LblDIANINO}'.replace("${INDICENINO}", "XXX",1)

Ingresa_infantes
    ${MES}=                 Get Current Date   result_format=%m
    ${MES}=                 Convert To String    ${MES}
    : FOR    ${INDEX}    IN RANGE    1    ${NUMINFANTES}+1
    \    ${NOMBREINF}=          FakerLibrary.first_name
    \    ${APELLIDOINF}=        FakerLibrary.last_name
    \    ${TxtNOMBREINF}=      Catenate    SEPARATOR=-    ${TxtNOMBREINF}  ${INDEX}
    \    Input Text    ${TxtNOMBREINF}    ${NOMBREINF}
    \    ${TxtAPELLIDOINF}=      Catenate    SEPARATOR=-    ${TxtAPELLIDOINF}  ${INDEX}
    \    Input Text    ${TxtAPELLIDOINF}    ${APELLIDOINF}
    \    ${INDICEINF}=        Evaluate    ${NUMADULTOS} + ${NUMNINOS} + ${INDEX} -1
    \    ${LblANOINF}=        Evaluate    '${LblANOINF}'.replace("XXX", "${INDICEINF}")
    \    Select From List By Label          ${LblANOINF}      2018
    \    ${LblMESINF}=        Evaluate    '${LblMESINF}'.replace("XXX", "${INDICEINF}")
    \    Select From List By Index          ${LblMESINF}      4
    \    ${LblDIAINF}=        Evaluate    '${LblDIAINF}'.replace("XXX", "${INDICEINF}")
    \    Select From List By Index         ${LblDIAINF}      4

    \    ${TxtNOMBREINF}=          Get Substring    ${TxtNOMBREINF}      0  10
    \    ${TxtAPELLIDOINF}=        Get Substring    ${TxtAPELLIDOINF}    0  14
    \    ${LblANOINF}=             Evaluate   '${LblANOINF}'.replace("${INDICEINF}", "XXX",1)
    \    ${LblMESINF}=             Evaluate   '${LblMESINF}'.replace("${INDICEINF}", "XXX",1)
    \    ${LblDIAINF}=             Evaluate   '${LblDIAINF}'.replace("${INDICEINF}", "XXX",1)


Selecciona_sillas
    Wait Until Page Contains    ¿Quieres escoger tu silla? (Opcional)
    #Sleep   15s
    Run Keyword If  ('${TVUELO}' == 'RT')    Sillas_RT
    Run Keyword If  ('${TVUELO}' == 'OW')    Sillas_OW

Sillas_RT
    wait until page does not contain    ${GIFAVION}
    Wait Until Page Contains Element    ${BtnVUELOREGRESO}
    Click Javascript    ${BtnVUELOREGRESO}
    Wait Until Page Contains Element   ${BtnCONTINUAROW}
    Click Javascript    ${BtnCONTINUAROW}

Sillas_OW
    Wait Until Page Contains Element   ${BtnCONTINUAROW}
    Click Javascript     ${BtnCONTINUAROW}

hacer_pago
   [Arguments]      ${TIPOPAGO}
   Run Keyword If   ('${TIPOPAGO}' == 'cash')              Pago_Cash
   Run Keyword If   ('${TIPOPAGO}' == 'pse')               Pago_PSE
   Run Keyword If   ('${TIPOPAGO}' == 'sp_deb')            Pago_safetypay_deb
   Run Keyword If   ('${TIPOPAGO}' == 'sp_cash')           Pago_safetypay_cash
   Run Keyword If   ('${TIPOPAGO}' == 'tc')                Pago_tarjeta_credito


Pago_PSE
   Wait Until Page Contains Element    ${ACORDEONPSE}
   #TODO: la linea de abajo va comentariada en produccion, no en qa
   ${present}=   Run Keyword And Return Status    Wait Until Page Contains Element    ${BtnSEGURO}    2s
   Run Keyword If    ('${present}' == 'True')     Execute Javascript     document.getElementById("noseguroviaje").click();
   Click Javascript      ${ACORDEONPSE}
   Capture Page Screenshot
   Click Javascript      ${ChkPSE}
   Capture Page Screenshot
   Wait Until Page Contains Element    ${APELLIDOSPSE}
   Input Text    ${APELLIDOSPSE}    PEREZ
   Input Text    ${NOMBRESPSE}      JUAN
   Input Text    ${CELULARPSE}      3104562345
   Input Text    ${MAILPSE}         a@a.com
   Input Text    ${IDPSE}           3243434434
   Input Text    ${DIRPSE}          Cra 75K No 45
   Input Text    ${CIUDADPSE}       BOGOTA
   Capture Page Screenshot
   Select From List By Index    ${PAISPSE}         2
   Execute Javascript    document.getElementById("acceptTerms").click();
   Click Element     ${BtnPAGAR}
   Capture Page Screenshot
   Wait Until Page Contains Element     ${FRAMEPSE}
   Capture Page Screenshot
   Click Element    ${PAGARPSE}
   Capture Page Screenshot
   Wait Until Page Contains Element    ${GIFAVION}
   Capture Page Screenshot
   Wait Until Page Does Not Contain Element    ${GIFAVION}    20s
   Capture Page Screenshot

Click Javascript
    [Arguments]      ${ELEMENTO}
    ${CADENAJS}=     Set Variable     document.evaluate("XXX", document.body, null, 9, null).singleNodeValue.click();
    ${ELEMENTO}=    Get Substring   ${ELEMENTO}   6
    ${ELEMENTOCLICK} =	 Replace String	  ${CADENAJS}	   XXX	  ${ELEMENTO}
    Execute Javascript    ${ELEMENTOCLICK}

Pago_safetypay_deb
   Wait Until Page Contains Element    ${ACORDEONPSE}
   #TODO: la linea de abajo va comentariada en produccion, no en qa
   ${present}=   Run Keyword And Return Status    Wait Until Page Contains Element    ${BtnSEGURO}    2s
   Run Keyword If    ('${present}' == 'True')     Execute Javascript     document.getElementById("noseguroviaje").click();
   Click Javascript      ${ACORDEONPSE}
   Execute Javascript     document.evaluate("//label[contains(.,'Ecuador: Débito a través de SafetyPay')]", document.body, null, 9, null).singleNodeValue.click();
   Input Text    ${APELLIDOSSP}    vargas
   Input Text    ${NOMBRESSP}      Sergio
   Input Text    ${CELULARSP}      3134564534
   Input Text    ${MAILSP}         a@a.com
   Input Text    ${IDSP}           1024555345
   Input Text    ${DIRECCIONSP}    cra 45A No 28
   Input Text    ${CIUDADSP}       Bogota
   Select From List By Index    ${PAISSP}     2
   Execute Javascript    document.getElementById("acceptTerms").click();
   Click Element     ${BtnPAGAR}
   Capture Page Screenshot
   Wait Until Page Contains Element     ${FRAMEPSE}
   Capture Page Screenshot
   Click Element    ${PAGARPSE}
   Capture Page Screenshot
   Wait Until Page Contains Element    ${GIFAVION}
   Capture Page Screenshot
   Wait Until Page Does Not Contain Element    ${GIFAVION}    10s
   Capture Page Screenshot
   Select Frame    ${FRAMEPAGO}
   Wait Until Page Contains Element    ${BtnIRPAGAR}
   Click Element    ${BtnIRPAGAR}
   Sleep  2s
   Select Window    title=Log in - Online Bank
   Wait Until Page Contains Element    ${InpUSEROB}
   Input Text    ${InpUSEROB}    ${UsernameOB}
   Input Text    ${InpPASSOB}    ${UsernameOB}
   Click Element     ${BtnPAGOOB}
   Click Element    ${BtnCONFOB}
   Click Element    ${BtnCLOSEOB}
   Wait Until Page Contains Element    ${LblCODRES}
   ${PNR}=   Get Text    ${LblCODRES}
   Capture Page Screenshot

Pago_safetypay_cash
   Wait Until Page Contains Element    ${ChkSPC}
   ${present}=   Run Keyword And Return Status    Wait Until Page Contains Element    ${BtnSEGURO}    2s
   Run Keyword If    ('${present}' == 'True')     Execute Javascript     document.getElementById("noseguroviaje").click();
   Click Javascript     ${ChkSPC}
   #Ecuador: Efectivo a través de SafetyPay            Panamá: Efectivo a través de SafetyPay
   click javascript    xpath=//div[@class='accordeon-tab-content-title'][contains(.,'Panamá: Efectivo a través de SafetyPay')]
   scroll element into view     ${APELLIDOSSPC}
   Input Text    ${APELLIDOSSPC}    vargas
   Input Text    ${NOMBRESSPC}      Sergio
   Input Text    ${CELULARSPC}      3134564534
   Input Text    ${MAILSPC}         a@a.com
   Input Text    ${IDSPC}           1024555345
   Input Text    ${DIRECCIONSPC}    cra 45A No 28
   Input Text    ${CIUDADSPC}       Bogota
   Select From List By Index    ${PAISSPC}     2
   Execute Javascript    document.getElementById("acceptTerms").click();
   Click Element     ${BtnPAGAR}
   Capture Page Screenshot
   Wait Until Page Contains Element     ${FRAMEPSE}
   Capture Page Screenshot
   Click Element    ${PAGARPSE}
   Capture Page Screenshot
   Wait Until Page Contains Element    ${GIFAVION}
   Capture Page Screenshot
   Wait Until Page Does Not Contain Element    ${GIFAVION}    10s
   Capture Page Screenshot
   ${PNR}=   Get Text    ${LblCODRES}
   #Select Frame    ${FRAMEPAGO}
   #Wait Until Page Contains Element    ${BtnIRPAGAR}
   #Click Element    ${BtnIRPAGAR}
   #Capture Page Screenshot

Pago_Cash
   Wait Until Page Contains Element    ${ACORDEONEFECTIVO}
   #TODO: la linea de abajo va comentariada en produccion, no en qa
   ${present}=   Run Keyword And Return Status    Wait Until Page Contains Element    ${BtnSEGURO}    2s
   Run Keyword If    ('${present}' == 'True')     Execute Javascript     document.getElementById("noseguroviaje").click();
   click javascript    ${ACORDEONEFECTIVO}
   Capture Page Screenshot
   #Colombia - Establecimientos      Colombia - Bancos
   Execute Javascript     document.evaluate("//label[contains(.,'Colombia - Establecimientos')]", document.body, null, 9, null).singleNodeValue.click();
   Capture Page Screenshot
   Execute Javascript    document.getElementById("acceptTerms").click();
   Execute javascript    $('.wng-loader').remove()
   Click Element     ${BtnPAGAR}
   Capture Page Screenshot
   Wait Until Page Contains Element     ${FRAMEPSE}
   Capture Page Screenshot
   Click Element    ${PAGARPSE}
   Capture Page Screenshot
   Wait Until Page Contains Element    ${GIFAVION}
   Capture Page Screenshot
   Wait Until Page Does Not Contain Element    ${GIFAVION}    30s
   Capture Page Screenshot
   Wait Until Page Contains    ${TXTCONFEF}
   Capture Page Screenshot
   ${PNR}=   Get Text    ${LblPNRTC}

Pago_tarjeta_credito
    Wait Until Page Contains Element    ${ChkTARJETACREDITO}
    ${present}=   Run Keyword And Return Status    Wait Until Page Contains Element    ${BtnSEGURO}    2s
    Run Keyword If    ('${present}' == 'True')     Execute Javascript     document.getElementById("noseguroviaje").click();
    Execute Javascript     document.evaluate("//label[contains(.,'Tarjeta de crédito')]", document.body, null, 9, null).singleNodeValue.click();
    Input Text    ${LblNUMEROTARJETA}        ${NumeroTarjeta}
    Input Text    ${LblFECHAEXPIRACION}      ${FechaExpiracion}
    Input Text    ${LblCODSEGURIDAD}         ${CodigoExpiracion}
    Input Text    ${LblDIRECCIONTC}          ${Direccion}
    Select From List By Index    ${SELPAISTC}     2
    Input Text    ${LblCIUDADTC}      ${Ciudad}
    Execute Javascript    document.getElementById("acceptTerms").click();
    Click Element     ${BtnPAGAR}
    Wait Until Page Contains Element     ${FRAMEPSE}
    Click Element    ${PAGARPSE}
    Wait Until Page Contains Element    ${GIFAVION}
    Wait Until Page Does Not Contain Element    ${GIFAVION}    30s
    Capture Page Screenshot
    Wait Until Page Contains     ya te vas de viaje
    Scroll Element Into View    ${LblPNRTC}
    Capture Page Screenshot
    ${PNR}=   Get Text    ${LblPNRTC}
