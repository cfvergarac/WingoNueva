*** Settings ***
Resource          ../RecursosQA.robot


*** Test Cases ***
CP_001
  Abrir_Pagina_Principal     QANuevaES
  Ingresar_tipo_vuelo   OW
  Ingresar_lugares      BOG      CTG
  Seleccionar_moneda    COP
  Ingresa_Pasajeros     1    1    0
  Seleccionar_Fechas    Octubre    5    Octubre    8
  Continuar
  Seleccionar_flex      no
  Llena_datos_viajero
  Selecciona_sillas
  hacer_pago    tc

CP_002
  Abrir_Pagina_Principal     QANuevaES
  Ingresar_tipo_vuelo   RT
  Ingresar_lugares      BOG      CTG
  Seleccionar_moneda    USD
  Ingresa_Pasajeros     1    0    0
  Seleccionar_Fechas    Octubre    5    Octubre    8
  Continuar
  Seleccionar_flex      no
  Llena_datos_viajero
  Selecciona_sillas
  hacer_pago    sp_deb

CP_003
  Abrir_Pagina_Principal     QANuevaES
  Ingresar_tipo_vuelo   OW
  Ingresar_lugares      BOG      HAV
  Seleccionar_moneda    USD
  Ingresa_Pasajeros     1    1    1
  Seleccionar_Fechas    Octubre    5    Octubre    8
  Continuar
  Seleccionar_flex      no
  Llena_datos_viajero
  Selecciona_sillas
  hacer_pago    sp_cash

CP_004
  Abrir_Pagina_Principal     QANuevaES
  Ingresar_tipo_vuelo   RT
  Ingresar_lugares      BOG      HAV
  Seleccionar_moneda    COP
  Ingresa_Pasajeros     14    0    0
  Seleccionar_Fechas    Octubre    5    Octubre    8
  Continuar
  Seleccionar_flex      no
  Llena_datos_viajero
  Selecciona_sillas
  hacer_pago    pse

CP_005
  Abrir_Pagina_Principal     QANuevaES
  Ingresar_tipo_vuelo   RT
  Ingresar_lugares      BOG      ADZ
  Seleccionar_moneda    COP
  Ingresa_Pasajeros     1    1    0
  Seleccionar_Fechas    Julio    26    Julio    28
  Continuar
  Seleccionar_flex      no
  Llena_datos_viajero
  Selecciona_sillas
  hacer_pago    cash