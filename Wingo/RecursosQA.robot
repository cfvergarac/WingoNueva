*** Settings ***
Resource    Common/TodasLasLibrerias.robot
Resource    variables.robot
Resource    PO/PaginaPrincipal.robot
Resource    PO/2-PersonalizaVuelo.robot
Resource    PO/3-AsignaSillas.robot
Resource    PO/4-Pagos.robot
Resource    PO/5-EligeVuelo.robot
Library     MyFaker.py

*** Keywords ***

Abrir_Pagina_Principal
    [Arguments]      ${AMBIENTE}    ${NAVEGADOR}
    Open Browser    ${URL.${AMBIENTE}}    ${NAVEGADOR}
    set test variable    ${NAVEGADOR}
    Maximize Browser Window
    Run Keyword If  ('${AMBIENTE}' == 'QAIN')   set test variable   ${IDIOMA}    'EN'
    ...    ELSE IF    ('${AMBIENTE}' == 'QA')   set test variable   ${IDIOMA}    'ES'
    ...    ELSE IF    ('${AMBIENTE}' == 'PROD')   set test variable   ${IDIOMA}    'ES'
    ...    ELSE IF    ('${AMBIENTE}' == 'PRODIN')   set test variable   ${IDIOMA}    'EN'

    Asignar elementos Pagina principal    ${IDIOMA}
    Asignar elementos pagina vuelos       ${IDIOMA}
    Asignar elementos pagina sillas       ${IDIOMA}
    Asignar elementos Pagina pagos        ${IDIOMA}


Ingresar_tipo_vuelo
    [Arguments]      ${TVUELO}
    Set Test Variable    ${TVUELO}
    Run Keyword If  ('${TVUELO}' == 'OW')    One_Way

One_Way
    #Wait Until Page Contains Element    ${ChkTVUELO}
    Click Element    ${ChkTVUELO}
    #capture page screenshot

valida pop up rutas
    ${presentpr}=     Run Keyword And Return Status    Element Should Be Visible    ${PopUpRutas}
    Run Keyword If    ${presentpr}    Click Element      ${BtnPopUpRutas}

Ingresar_lugares
    [Arguments]      ${ORIGEN}    ${DESTINO}
    ${CiuORIGEN} =	 Replace String	  ${CiuORIGEN}	   XXX	  ${ORIGEN}
    ${CiuDESTINO} =	 Replace String	  ${CiuDESTINO}	   XXX	  ${DESTINO}

    set test variable   ${TIPORUTA}    D
    Run Keyword If   $DESTINO in $VINTERNACIONALES     Asignar_tipo_de_ruta        I
    Run Keyword If   $ORIGEN in $VINTERNACIONALES        Asignar_tipo_de_ruta        I

    Click Element    ${SltDESDE}
    Input Text       ${TxtORIGEN}    ${ORIGEN}
    Click Element    ${CiuORIGEN}
    Input Text       ${SltDESTINO}   ${DESTINO}
    Click Element    ${CiuDESTINO}
    valida pop up rutas
    Sleep    1s

Asignar_tipo_de_ruta
    [Arguments]      ${ESRUTA}
    set test variable   ${TIPORUTA}    ${ESRUTA}

RoundTrip
    [Arguments]    ${FECHASALIDA}    ${MESPARTIDA}    ${ANOPARTIDA}

    ${FECHASALIDA} =       Convert Date 	 ${FECHASALIDA}  	datetime
    ${ANOSALIDA}=          Set Variable     ${FECHASALIDA.year}
    ${ANOSALIDA}=          convert to string    ${ANOSALIDA}
    ${MESSALIDA}=          Set Variable     ${FECHASALIDA.month}
    ${MESSALIDA}=          convert to string    ${MESSALIDA}
    ${MESSALIDA}=    	   Get From Dictionary  	${IDIOMAMES}  	${MESSALIDA}

    ${ANOSIGUIENTE}=    Evaluate     $ANOPARTIDA == '2020' and $ANOPARTIDA == $ANOSALIDA
    Run Keyword If    $ANOSIGUIENTE==False    Select From List By Label     ${SlcANOSALIDA}    ${ANOSALIDA}
    #${DICIEMBRERT}=    Evaluate     ($MESSALIDA == 'Diciembre' and $MESSALIDA == $MESPARTIDA)
    ${DICIEMBRERT}=    Evaluate     ($MESSALIDA in ['Diciembre', 'Febrero', 'December', 'February'] and $MESSALIDA == $MESPARTIDA)
    Run Keyword If    $DICIEMBRERT==False    Select From List By Label     ${MESVUELTA}      ${MESSALIDA}

    #Select From List By Label     ${SlcANOSALIDA}    ${ANOSALIDA}
    #Select From List By Label     ${MESVUELTA}      ${MESSALIDA}


    ${DIAREGRESO}=      Set Variable     ${FECHASALIDA.day}
    ${SUMA}=         	Get From Dictionary    ${SUMAFECHA}   	${MESSALIDA}
    ${DIAREGRESO}=      Evaluate    ${DIAREGRESO} + ${SUMA}
    ${DIAREGRESO}=      Convert To String    ${DIAREGRESO}
    ${DteREGRESO} =	    Replace String	  ${DteREGRESO}	   XXX	  ${DIAREGRESO}
    Click Element       ${DteREGRESO}

Seleccionar_Fechas
    [Arguments]      ${FECHAIDA}    ${FECHASALIDA}

    ${FECHAIDA} =       Convert Date 	 ${FECHAIDA}  	datetime
    ${ANOPARTIDA}=      Set Variable     ${FECHAIDA.year}
    ${ANOPARTIDA}=      convert to string    ${ANOPARTIDA}
    ${MESPARTIDA}=      Set Variable     ${FECHAIDA.month}
    ${MESPARTIDA}=      convert to string    ${MESPARTIDA}


    Run Keyword If  (${IDIOMA} == 'EN')   set test variable   ${IDIOMAMES}    ${MESES.MESESEN}
    Run Keyword If  (${IDIOMA} == 'ES')   set test variable   ${IDIOMAMES}    ${MESES.MESESES}

    ${MESPARTIDA}=    	Get From Dictionary 	${IDIOMAMES}  	${MESPARTIDA}
    ${DIAPARTIDA}=      Set Variable     ${FECHAIDA.day}
    ${SUMA}=         	Get From Dictionary    ${SUMAFECHA}   	${MESPARTIDA}
    ${DIAPARTIDA}=      Evaluate    ${DIAPARTIDA} + ${SUMA}
 
    wait until element is visible   ${SltFECHAIDA}
    Click Element                  ${SltFECHAIDA}
    Select From List By Label      ${SlcANOPARTIDA}      ${ANOPARTIDA}
    Select From List By Label      ${MESIDA}     ${MESPARTIDA}
    ${DIAPARTIDA}=      convert to string    ${DIAPARTIDA}
    ${DtePARTIDA} =	    Replace String	   ${DtePARTIDA}	   XXX	  ${DIAPARTIDA}
    Click Element     ${DtePARTIDA}
    Run Keyword If  ('${TVUELO}' == 'RT')    RoundTrip    ${FECHASALIDA}    ${MESPARTIDA}    ${ANOPARTIDA}


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
    #Sleep  1s
	${presentpr}=     Run Keyword And Return Status    Element Should Be Visible    ${PopUpRutas}
    Run Keyword If    ${presentpr}    Click Element      ${BtnPopUpRutas}
    Click Element    ${SlcMONEDA}
    Capture Page Screenshot
    Run Keyword If  ('${MONEDA}'== 'COP')    Click Element    ${MONEDACOP}
    Run Keyword If  ('${MONEDA}'== 'USD')    Click Element    ${MONEDAUSD}
    ${presentpr}=     Run Keyword And Return Status    Element Should Be Visible    ${PopUpRutas}
    Run Keyword If    ${presentpr}    Click Element      ${BtnPopUpRutas}

Continuar
    Click Element    ${BtnCONTINUAR}
    Select Window    title=Wingo
    Run Keyword If  ('${HAYINFANTES}' == 'Si')    Valida_infantes
    Sleep   8s
    Wait Until Page Contains     ${TxtTarifas}
	#wait until element is visible   ${LblPrecio}


Seleccionar_flex
    [Arguments]      ${TIENEFLEX}
    Run Keyword If  ('${TIENEFLEX}'== 'si')    Click Element    ${FLEX}
    #Seleccionar_avion
    Wait Until Page Contains Element    ${BtnCONTINUARPV}
    Click Javascript    ${BtnCONTINUARPV}

Seleccionar_avion
    Click Element    ${CERRARVIENDO}
    Wait Until Element Is Visible    ${CHkVUELO}
    Click Element      ${CHkVUELO}

Valida_infantes
     Wait Until Page Contains    ${TxtInfantes}
     Click Element     ${BtnINFANTES}

Quita elementos firefox
    Execute javascript    $('.wng-loader').remove()
    Execute javascript    $('.styledSelect').remove()

Agregar_ancillarie
    [Arguments]      ${ANCILLARIE}
    Sleep    1s
    ${NUMANCILLARIES}=     Get Element Count      //div[@class='accordeon-tab-content-title']
    #click element     xpath=(//div[@class='accordeon-tab-content-title'])[contains(.,'Otros Servicios')]
    ${Ancillariespresentes}= 	Create List     cero

    : FOR    ${INDEX}    IN RANGE    1     ${NUMANCILLARIES}
    \   ${TEXTO}=      Get Text     xpath=(//div[@class='accordeon-tab-content-title'])[${INDEX}]
    \   ${INDICEANC}=   Evaluate    ${INDEX} - 1
    \   Insert Into List     ${Ancillariespresentes}       ${INDICEANC}    ${TEXTO}

    Log    ${Ancillariespresentes}
    ${INDICEANCILLARIE}=   Get Index From List     ${Ancillariespresentes}    ${ANCI.${ANCILLARIE}}
    ${EXISTEANCILLARIE}=   Count Values In List    ${Ancillariespresentes}    ${ANCI.${ANCILLARIE}}

    Run Keyword If    ${EXISTEANCILLARIE}>0     click javascript    xpath=(//div[@class='accordeon-tab-content-title'])[contains(.,'${ANCI.${ANCILLARIE}}')]
    Run Keyword If    ${EXISTEANCILLARIE}>0     click javascript    xpath=(//div[@ng-reflect-klass='styledSelect'])[${INDICEANCILLARIE}+1]
    Run Keyword If    ${EXISTEANCILLARIE}>0     click javascript    xpath=(//li[@rel='${ANCILLARIE}W${TIPORUTA}'])[1]

continuar_a_sillas
    Wait Until Page Contains Element     ${BtnCONTINUARALI}
    Click Javascript    ${BtnCONTINUARALI}
    ${presentfr}=   Run Keyword And Return Status    Wait Until Element Is Visible    ${NOFILARAPIDA}    2s
    Run Keyword If    ${presentfr}    Click Javascript      ${NOFILARAPIDA}
    #TODO: estos 2 funcionan en QA pero no en produccion
    ${present}=   Run Keyword And Return Status    Wait Until Element Is Visible    ${NOSERVICIOS}    2s
    Run Keyword If    ${present}    Click Javascript      ${NOSERVICIOS}

Llena_datos_viajero
    Wait Until Page Contains    ${TxtPasajeros}
    Run Keyword If  ('${NAVEGADOR}' == 'ff')   Quita elementos firefox
    Ingresa_adultos
    ${TIENENINOS}=   Evaluate    ${NUMNINOS} > 0
    set test variable     ${TIENENINOS}
    Run Keyword If  ('${TIENENINOS}' == 'True')       Ingresa_ninos
    Run Keyword If  ('${TIENEINFANTES}' == 'True')    Ingresa_infantes


Ingresa_adultos
    Sleep  3s
    : FOR    ${INDEX}    IN RANGE    1    ${NUMADULTOS}
    \   ${NOMBREADULTO} =     nombreWingo 
    \   ${APELLIDOADULTO}=    apellidoWingo
    \   ${CELULARADULTO}=     Set Variable       310
    \   ${TOKEN}=             numeroWingo
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
    \    click element    ${LblSEXO} 
    \    click element     xpath=//div[@id='sex-ad-${INDEX}']/ul/li[1]
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
    \    ${NOMBRENINO}=          nombreWingo 
    \    ${APELLIDONINO}=        apellidoWingo
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
    \    ${NOMBREINF}=          nombreWingo 
    \    ${APELLIDOINF}=        apellidoWingo
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
    Wait Until Page Contains     ${TxtSillas}
    Run Keyword If  ('${TVUELO}' == 'RT')    Sillas_RT
    Run Keyword If  ('${TVUELO}' == 'OW')    Sillas_OW

Sillas_RT
    wait until page does not contain    ${GIFAVION}
    Click Javascript    ${BtnVUELOREGRESO}
    Sillas_OW

Sillas_OW
    Run Keyword If  ('${TIENENINOS}' == 'False')    Wait Until Page Contains Element   ${BtnCONTINUAROWQA}
    Run Keyword If  ('${TIENENINOS}' == 'False')    Click Javascript     ${BtnCONTINUAROWQA}
    Run Keyword If  ('${TIENENINOS}' == 'True')     Wait Until Page Contains Element   ${BtnCONTINUAROW}
    Run Keyword If  ('${TIENENINOS}' == 'True')     Click Javascript     ${BtnCONTINUAROW}
	${presentpu}=     Run Keyword And Return Status    Element Should Be Visible    ${BtnCONTINUAROWPOPUP}
	Sleep   1s
    Run Keyword If    ${presentpu}    Click Javascript    ${BtnCONTINUAROWPOPUP} 
    

hacer_pago
   [Arguments]      ${TIPOPAGO}
   Run Keyword If   ('${TIPOPAGO}' == 'cash')              Pago_Cash
   Run Keyword If   ('${TIPOPAGO}' == 'pse')               Pago_PSE
   Run Keyword If   ('${TIPOPAGO}' == 'sp_deb')            Pago_safetypay_deb
   Run Keyword If   ('${TIPOPAGO}' == 'sp_cash')           Pago_safetypay_cash
   Run Keyword If   ('${TIPOPAGO}' == 'tc')                Pago_tarjeta_credito


Pago_PSE
   wait until page does not contain element    ${GIFAVION}
   Wait Until Page Contains Element    ${ACORDEONPSE}
   #TODO: la linea de abajo va comentariada en produccion, no en qa
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
   #TODO: la linea de abajo es para QA
   Wait Until Page Contains    Información del pago      36s
   Select From List By Label    ${SlcBANCOPSE}    BANCO UNION COLOMBIANO
   Capture Page Screenshot
   #Click Element    ${ChckTERMINOSPSE}
   #Execute Javascript    document.getElementById("MediosPago_MediosPago_ctl00_CbxTerminos").click();
   Click Element    ${BtnCONTINUARPSE}
   Wait Until Page Contains     PSE - Pagos Seguros
   Input Text    ${InpMAILPSE}    ${mailSoportePse}
   Wait Until Page Contains Element    ${BtnSEGUIRPSE}
   Sleep  2s
   Execute Javascript    document.getElementById("btnSeguir2").click();
   Wait Until Page Contains    Bienvenido Banco de Pruebas
   Click Element    ${BtnDEBUGPSE}
   ${FECHAHOY}    Get Current Date   result_format=%d/%m/%Y
   Input Text    ${InpFECHAPSE}    ${FECHAHOY}
   Input Text    ${InpAUTORIZACIONPSE}    1
   Click Element    ${BtnCALLPSE}
   Wait Until Page Contains Element    ${LblMensajeOK}
   Click Element    ${BtnRETURNPSE}
   Capture Page Screenshot
   Wait Until Page Contains    Gracias por volar con WINGO
   Capture Page Screenshot
   Scroll Element Into View    ${PNRPSE}
   Capture Page Screenshot
   ${PNR}=   Get Text    ${PNRPSE}

Click Javascript
    [Arguments]      ${ELEMENTO}
    ${CADENAJS}=     Set Variable     document.evaluate("XXX", document.body, null, 9, null).singleNodeValue.click();
    ${ELEMENTO}=    Get Substring   ${ELEMENTO}   6
    ${ELEMENTOCLICK} =	 Replace String	  ${CADENAJS}	   XXX	  ${ELEMENTO}
    Execute Javascript    ${ELEMENTOCLICK}

Pago_safetypay_deb
   Wait Until Page Contains Element    ${ACORDEONSPDEB}
   #TODO: la linea de abajo va comentariada en produccion, no en qa
   Click Javascript      ${ACORDEONSPDEB}
   Execute Javascript     document.evaluate("//div[@class='accordeon-tab-content-title'][contains(.,'Ecuador: Débito a través de SafetyPay')]", document.body, null, 9, null).singleNodeValue.click();
   #scroll element into view    ${APELLIDOSSP}
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
   Click Javascript     ${ChkSPC}
   scroll element into view    ${ChkSPC}
   Click Javascript    xpath=//div[@class='accordeon-tab-content-title'][contains(.,'Ecuador: Efectivo a través de SafetyPay')]
   scroll element into view    ${IDSPC}
   wait until element is visible   ${APELLIDOSSPC}
   Input Text    ${APELLIDOSSPC}    vargas
   Input Text    ${NOMBRESSPC}      Sergio
   Input Text    ${CELULARSPC}      3134564534
   Input Text    ${MAILSPC}         a@a.com
   Input Text    ${IDSPC}           1024555345
   Input Text    ${DIRECCIONSPC}    cra 45A No 28
   Input Text    ${CIUDADSPC}       Bogota
   #Select From List By Index    ${PAISSPC}     2
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
   Capture Page Screenshot

Pago_Cash
   Wait Until Page Contains Element    ${ACORDEONEFECTIVO}
   #TODO: la linea de abajo va comentariada en produccion, no en qa
   click javascript    ${ACORDEONEFECTIVO}
   Click Javascript     ${ChkEF}
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

ver detalles
    wait until page does not contain    ${GIFAVION}
    click element    ${LblDETALLES}
    capture page screenshot
    click element    ${EtiSADICIONALES}
    capture page screenshot
    click element    ${EtiIMPUESTOS}
    scroll element into view     ${EtiIMPUESTOS}
    capture page screenshot

Pago_tarjeta_credito
    ${present}=   Run Keyword And Return Status    Wait Until Page Contains Element    ${BtnSEGURO}    2s
    Run Keyword If    ('${present}' == 'True')     Execute Javascript     document.getElementById("noseguroviaje").click();
	Wait Until Page Contains Element    ${ChkTARJETACREDITO}
	Sleep  2s
    click javascript   ${ChkTARJETACREDITO}
    #ver detalles
    Input Text    ${LblNUMEROTARJETA}        ${NumeroTarjeta}
    Input Text    ${LblFECHAEXPIRACION}      ${FechaExpiracion}
    Input Text    ${LblCODSEGURIDAD}         ${CodigoExpiracion}
    Input Text    ${LblDIRECCIONTC}          ${Direccion}
    Select From List By Index    ${SELPAISTC}     2
    Input Text    ${LblCIUDADTC}      ${Ciudad}
    #scroll element into view    xpath=(//div[@class='col-xs-7'][contains(.,'Tarifas aéreas')])[1]
    capture page screenshot
    Execute Javascript    document.getElementById("acceptTerms").click();
    Click Element     ${BtnPAGAR}
    Wait Until Page Contains Element     ${FRAMEPSE}
    Capture Page Screenshot
    Click Element    ${PAGARPSE}
    Wait Until Page Contains Element    ${GIFAVION}
    Wait Until Page Does Not Contain Element    ${GIFAVION}    30s
    Capture Page Screenshot
    Wait Until Page Contains     tu compra     10s
    Scroll Element Into View     xpath=(//div[@class='col-xs-7'][contains(.,'Tarifas aéreas')])[1]
    Capture Page Screenshot
    ${PNR}=   Get Text    ${LblPNRTC}
    log to console    ${PNR}


#  Keywords bot pasa directamente a tarifas
concatena url
    [arguments]    ${AMBIENTE}    ${UCIUDADIDA}   ${UCIUDADVUELTA}   ${UFECHAIDA}    ${UFECHAVUELTA}     ${UADULTOS}    ${UNINOS}    ${UINFANTES}    ${UMONEDA}    ${UNAVEGADOR}
    Run Keyword If  ('${UFECHAVUELTA}' <> 'x')    asigna url RT    ${AMBIENTE}    ${UCIUDADIDA}   ${UCIUDADVUELTA}   ${UFECHAIDA}    ${UFECHAVUELTA}     ${UADULTOS}    ${UNINOS}    ${UINFANTES}    ${UMONEDA}
    Run Keyword If  ('${UFECHAVUELTA}' == 'x')    asigna url OW    ${AMBIENTE}    ${UCIUDADIDA}   ${UCIUDADVUELTA}   ${UFECHAIDA}    ${UADULTOS}    ${UNINOS}    ${UINFANTES}    ${UMONEDA}
    abre navegador en tarifas    ${URL}    ${UNAVEGADOR}
    Asignar elementos Pagina principal    'ES'
    entra a tarifas    ${UINFANTES}
    crea pasajeros    ${UADULTOS}    ${UNINOS}    ${UINFANTES}

    ${PRECIO}=    Get Text     id=headerTotalForDesktop
    log to console    ${PRECIO}
    ${URLT}=  set variable      ${AMBIENTE},${UCIUDADIDA},${UCIUDADVUELTA},${UFECHAIDA},${UFECHAVUELTA},${UADULTOS},${UNINOS},${UINFANTES},${UMONEDA},${PRECIO}
    log to console    ${URLT}
    Append To File 	 ${CURDIR}/cris.txt      ${URLT}     encoding=UTF-8
    #${TVUELO}=   set test variable

asigna url RT
    [arguments]    ${AMBIENTE}    ${UCIUDADIDA}   ${UCIUDADVUELTA}   ${UFECHAIDA}    ${UFECHAVUELTA}     ${UADULTOS}    ${UNINOS}    ${UINFANTES}    ${UMONEDA}
    ${URL}=    Catenate  SEPARATOR=/   ${URLBOOKING.${AMBIENTE}}   ${UCIUDADIDA}   ${UCIUDADVUELTA}   ${UFECHAIDA}   ${UFECHAVUELTA}   ${UADULTOS}   ${UINFANTES}    ${UNINOS}   0   ${UMONEDA}   0   0
    set test variable   ${URL}
    ${TVUELO}=  set variable  RT
    set test variable   ${TVUELO}

asigna url OW
    [arguments]    ${AMBIENTE}    ${UCIUDADIDA}   ${UCIUDADVUELTA}   ${UFECHAIDA}     ${UADULTOS}    ${UNINOS}    ${UINFANTES}    ${UMONEDA}
    ${URL}=    Catenate  SEPARATOR=/   ${URLBOOKING.${AMBIENTE}}   ${UCIUDADIDA}   ${UCIUDADVUELTA}   ${UFECHAIDA}   ${UADULTOS}   ${UINFANTES}    ${UNINOS}   1   ${UMONEDA}   0   0
    set test variable   ${URL}
    ${TVUELO}=  set variable  OW
    set test variable   ${TVUELO}


abre navegador en tarifas
    [arguments]    ${URL}    ${NAVEGADOR}
    Open Browser    ${URL}    ${NAVEGADOR}
    set test variable    ${NAVEGADOR}
    Maximize Browser Window

entra a tarifas
    [arguments]    ${UINFANTES}
    Run Keyword If  ('${UINFANTES}' <> '0')    Valida_infantes
    Wait Until Page Contains     ${TxtTarifas}

crea pasajeros
    [Arguments]      ${NUMADULTOS}    ${NUMNINOS}    ${NUMINFANTES}
    ${NUMADULTOS}=      Evaluate    ${NUMADULTOS}-1
    ${TIENEINFANTES}=   Evaluate    ${NUMINFANTES} > 0
    Run Keyword If  ('${TIENEINFANTES}' == 'False')    Set Test Variable    ${HAYINFANTES}    No
    Run Keyword If  ('${TIENEINFANTES}' == 'True')     Set Test Variable     ${HAYINFANTES}     Si
    ${NUMADULTOS}=       Evaluate    ${NUMADULTOS}+2
    Set Test Variable    ${NUMADULTOS}
    Set Test Variable    ${NUMNINOS}
    Set Test Variable    ${NUMINFANTES}
    Set Test Variable    ${TIENEINFANTES}