*** Variables ***

#BOTONES

${BtnPAGAR}        xpath=//button[@data-popup='popup-1']
${BtnSEGURO}       id=noseguroviaje


#${ChkTERMINOSYC}         xpath=//label[@for='acceptTerms']

${ChkTERMINOSYC}         id=acceptTerms
${ChkTERMINOSYC2}        xpath=//label[@for='acceptDisclaimers']




#PAGOS PSE-------------------------

${ACORDEONPSE}    xpath=//p[contains(.,'Realiza débito a tu cuenta. Aplica para Ecuador')]
${ChkPSE}         xpath=//label[@for='payment_method_3'][contains(.,'Pagos por PSE')]
${APELLIDOSPSE}   id=ownerLastName     #xpath=//input[contains(@name,'ownerLastName')]
${NOMBRESPSE}     id=ownerName         #xpath=//input[contains(@name,'ownerName')]
${CELULARPSE}     id=phone  #xpath=//input[contains(@name,'phone')]
${MAILPSE}        id=email   #xpath=//input[contains(@name,'email')]
${IDPSE}          id=identification   #xpath=//input[contains(@name,'identification')]
${DIRPSE}         id=address   #xpath=//input[contains(@name,'address')]
${CIUDADPSE}      id=city   #xpath=//input[contains(@name,'city')]
${PAISPSE}        id=country   #xpath=//select[contains(@name,'country')]


${SlcBANCOPSE}    id=MediosPago_MediosPago_ctl00_DdlBanco
${ChckTERMINOSPSE}     id=MediosPago_MediosPago_ctl00_CbxTerminos
${BtnCONTINUARPSE}    id=MediosPago_MediosPago_ctl00_LblText15
#terminos y condiciones agregador

${InpMAILPSE}       id=PNEMail
${BtnSEGUIRPSE}      id=btnSeguir2
${BtnDEBUGPSE}     id=btnDebug
${LblMensajeOK}    id=lblMessage
${InpFECHAPSE}     id=txtBankProcessDate
${InpAUTORIZACIONPSE}    id=txtAuthorizationID
${BtnCALLPSE}      id=btnCall
${BtnRETURNPSE}    id=btnReturnToPPE
${PNRPSE}          xpath=(.//*[normalize-space(text()) and normalize-space(.)='Código de reserva:'])[1]/following::span[2]

#PAGOS SAFETYPAY DEBITO-------------------------

${ACORDEONSPDEB}     xpath=//p[contains(.,'Realiza débito a tu cuenta. Aplica para Ecuador y Colombia')]
${ChkSP}         xpath=//label[contains(.,'Pagos por Safety Pay Express - Ecuador')]
${APELLIDOSSP}   id=ownerLastName
${NOMBRESSP}     id=ownerName
${CELULARSP}     id=phone
${MAILSP}        id=email
${IDSP}          id=identification
${DIRECCIONSP}    id=address
${CIUDADSP}      id=city
${PAISSP}        id=country

${BtnIRPAGAR}        xpath=//span[@class='Button__text']
${InpUSEROB}         xpath=//input[@name='UserName']
${InpPASSOB}         xpath=//input[@name='Password']
${BtnPAGOOB}         xpath=//input[@type='submit']
${BtnCONFOB}         xpath=//input[@name='submitButton']
${BtnCLOSEOB}        xpath=//input[@value='Close Online Bank']
${LblCODRES}         xpath=//span[@class='w-codigo-reserva']

${FRAMEPAGO}    xpath=//*[@id="safetypay-modal"]/div[1]/div/iframe
#${PNRSP}         class="w-codigo-reserva"


#PAGOS SAFETYPAY CASH
${ChkSPC}         xpath=//p[contains(.,'Pagos en efectivo en Colombia, Ecuador, Panamá')]
${APELLIDOSSPC}   xpath=(//input[@id='ownerLastName'])[3]  #id=ownerLastName
${NOMBRESSPC}     xpath=(//input[@id='ownerName'])[3]  #id=ownerName
${CELULARSPC}     xpath=(//input[@id='phone'])[3]  #id=phone
${MAILSPC}        xpath=(//input[@id='email'])[3]  #id=email
${IDSPC}          xpath=(//input[@id='identification'])[3]  #id=identification
${DIRECCIONSPC}   xpath=(//input[@id='address'])[3]  #id=address
${CIUDADSPC}      xpath=(//input[@id='city'])[3]  #id=city
${PAISSPC}        xpath=(//input[@id='country'])[3]  #id=country


#PAGOS EFECTIVO-------------------------





#//label[@for='cash'][contains(.,'Colombia - Bancos')]


#PAGOS TARJETA CREDITO-------------------------

${ChkTARJETACREDITO}      xpath=//div[@class='accordeon-tab-content-title'][contains(.,'Tarjeta de crédito')]     #xpath=//label[@for='payment_method_2']    
${LblNUMEROTARJETA}       xpath=//input[contains(@name,'TCcardNumber')]
${LblFECHAEXPIRACION}     xpath=//input[contains(@name,'TCexpiration')]
${LblCODSEGURIDAD}        xpath=//input[@name='TCsecurityNumber']
${LblDIRECCIONTC}         xpath=//input[contains(@name,'TCaddress')]
${SELPAISTC}              xpath=//select[contains(@name,'TCcountry')]
${LblCIUDADTC}            xpath=//input[contains(@name,'TCcity')]


#DETALLES
${LblDETALLES}            xpath=//div[@data-panel='modulo-detalle-compra']
${EtiSADICIONALES}        xpath=//div[@class='col-xs-4 desplegables'][contains(.,'Servicios adicionales')]
${EtiIMPUESTOS}           xpath=//div[@data-panel='panel-3']

*** Keywords ***
Asignar elementos Pagina pagos
    [Arguments]      ${LENGUA}
    #CASH

    ${ACORDEONEFECTIVO}=     set variable if      ${LENGUA}=='ES'       xpath=//p[contains(.,'Pagos en efectivo en Colombia, Ecuador, Panamá')]     xpath=//p[contains(.,'Cash payments in Colombia, Ecuador, Panama City')]
    set test variable       ${ACORDEONEFECTIVO}
    ${ChkEF}=     set variable if      ${LENGUA}=='ES'       xpath=//label[contains(.,'Colombia - Bancos')]      xpath=//label[contains(.,'Colombia - Banks')]
    set test variable       ${ChkEF}
    ${TXTCONFEF}=     set variable if      ${LENGUA}=='ES'        tu recibo para pagar        This is your receipt to pay
    set test variable       ${TXTCONFEF}
    ${FRAMEPSE}=     set variable if      ${LENGUA}=='ES'         xpath=//h3[contains(.,'Éste es el resumen de tu compra, verifícalo antes de pagar')]         xpath=//h3[contains(.,'This is the summary of your purchase, check it before paying')]
    set test variable       ${FRAMEPSE}
    ${PAGARPSE}=     set variable if      ${LENGUA}=='ES'        xpath=//button[@class='btn-continuar'][contains(.,'Pagar')]        xpath=//button[@class='btn-continuar'][contains(.,'Pay')]
    set test variable       ${PAGARPSE}
    ${LblPNRTC}=     set variable if      ${LENGUA}=='ES'         xpath=(.//*[normalize-space(text()) and normalize-space(.)='Código de reserva'])[1]/following::span[1]     xpath=(.//*[normalize-space(text()) and normalize-space(.)='Reservation code'])[1]/following::span[1]
    set test variable       ${LblPNRTC}
