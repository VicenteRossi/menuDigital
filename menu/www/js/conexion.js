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

db.query("SELECT * FROM item", function (err, results) {
  if (err) throw err;
  for (var i = 0; i < results.length; i++) {
    var nombre = results[i].nombre;
    var precio = results[i].precio;
    var imagen = results[i].imagen;
    var descripcion = results[i].descripcion;
    var categoria = results[i].categoria;
    
    console.log(nombre);    
  }  
});