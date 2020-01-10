*** Settings ***
Resource         ../RecursosQA.robot
Library     DataDriver    datosIBE.xlsx
...         delimiter=','
...         sheet_name=datosIBE
Test Template    Flujo_compra


*** Test Cases ***
CP_2       ${AMBIENTE}   ${TIPOVUELO}    ${ORIGEN}     ${DESTINO}    ${TIPOMONEDA}    ${NADULTOS}    ${NNINOS}    ${NINFANTES}    ${MESSALIDA}    ${DIASALIDA}    ${MESVUELTA}    ${DIAVUELTA}    ${TPAGO}    ${TIENEFLEX}    ${ANCILLARIE}    ${NAVEGADOR}


*** Keywords ***
Flujo_compra
    [Arguments]     ${AMBIENTE}    ${TIPOVUELO}    ${ORIGEN}     ${DESTINO}    ${TIPOMONEDA}    ${NADULTOS}    ${NNINOS}    ${NINFANTES}    ${MESSALIDA}    ${DIASALIDA}    ${MESVUELTA}    ${DIAVUELTA}    ${TPAGO}    ${TIENEFLEX}    ${ANCILLARIE}    ${NAVEGADOR}
    Abrir_Pagina_Principal     ${AMBIENTE}    ${NAVEGADOR}
    Ingresar_tipo_vuelo   ${TIPOVUELO}
    Ingresar_lugares      ${ORIGEN}      ${DESTINO}
    Seleccionar_moneda    ${TIPOMONEDA}
    Ingresa_Pasajeros     ${NADULTOS}    ${NNINOS}    ${NINFANTES}
    Seleccionar_Fechas    ${MESSALIDA}     ${DIASALIDA}    ${MESVUELTA}     ${DIAVUELTA}
    Continuar
    Seleccionar_flex      ${TIENEFLEX}
    Llena_datos_viajero
    Agregar_ ancillarie    ${ANCILLARIE}
    continuar_a_sillas
    Selecciona_sillas
    #hacer_pago    ${TPAGO}
