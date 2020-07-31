var nombre = document.getElementById('nombreItem');
var precio = document.getElementById('precioItem');
var imagen = document.getElementById('imagenItem');
var descripcion = document.getElementById('descripcion');
var item = document.getElementById('item');

var cambioNombre = nombre.textContent = 'Plato';

item.appendChild(cambioNombre);

var fragment = document.createDocumentFragment();


