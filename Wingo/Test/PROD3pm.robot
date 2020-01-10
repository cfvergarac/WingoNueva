*** Settings ***
Resource          ../Recursos.robot


*** Test Cases ***
Pago_3pm
    Abrir_Pagina_Principal     PRODNueva    gc
    Ingresar_tipo_vuelo   OW
    Ingresar_lugares      BOG      UIO
    Ingresa_Pasajeros     1    0    0
    Seleccionar_Fechas    Noviembre    1   Noviembre    30
    Seleccionar_moneda    COP
    Continuar
    Seleccionar_flex      si
    Llena_datos_viajero
    Selecciona_sillas
    #hacer_pago    cash

