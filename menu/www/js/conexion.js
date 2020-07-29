const express = require('express');
const mysql = require('mysql');

const con = express();

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

var select = db.query("SELECT * FROM item", function (err, results) {
  if (err) throw err;
  for (var i = 0; i < results.length; i++) {
    var nombreItem = results[i].nombre;
    var precioItem = results[i].precio;
    var imagenItem = results[i].imagen;
    var descripcionItem = results[i].descripcion;
    var categoriaItem = results[i].categoria;  
  } 
  console.log(results);
});

export {select};