//Cambiando a la base de datos colegio
use colegio

//Creando el usuario Nomvre
db.createUser({user:'nombre',pwd:'12345',roles:['readWrite','dbAdmin']})

//Insertando en estudiantes y creando la base de datos
db.estudiantes.insert([{codigo: 1010,nombre: 'Laura',apellido: 'Peña'},
					   {codigo: 1020,nombre: 'Manuel',apellido: 'Muños'},
					   {codigo: 1030,nombre: 'Andrea',apellido: 'Jarava'},
					   {codigo: 1040,nombre: 'Camilo',apellido: 'Torres'}]);