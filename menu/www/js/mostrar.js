import {select} from "conexion.js";

var nombre = document.getElementById('nombreItem');
var precio = document.getElementById('precioItem');
var imagen = document.getElementById('imagenItem');
var descripcion = document.getElementById('descripcion');

nombre.textContent = select.nombre;


