import random

class MyFaker:
 
    def __init__(self):
     
        self.nombre = ['Jhon', 'Stewart', 'George', 'Fabian', 'Travis', 'Aquiles', 'Joey', 'Jose', 'Horacio', 'David' , 'Mike', 'Julio Roberto', 'Ray', 'Chad', 'Mike']
        self.apellido = ['Doe', 'Copeland', 'kollias', 'Dolmayan', 'Barker', 'Prester', 'Mangini', 'Jordison', 'Pasillas', 'Hernandez', 'Lombardo', 'Portnoy', 'Valverde Valencia', 'Luzier', 'Smith' ]
        self.numero = [6430054, 3324567]
 
 
    def nombreWingo(self):
        return random.choice(self.nombre)
        
    def apellidoWingo(self):
        return random.choice(self.apellido)
        
    def numeroWingo(self):
        return random.choice(self.numero)
        