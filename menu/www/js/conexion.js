var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '123456',
  database : 'menuDigital'
});

connection.connect();

var nombreItem = document.getElementById('nombreItem');
var precioItem = document.getElementById('precioItem');
var imagen = document.getElementById('plato');
var descripcion = document.getElementById('descripcion');

 var select = connection.query('SELECT * FROM `item`', function (error, results, fields) {
  if (error) throw error;
  console.log(results);
});

var pedido = connection.query('INSERT INTO `pedido`(notas`, `mesa_idMesa`, `fecha`, `hora`) VALUES ([value-1],[value-2],[value-3],[value-4],[value-5])', function (error, results, fields) {
  if (error) throw error;
  console.log(results);
});

connection.end();