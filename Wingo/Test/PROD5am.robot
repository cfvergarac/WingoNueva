*** Settings ***
Resource          ../Recursos.robot


*** Test Cases ***
Pago_5am
    Abrir_Pagina_Principal     PRODNueva    gc
    Ingresar_tipo_vuelo   RT
    Ingresar_lugares      BOG      CCS
    Ingresa_Pasajeros     1    0    0
    Seleccionar_Fechas    Noviembre    27   Noviembre    30
    Seleccionar_moneda    COP
    Continuar
    Seleccionar_flex      si
    Llena_datos_viajero
    Selecciona_sillas
    #hacer_pago    cash
