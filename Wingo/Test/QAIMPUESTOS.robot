*** Settings ***
Resource          ../RecursosQA.robot
Test Template    Flujo_compra


*** Test Cases ***
CLO-BLB-OW                QANuevaES     OW     CLO      BLB    USD    1     0    0    Octubre    12    Octubre    17
BOG-SJO-RT                QANuevaES     RT     BOG      SJO    USD    1     0    0    Octubre    22    Octubre    25
BOG-PUJ-RT                QANuevaES     RT     BOG      PUJ    USD    1     0    0    Octubre    24    Octubre    26
BOG-ADZ-RT				  QANuevaES     RT     BOG      ADZ    USD    1     0    0    Octubre    17    Octubre    19
BOG-CCS-OW				  QANuevaES     OW     BOG      CCS    USD    1     0    0    Octubre    17    Octubre    19
BOG-GYE-RT				  QANuevaES     RT     BOG      GYE    USD    1     0    0    Octubre    14    Octubre    18
CTG-ADZ-OW				  QANuevaES     OW     CTG      ADZ    USD    1     0    0    Octubre    16    Octubre    18
CTG-ADZ-RT				  QANuevaES     RT     CTG      ADZ    USD    1     0    0    Octubre    16    Octubre    20
CLO-CTG-OW				  QANuevaES     OW     CLO      CTG    USD    1     0    0    Octubre    21    Octubre    25
CTG-BLB-OW				  QANuevaES     OW     CTG      BLB    USD    1     0    0    Octubre    17    Octubre    19
CTG-BLB-RT				  QANuevaES     RT     CTG      BLB    USD    1     0    0    Octubre    24    Octubre    26
CTG-BOG-OW				  QANuevaES     OW     CTG      BOG    USD    1     0    0    Octubre    17    Octubre    19
CTG-BOG-RT				  QANuevaES     RT     CTG      BOG    USD    1     0    0    Octubre    17    Octubre    19
CTG-CLO-OW				  QANuevaES     OW     CTG      CLO    USD    1     0    0    Octubre    18    Octubre    25
CTG-CLO-RT				  QANuevaES     RT     CTG      CLO    USD    1     0    0    Octubre    18    Octubre    25
CUN-BOG-OW				  QANuevaES     OW     CUN      BOG    USD    1     0    0    Octubre    17    Octubre    20
CUN-BOG-RT				  QANuevaES     RT     CUN      BOG    USD    1     0    0    Octubre    17    Octubre    20
CUR-BOG-OW				  QANuevaES     OW     CUR      BOG    USD    1     0    0    Octubre    17    Octubre    20
CUR-BOG-RT				  QANuevaES     RT     CUR      HAV    USD    1     0    0    Octubre    17    Octubre    20
HAV-BLB-OW				  QANuevaES     OW     HAV      BLB    USD    1     0    0    Octubre    15    Octubre    19  
HAV-BLB-RT				  QANuevaES     RT     HAV      BLB    USD    1     0    0    Octubre    15    Octubre    19
HAV-BOG-OW				  QANuevaES     OW     HAV      BOG    USD    1     0    0    Octubre    17    Octubre    19
HAV-BOG-RT				  QANuevaES     RT     HAV      BOG    USD    1     0    0    Octubre    17    Octubre    19
BOG-VVC-OW				  QANuevaES     OW     BOG      VVC    USD    1     0    0    Octubre    17    Octubre    19
BOG-VVC-RT				  QANuevaES     RT     BOG      VVC    USD    1     0    0    Octubre    17    Octubre    19
MDE-BLB-OW				  QANuevaES     OW     MDE      BLB    USD    1     0    0    Octubre    17    Octubre    20
MDE-BLB-RT				  QANuevaES     RT     MDE      BLB    USD    1     0    0    Octubre    17    Octubre    20
MEX-BOG-OW				  QANuevaES     OW     MEX      BOG    USD    1     0    0    Octubre    17    Octubre    19
MEX-BOG-RT				  QANuevaES     RT     MEX      BOG    USD    1     0    0    Octubre    17    Octubre    19
PUJ-BOG-OW				  QANuevaES     OW     PUJ      BOG    USD    1     0    0    Octubre    17    Octubre    19
PUJ-BOG-RT				  QANuevaES     RT     PUJ      BOG    USD    1     0    0    Octubre    17    Octubre    19
SDQ-BOG-OW				  QANuevaES     OW     SDQ      BOG    USD    1     0    0    Octubre    16    Octubre    18
SDQ-BOG-RT				  QANuevaES     RT     SDQ      BOG    USD    1     0    0    Octubre    16    Octubre    18
SJO-BOG-OW				  QANuevaES     OW     SJO      BOG    USD    1     0    0    Octubre    15    Octubre    18
SJO-BOG-RT				  QANuevaES     RT     SJO      BOG    USD    1     0    0    Octubre    15    Octubre    18

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
    continuar_a_sillas
    Selecciona_sillas
    hacer_pago    tc
    close browser

