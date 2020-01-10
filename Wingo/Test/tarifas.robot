*** Settings ***
Resource          ../RecursosQA.robot


*** Test Cases ***
CP_001
   ${URL}=    concatena url       PROD   BOG   CTG   2019-11-13   2019-11-18   1   0   0   USD   gc
   #${URL}=  set variable      QA,BOG,CTG,2019-11-13,x,1,0,0,COP,ff
   #Append To File 	${CURDIR}/cris.txt      ${URL}     encoding=UTF-8
   Seleccionar_flex      no
   Llena_datos_viajero
   Agregar_ancillarie    no
   continuar_a_sillas
   Selecciona_sillas
   #hacer_pago    cash




