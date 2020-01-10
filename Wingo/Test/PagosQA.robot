*** Settings ***
Resource          ../RecursosQA.robot


*** Test Cases ***
CP_001
    Abrir_Pagina_Principal     PRODIN    ff
    Ingresar_tipo_vuelo        RT
    Seleccionar_moneda         COP
    Ingresa_Pasajeros          14    0    0
    Ingresar_lugares           BOG    BLB
    Seleccionar_Fechas         2020-03-24     2020-03-27
    Continuar
    Seleccionar_flex      no
    Llena_datos_viajero
    Agregar_ancillarie    no
    continuar_a_sillas
    Selecciona_sillas
    hacer_pago    tc

