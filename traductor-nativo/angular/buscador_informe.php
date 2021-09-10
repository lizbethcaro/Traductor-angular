<?php

 header("Content-Type: application/json; charset=UTF-8");

 //$n = $_GET['texto'];
 $conexion = mysqli_connect( "localhost", "root", "", "prueba1");

 $sql = "SELECT * FROM tb_informe ORDER BY id";
 //if( $n != "" && $n != "undefined" ) $sql .= "where texto like '%$n%'";


 $resultado = $conexion->query($sql);

 $filas = $resultado->fetch_all(MYSQLI_ASSOC);
 $filas = json_encode( $filas);
 echo $filas;
  //echo json_encode( $filas );
 ?>