
class CambioVueloPO:

    def __init__(self, lenguaje):
         self.lenguaje = lenguaje
         self.botonIrCambioVuelo =  { "ES": "xpath=//button[contains(.,'Cambiar')]", "EN": "xpath=//button[contains(.,'Change')]"}

    def BtnIrcambio(self):
         return self.botonIrCambioVuelo[self.lenguaje]


