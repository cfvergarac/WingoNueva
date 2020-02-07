
*** Variables ***
${BtnHoteles}            xpath=(//button[contains(.,'Ver más')])[1]
${Btnalquiler}           xpath=(//button[contains(.,'Ver más')])[2]
${BtnRequisitos}         xpath=(//button[contains(.,'Ver más')])[4]
${BtnTeOimos}            xpath=(//button[contains(.,'Ver más')])[6]
${BtnInfoVIaje}          xpath=(.//*[normalize-space(text()) and normalize-space(.)='INFORMACIÓN DE DESTINO'])[1]/following::button[1]


#ANCILLARIES

${BtnCheckin}             xpath=//img[@src='../../assets/image/icons/icon06.png']
${BtnFilaRapida}          xpath=//img[@src='../../assets/image/icons/icon02.png']
${BtnPrioridad}           xpath=//img[@src='../../assets/image/icons/icon10.png']
${BtnSeguro}              xpath=//img[@src='../../assets/image/icons/icon13.png']
${BtnPagar}               xpath=//button[contains(.,'Pagar')]


#PAGO TC
${ChkTARJETA}             xpath=//label[contains(.,'Tarjeta de crédito')]
${LblNUMEROTARJETA}       xpath=//input[contains(@name,'TCcardNumber')]
${LblFECHAEXPIRACION}     xpath=//input[contains(@name,'TCexpiration')]
${LblCODSEGURIDAD}        xpath=//input[@name='TCsecurityNumber']
${LblDIRECCIONTC}         xpath=//input[contains(@name,'TCaddress')]
${SELPAISTC}              xpath=//select[contains(@name,'TCcountry')]
${LblCIUDADTC}            xpath=//input[contains(@name,'TCcity')]
${LblPNRTC}               xpath=(.//*[normalize-space(text()) and normalize-space(.)='Código de reserva'])[1]/following::span[1]
${LblNOMBRE}              id=TCownerName
${LblAPELLIDO}            id=TCownerLastName
${LblID}                  id=TCidentification
${LblMAIL}                id=TCemail
${BtnSEGURO}              id=noseguroviaje

#PAGO PSE
${ACORDEONPSE}     xpath=//p[contains(.,'Realiza débito a tu cuenta. Aplica para Colombia y Ecuador')]
${ChkPSE}          xpath=//label[@for='payment_method_3'][contains(.,'Pagos por PSE')]

${APELLIDOSPSE}   xpath=//input[contains(@name,'PSEownerLastName')]
${NOMBRESPSE}     xpath=//input[contains(@name,'PSEownerName')]
${CELULARPSE}     xpath=//input[contains(@name,'PSEphone')]
${MAILPSE}        xpath=//input[contains(@name,'PSEemail')]
${IDPSE}          xpath=//input[contains(@name,'PSEidentification')]
${DIRPSE}         xpath=//input[contains(@name,'PSEaddress')]
${CIUDADPSE}      xpath=//input[contains(@name,'PSEcity')]
${PAISPSE}        xpath=//select[contains(@name,'PSEcountry')]
${FRAMEPSE}       xpath=//h3[contains(.,'Éste es el resumen de tu compra, verifícalo antes de pagar')]
${PAGARPSE}       xpath=//button[@class='btn-continuar'][contains(.,'Pagar')]

#PAGO SPDEB
${ACORDEONSPDEB}     xpath=//p[contains(.,'Realiza débito a tu cuenta. Aplica para Colombia y Ecuador')]
${ChkSP}         xpath=//label[contains(.,'Pagos por Safety Pay Express - Ecuador')]
${APELLIDOSSP}   id=SPEownerLastName
${NOMBRESSP}     id=SPEownerName
${CELULARSP}     id=SPEphone
${MAILSP}        id=SPEemail
${IDSP}          id=SPEidentification
${DIRECCIONSP}    id=SPEaddress
${CIUDADSP}      id=SPEcity
${PAISSP}        id=SPEcountry

${BtnIRPAGAR}        xpath=//span[@class='Button__text']
${InpUSEROB}         xpath=//input[@name='UserName']
${InpPASSOB}         xpath=//input[@name='Password']
${BtnPAGOOB}         xpath=//input[@type='submit']
${BtnCONFOB}         xpath=//input[@name='submitButton']
${BtnCLOSEOB}        xpath=//input[@value='Close Online Bank']
${LblCODRES}         xpath=//span[@class='w-codigo-reserva']
${FRAMEPAGO}         xpath=//div/iframe[1]