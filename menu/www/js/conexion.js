const mysql = require('mysql');

// Create connection
const db = mysql.createConnection({
  host: 'localhost',
  port: 3306,
  user: 'root',
  password: '123456',
  database: 'menuDigital'
});

// Connect
db.connect();

//Variables en tabla
var nombreItem;
var precioItem;
var imagenItem;
var descripcionItem;
var categoriaItem;

//Ver objetos tabal item
db.query("SELECT * FROM item", function (err, results) {
  if (err) throw err;
  for (var i = 0; i < results.length; i++) {
    nombreItem = results[i].nombre;
    precioItem = results[i].precio;
    imagenItem = results[i].imagen;
    descripcionItem = results[i].descripcion;
    categoriaItem = results[i].categoria;  
  } 
  console.log(results);
});

//export {nombreItem};