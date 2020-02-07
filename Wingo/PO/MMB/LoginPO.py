
class LoginPO:

    def __init__(self, lenguaje):
         self.lenguaje = lenguaje
         self.pnr =  { "ES": "id=reservation", "EN": "id=reservation"}
         self.apellido =  { "ES": "id=lastName", "EN": "id=lastName"}
         self.botonEntrar =  { "ES": "xpath=//input[@value='Buscar']", "EN": "xpath=//input[@value='Search']"}
         self.textoLogueo =  { "ES": "Administra tu vuelo", "EN": "Manage your trip"}


    def TxtPnr(self):
         return self.pnr[self.lenguaje]

    def TxtApellido(self):
        return self.apellido[self.lenguaje]

    def BtnEntrar(self):
        return self.botonEntrar[self.lenguaje]

    def Msgconfirmacion(self):
        return self.textoLogueo[self.lenguaje]

