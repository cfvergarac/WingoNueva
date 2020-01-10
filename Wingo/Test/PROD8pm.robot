*** Settings ***
Resource          ../Recursos.robot


*** Test Cases ***
Pago_8pm
    Abrir_Pagina_Principal     PRODNueva    gc
    Ingresar_tipo_vuelo   RT
    Ingresar_lugares      BOG      ADZ
    Ingresa_Pasajeros     1    0    0
    Seleccionar_Fechas    Noviembre    15   Noviembre    17
    Seleccionar_moneda    USD
    Continuar
    Seleccionar_flex      si
    Llena_datos_viajero
    Selecciona_sillas
    #hacer_pago    sp_deb
