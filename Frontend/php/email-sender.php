<?php
session_cache_limiter('nocache');
header('Expires: ' . gmdate('r', 0));
header('Content-type: application/json');

$Recipient = 'envios@carcajadasweb.com.ar'; //  'melisapavia@gmail.com' 'carcajadas@copiu.com.ar' 'animacionescarcajadas@yahoo.com.ar''mele.juliana@copiu.com.ar'; 

$subject = $_POST['subject'];

if($Recipient) {

	$Name = $_POST['name'];
	$Email = $_POST['email'];
	$Tel = $_POST['tel'];
	$Fecha = $_POST['fecha'];
	$Lugar = $_POST['lugar'];
	$Motivo = $_POST['motivo'];
	$Nameh = $_POST['nameh'];
	$Edad = $_POST['edad'];
	$Message = $_POST['message'];
	
	$Email_headers = "Mensaje Web Carcajadas" . "\r\n";
	$Email_headers .= 'de:' . $Name . ' <' . $Email . '>' . "\r\n";

	$Email_body = "Mensaje recibido desde carcajadasweb.com.ar";
	$Email_body .= "Nombre: " . $Name . "\n" .
				   "Email: " . $Email . "\n" .
				   "Teléfono: " . $Tel . "\n" .
				   "Fecha del evento: " . $Fecha . "\n" .
				   "Lugar del evento: " . $Lugar . "\n" .
				   "Motivo del evento: " . $Motivo . "\n" .
				   "Nombre del homenajeado: " . $Nameh . "\n" .
				   "Edad del homenajeado: " . $Edad . "\n" .
				   "Mensaje: " . $Message . "\n";

	$email_from = $Email;

	$sent = mail($Recipient, $Email_headers, $Email_body, 'From: <'.$email_from.'>');

	if ($sent){
		$emailResult = array ('sent'=>'yes');
	} else{
		$emailResult = array ('sent'=>'no');
	}

	echo json_encode($emailResult);

} else {

	$emailResult = array ('sent'=>'no');
	echo json_encode($emailResult);

}
?>
