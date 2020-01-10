import random

class MyFaker:
 
    def __init__(self):
     
        self.nombre = ['Jhon', 'Stewart', 'George', 'Fabian', 'Travis', 'Aquiles', 'Mohamed', 'Joey', 'Jose', 'Horacio']
        self.apellido = ['Doe', 'Copeland', 'kollias', 'Dolmayan', 'Barker', 'Prester', 'Mangini', 'Jordison', 'Pasillas', 'Hernandez' ]
        self.numero = [6430054, 3324567]
 
 
    def nombrewingo(self):
        return random.choice(self.nombre)
        
    def apellidowingo(self):
        return random.choice(self.apellido)
        
    def numerowingo(self):
        return random.choice(self.numero)
        
        