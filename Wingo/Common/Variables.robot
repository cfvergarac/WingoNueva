*** Variables ***

#DATOS AMBIENTE

&{URL}          QA=https://vuela-uat.wingo.com/   QAIN=https://vuela-uat.wingo.com/en/inicio       PROD=https://www.wingo.com/es/inicio    PRODIN=https://www.wingo.com/en   PALIADOSQA=https://aliados-qa.wingo.com/es    #preproduccion:  stage-prod.wingo.com      PROD=https://www.wingo.com/es/inicio    PRODIN=https://www.wingo.com/en
&{URLCHECKIN}   QACHECKIN=https://webcheckin-qa.wingo.com/webcheckin/es     QACHECKINEN=https://webcheckin-qa.wingo.com/webcheckin/en
&{URLMMB}       QAMMB=https://mmb-qa.wingo.com
&{URLBOOKING}    QA=https://booking-uat.wingo.com/es/search     PROD=https://booking.wingo.com/es/search

#CORREO RESERVA
${CORREORESERVA}    pruebas.wingo@gmail.com      #melissa.perez@landsoft.com.co     #pruebas.wingo@gmail.com    #cristianvergara@sqdm.com    #BeDiaz@wingo.com     #katyeslava@gmail.com      #cristianvergara@sqdm.com     #bot@sqdm.com       ginpao126@hotmail.com

#DATOS PERSONA PAGOS AUTOMATIZADOS
${NOMBREAUT}     Pagos
${APELLIDOAUT}   Automatizacion

#FECHAS CALENDARIO
&{SUMAFECHA}     Enero=2    Febrero=5    Marzo=6     Abril=2    Julio=0    Agosto=3    Septiembre=6    Octubre=1    Noviembre=4    Diciembre=6    January=2    February=5    March=6     April=2    July=0    June=3    September=6    October=1    November=4    December=6

&{MESESES}         1=Enero    2=Febrero    3=Marzo    4=Abril    5=Mayo    6=Junio    7=Julio    8=Agosto    9=Septiembre   10=Octubre    11=Noviembre    12=Diciembre
&{MESESEN}         1=January    2=February    3=March    4=April    5=May    6=June   7=July    8=August    9=September   10=October       11=November    12=December
&{MESES}           MESESES=${MESESES}    MESESEN=${MESESEN}


#ANCILLARIES
&{ANCI}     CA=Checkin en aeropuerto      PA=Prioridad de abordaje   no=no

#DATOS TARJETAS
${NumeroTarjeta}     5454545454545454  #5454545454545454    #36700102000000
${FechaExpiracion}    0221
${CodigoExpiracion}    555    #555
${Direccion}        Cra 75K No 56-13
${Ciudad}        Bogota

#DATOS PSE
${mailSoportePse}    soporte4@zonavirtual.com.co

#VUELOS INTERNACIONALES
@{VINTERNACIONALES} =    AUA    CUN    CCS    MEX    CUR    GUA    GYE    HAV    PTY    BLB    PUJ    UIO    SJO    STI    SDQ

#DATOS SP
${UsernameOB}    test

#GIFS

${GIFAVION}        xpath=//div[@class='wng-loader']