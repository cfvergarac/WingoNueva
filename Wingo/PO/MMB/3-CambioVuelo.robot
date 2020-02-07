*** Settings ***


*** Keywords ***
Asigna PO cambio vuelo
    [Arguments]      ${IDIOMA}
    Import Library       ${CURDIR}/CambioVueloPO.py    ${IDIOMA}
    ${BtnIrCambio}=      BtnIrcambio
    set test variable    ${BtnIrCambio}
