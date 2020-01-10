*** Settings ***
Resource          ../RecursosQA.robot


*** Test Cases ***
CP_001
    Abrir_Pagina_Principal     QA    gc
    Ingresar_tipo_vuelo        OW
    Seleccionar_moneda         COP
    Ingresa_Pasajeros          14    0    0
    Ingresar_lugares           BOG    BLB
    Sleep    1s
    Seleccionar_Fechas         2020-03-24     2019-12-28
    Continuar
    Seleccionar_flex      no
    Llena_datos_viajero
    Agregar_ancillarie    no
    continuar_a_sillas
    Selecciona_sillas
    hacer_pago    tc

