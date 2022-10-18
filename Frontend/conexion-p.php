<?php

//conexion.php

$server="localhost";
$usuario_db="nombre";
$clave_db="tuclave";
$base="nombrebase";

$id_con=mysql_connect($server,$usuario_db,$clave_db);
mysql_select_db($base,$id_con);
?>