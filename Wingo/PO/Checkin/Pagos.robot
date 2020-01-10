
*** Variables ***

#datos tarjeta credito
${NUMTARJETACH}         id=cardNumber
${EXPTARJETACH}         id=expiration
${CODTARJETACH}         id=securityNumber
${NOMTARJETACH}         id=ownerName
${APETARJETACH}         id=ownerLastName
${IDETARJETACH}         id=identification
${MAITARJETACH}         id=email
${DIRTARJETACH}         id=address
${PAITARJETACH}         id=country
${CIUTARJETACH}         id=city

${TERMINOSUNCH}          xpath=//label[contains(.,'He leído y acepto términos y condiciones')]
${BTNPAGOCH}             xpath=(//button[@type='button'])[2]
${BTNPAGOCH2}            xpath=//button[@type='button']
${BTNPAGOCH3}            xpath=(//button[@type='button'])[2]