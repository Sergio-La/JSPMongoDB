//Cambiando a la base de datos colegio
use colegio

//Creando el usuario Nomvre
db.createUser({user:'nombre',pwd:'12345',roles:['readWrite','dbAdmin']})

//Insertando en estudiantes y creando la base de datos
db.estudiantes.insert([{codigo: 1010,nombre: 'Laura',apellido: 'Peña'},
					   {codigo: 1020,nombre: 'Manuel',apellido: 'Muños'},
					   {codigo: 1030,nombre: 'Andrea',apellido: 'Jarava'},
					   {codigo: 1040,nombre: 'Camilo',apellido: 'Torres'}]);

//Insertando en material
db.materias.insert([{codigo: '2010',materia: 'Matematicas',estcod: '1010', estnom:'Laura', nota: '3.5'},
					{codigo: '2010',materia: 'Matematicas',estcod: '1020', estnom:'Manuel', nota: '3.7'},
					{codigo: '2020',materia: 'Fisica',estcod: '1030', estnom:'Andrea', nota: '4.0'}]);
