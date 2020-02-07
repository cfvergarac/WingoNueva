
class paginaPrincipal:

    def __init__(self, lenguaje):
         self.lenguaje = lenguaje
         self.rbtOW =  { "ES": "xpath=//div[@class='circle']", "EN": " xpath=//div[@class='circle']"}
         self.lblIda =  { "ES": "xpath=//div[@class='styledSelect styledSelectOrigen']", "EN": "xpath=//div[@class='styledSelect styledSelectOrigen']"}
         self.inpIda =  { "ES": "id=_wingocomponentsibenew_INSTANCE_ctyl_inputOrigen-modal", "EN": "id=_wingocomponentsibenew_INSTANCE_ctyl_inputOrigen-modal"}
         self.inpcIda =  { "ES": "id=_wingocomponentsibenew_INSTANCE_ctyl_inputOrigen-modal", "EN": "id=_wingocomponentsibenew_INSTANCE_ctyl_inputOrigen-modal"}
         self.lblDida =  { "ES": "id=_wingocomponentsibenew_INSTANCE_ctyl_comboModalOrigen", "EN": "id=_wingocomponentsibenew_INSTANCE_ctyl_comboModalOrigen"}
         self.inpcVuelta =  { "ES": "xpath=//div[@class='info-airport info-airport-destino']", "EN": "xpath=//div[@class='info-airport info-airport-destino']"}
         self.inpVuelta =  { "ES": "id=_wingocomponentsibenew_INSTANCE_ctyl_inputDestino-modal", "EN": "id=_wingocomponentsibenew_INSTANCE_ctyl_inputDestino-modal"}
         self.lblDVuelta =  { "ES": "id=_wingocomponentsibenew_INSTANCE_ctyl_comboModalDestino", "EN": "id=_wingocomponentsibenew_INSTANCE_ctyl_comboModalDestino"}
         #MONEDA
         self.inpMoneda =  { "ES": "xpath=//div[@class='select-drop selector-moneda']", "EN": "xpath=//div[@class='select-drop selector-moneda"}
         self.tipoMoneda =  { "ES": "xpath=//span[@data-moneda='XXX']", "EN": "xpath=//span[@data-moneda='XXX']"}
         #PASAJEROS
         self.inpPasajeros =  { "ES": "id=selectPasj", "EN": "id=selectPasj"}



    def RbtOW(self):
         return self.rbtOW[self.lenguaje]

    def LblIda(self):
        return self.lblIda[self.lenguaje]

    def InpIda(self):
        return self.inpIda[self.lenguaje]

    def InpcIda(self):
        return self.inpcIda[self.lenguaje]

    def LblDida(self):
        return self.lblDida[self.lenguaje]

    def InpVUelta(self):
        return self.inpcVuelta[self.lenguaje]

    def InpVVUelta(self):
        return self.inpVuelta[self.lenguaje]

    def LblDVuelta(self):
        return self.lblDVuelta[self.lenguaje]

#MONEDA

    def InpMoneda(self):
        return self.inpMoneda[self.lenguaje]

    def TipoMoneda(self):
        return self.tipoMoneda[self.lenguaje]

#PASAJEROS
    def InpPasajeros(self):
        return self.inpPasajeros[self.lenguaje]

