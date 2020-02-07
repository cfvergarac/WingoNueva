*** Settings ***
Resource    ../../../Common/TodasLasLibrerias.robot
Resource    ../../../PO/WebResponsive/1-PaginaPrincipal.robot
Resource    ../../../Common/VariablesWebResponsive/Variables.robot
Library     AppiumLibrary


*** Keywords ***
abrir pagina
      [Arguments]      ${AMBIENTE}     ${NOMBRECEL}
      ${Options}    Create Dictionary    androidPackage    com.android.chrome
      ${caps}    Create Dictionary    chromeOptions    ${Options}
      Set to Dictionary    ${caps}    platformName    Android
      Set to Dictionary    ${caps}    platformVersion    ${CELULARES.${NOMBRECEL}.version}
      Set To Dictionary    ${caps}    deviceName      ${CELULARES.${NOMBRECEL}.nombre}
      Set To Dictionary    ${caps}    browserName     Chrome
      Set To Dictionary    ${caps}    AUTO_WEBVIEW    true
      Set To Dictionary    ${caps}    chromedriverExecutableDir    ${CURDIR}
      Set To Dictionary    ${caps}    newCommandTimeout    999999

      Set Library Search Order     SeleniumLibrary

      Asigna PO pagina principal     ES

      Create Webdriver    Remote    command_executor=${APPIUM_SERVER1}     desired_capabilities=${caps}
      go to         ${URL.${AMBIENTE}}


Tipo vuelo
    [Arguments]      ${TVUELO}
    Wait Until Page Contains Element     xpath=//div[@class='circle']
    Set Test Variable    ${TVUELO}
    Run Keyword If  ('${TVUELO}' == 'OW')    One_Way

One_Way
    Click Element     ${RbnOW}
    capture page screenshot

Ingresar_ruta
   [Arguments]       ${IDA}    ${VUELTA}
   Click Element      ${LblIda}
   Wait Until Page Contains Element    ${InpIda}
   Click Element     ${InpIda}
   input text        ${InpcIda}      ${IDA}
   Click Element     ${LblDIda}
   Wait Until Page Contains Element    ${InpVuelta}
   Click Element     ${InpVuelta}
   input text        ${InpvVuelta}      ${VUELTA}
   Click Element     ${LblDVuelta}

Ingresar Moneda
   [Arguments]       ${MONEDA}
   Click element     ${InpMoneda}
   ${TipoMoneda} =	 Replace String	  ${TipoMoneda}	   XXX	  ${MONEDA}
   Click element     ${TipoMoneda}

Ingresar pasajeros
   Click element     ${InpPasajeros}

