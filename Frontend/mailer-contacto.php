<?
ob_start();
$c=array('name','email','tel','fecha','lugar','motivo','nameh','edad','message',);
$mail="<div style='background-color:#ffffff; width:100%; padding:10px;'><h2>Consulta</h2><br/>";
$mail.="<strong>Fecha:</strong> ".date("d/m/Y h:i")."<br/>\n";
foreach($c as $campo){
	$mail.="<strong>$campo:</strong> ".$_POST[$campo]."<br/>\n";
}

$hdrs=array('REMOTE_ADDR');
foreach($hdrs as $campo){
	$mail.="$campo: ".$_SERVER[$campo]."\n";
}

$mail.="</div>";

                $headers  = "From:<".$_POST['email'].">\n";
                $headers .= "X-Mailer:PHP/".phpversion()."\n";
                $headers .= "Return-Path:".$_POST['email']."\n";
                $headers .= "Mime-Version: 1.0\n";
                $headers .= "Content-Type: text/html; charset=iso-8859-1";

$correos="".$_POST['destinatario'].",";
$correos.=$_POST['destinatarioc'];

mail($correos,"Mundo Kid - Contacto",$mail,$headers);
header("Location: ".$_POST['redireccionar']);
?>


<?php
				$name=$_POST['name'];
				$email=$_POST['email'];
				$tel=$_POST['tel'];
				$fecha=$_POST['fecha'];
				$lugar=$_POST['lugar'];
				$motivo=$_POST['motivo'];
				$nameh=$_POST['nameh'];
				$edad=$_POST['edad'];
				$message=$_POST['message'];
				$c_alta=date('Y-m-d');
				
                
                include("conexion.php");
                $alta="Insert into consulta values (null,'$tipo','$fecha','$adultos','$menores','$lugar','$localidad','$servicio','$nombre','$email','$telefono','$comentarios','$c_alta')";
				mysql_query($alta);
				mysql_close();
				
				echo "Se ha dado de alta la siguiente consulta";
				
				echo ($con_nombre);
				
			
?>


