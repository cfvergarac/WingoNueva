*** Variables ***

${APPIUM_SERVER1}    http://127.0.0.1:4723/wd/hub

&{motoE}             version=8.1.0       nombre=ZY326H4WS8
&{j1mini}            version=6.0.1       nombre=92010e17091d344a

&{CELULARES}         motoe=${motoE}    j1mini=${j1mini}

#DATOS AMBIENTE

&{URL}          QA=https://vuela-uat.wingo.com/      QAIN=https://vuela-uat.wingo.com/en/home
&{LENGUAJE}     QA=ES       QAIN=EN