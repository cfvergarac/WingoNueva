*** Settings ***
Resource          ../Recursos.robot
Test Template    Flujo_compra


*** Test Cases ***
Pago_uno                PRODNueva     OW     BOG      UIO    COP    1     1    1    Noviembre    1    Noviembre    30
Pago_dos                PRODNueva     RT     BOG      CTG    USD    1     1    0    Noviembre    1    Noviembre    30
Pago_tres               PRODNueva     OW     BOG      CTG    USD    3     1    0    Noviembre    1    Noviembre    30
Pago_cuatro             PRODNueva     RT     CCS      BOG    COP    1     1    1    Noviembre    13   Noviembre    14
Pago_cinco              PRODNueva     RT     CCS      BOG    COP    1     0    0    Noviembre    13   Noviembre    14
Pago_seis               PRODNueva     OW     GYE      BOG    COP    2     0    0    Noviembre    22   Noviembre    14
Pago_siete              PRODNueva     OW     BAQ      ADZ    USD    1     1    0    Noviembre    22   Noviembre    14
Pago_ocho               PRODNueva     RT     BLB      BOG    USD    1     0    0    Noviembre    21   Noviembre    23
Pago_nueve              PRODNueva     RT     BLB      MDE    COP    2     0    0    Noviembre    21   Noviembre    28
Pago_diez               PRODNueva     OW     BOG      CUN    COP    1     0    0    Noviembre    21   Noviembre    28
Pago_once               PRODNueva     OW     BOG      UIO    USD    3     1    1    Noviembre    1    Noviembre    30
Pago_doce               PRODNueva     OW     BOG      CTG    COP    3     1    0    Noviembre    1    Noviembre    30
Pago_trece              PRODNueva     OW     BOG      CTG    COP    3     1    0    Noviembre    1    Noviembre    30
Pago_catorce            PRODNueva     RT     CCS      BOG    USD    1     0    1    Noviembre    13   Noviembre    14
Pago_quince             PRODNueva     RT     CCS      BOG    USD    3     0    0    Noviembre    13   Noviembre    14
Pago_dieciseis          PRODNueva     OW     GYE      BOG    USD    6     0    0    Noviembre    22   Noviembre    14
Pago_diecisiete         PRODNueva     OW     BAQ      ADZ    COP    8     1    1    Noviembre    22   Noviembre    14
Pago_dieciocho          PRODNueva     OW     BLB      BOG    COP    2     0    1    Noviembre    21   Noviembre    23
Pago_diecinueve         PRODNueva     RT     BLB      MDE    USD    6     1    1    Noviembre    21   Noviembre    28
Pago_veinte             PRODNueva     OW     BOG      CUN    USD    2     1    2    Noviembre    21   Noviembre    28


*** Keywords ***
Flujo_compra
    [Arguments]     ${AMBIENTE}    ${TIPOVUELO}    ${ORIGEN}     ${DESTINO}    ${TIPOMONEDA}    ${NADULTOS}    ${NNINOS}    ${NINFANTES}    ${MESSALIDA}    ${DIASALIDA}    ${MESVUELTA}    ${DIAVUELTA}
    Abrir_Pagina_Principal     ${AMBIENTE}    gc
    Ingresar_tipo_vuelo   ${TIPOVUELO}
    Ingresar_lugares      ${ORIGEN}      ${DESTINO}
    Ingresa_Pasajeros     ${NADULTOS}    ${NNINOS}    ${NINFANTES}
    Seleccionar_Fechas    ${MESSALIDA}    ${DIASALIDA}    ${MESVUELTA}    ${DIAVUELTA}
    Seleccionar_moneda    ${TIPOMONEDA}
    Continuar
    Seleccionar_flex      no
    Llena_datos_viajero
    Selecciona_sillas
    wait until page contains    Pagar   10s
    close browser


