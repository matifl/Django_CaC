<?
  $adjunto = '';
  $cuerpoMail = '';
  $diccionario = Array();

  function subirTemporal($nombreCampo){
    if((@isset($_POST[$nombre])) && (!@empty($_POST[$nombre]))){
      $nombreArchivo = $_FILES[$nombreCampo]["name"];
      $tamanioArchivo = $_FILES[$nombreCampo]["size"];
      $item = $_FILES[$nombreCampo]["name"];

      if($tamanioArchivo <= 2000000){
        move_uploaded_file($_FILES[$nombreCampo]["tmp_name"], $_FILES[$nombreCampo]["name"]);
        
        return $nombreArchivo;
      }
    }

    return '';
  }


  function generarCuerpoDelMail($lineaConf){
    global $diccionario, $cuerpoMail, $adjunto;

    parser($lineaConf);

    $tipo = $diccionario['tipo'];
    $titulo = $diccionario['titulo'];
    $nombre = $diccionario['nombre'];
   
    if((!@isset($_POST[$nombre])) || (@empty($_POST[$nombre]))){
      $contenido = "Sin completar";
    }else{
      $contenido = $_POST[$nombre];
    }

    if($tipo != 'attach'){
      $lineaMail  = sprintf('<tr><td>%s:</td>', str_replace('>','&gt;', str_replace('<','&lt;', $titulo)));
      $lineaMail .= sprintf('<td>%s</td></tr>', str_replace('>','&gt;', str_replace('<','&lt;', $contenido)));
      $cuerpoMail = $cuerpoMail . $lineaMail;

      return TRUE;
    }else{
      $adjunto = subirTemporal($nombre);
    }

    $diccionario = Array();
  }



  function parser($cadena){
    global $diccionario;

    $lista = explode("#", $cadena);

    $contador = 0;

    while($contador < count($lista)){
      $cad = $lista[$contador];

      $claveValor = explode("=", $cad);

      $diccionario[$claveValor[0]] = $claveValor[1];

      $contador++;
    }

    return $diccionario;
  }


  function crearEncabezado($cantidad, $lineasConf){
    global $mailTo, $mailFrom, $asunto, $cuerpoMail, $diccionario;

    $lineaE = $lineasConf[$cantidad -1];

    parser($lineaE);

    $mailTo = $diccionario['mailTo'];
    $mailFrom = $diccionario['mailFrom'];
    $asunto  = $diccionario['asunto'];

    $cuerpoMail = '<table><tr><td colspan=2><b>' . $diccionario['titu'] . '</b></td></tr>';
  }


  function tw_get_domain(){
    return str_replace('www.', '', $_SERVER['HTTP_HOST']);
  }




  function obtenerCampos(){
    global $cuerpoMail;

    $archivoConfig = tw_get_domain() . '.ini';

    $config = @file_get_contents($archivoConfig);

    if($config === FALSE){
      echo "Error al abrir archivo de configuracion: [" . $archivoConfig . "]";
      exit;
    }

    $lineas = explode("\n", $config);

    crearEncabezado(count($lineas), $lineas);


    for($contador = 1 ; $contador < count($lineas) ; $contador++){
      generarCuerpoDelMail($lineas[$contador]);

      if($contador == count($lineas) - 1){
        $cuerpoMail .= '</table>';
      }
    }
  }

  function envioMail($toMail, $fromMail, $asunto, $text, $attach=''){
    $headers = "";

    $headers .= "From: " . $fromMail; 
    $random_hash = md5(date('r', time())); 

    if($attach != ''){
      $headers .= "\r\nContent-Type: multipart/mixed; boundary=\"PHP-mixed-" . $random_hash . "\""; 

      $attachment = chunk_split(base64_encode(file_get_contents($attach)));

      $message = "--PHP-mixed-" . $random_hash . "
Content-Type: multipart/alternative; boundary=\"PHP-alt-" . $random_hash . "\" 

--PHP-alt-" . $random_hash . "
Content-Type: text/html; charset=\"iso-8859-1\" 
Content-Transfer-Encoding: 7bit

" . $text . "

--PHP-alt-" . $random_hash . "--


--PHP-mixed-" . $random_hash . "
Content-Type: application/zip; name=\"" .$attach ."\"  
Content-Transfer-Encoding: base64  
Content-Disposition: attachment  

" . $attachment . "
--PHP-mixed-" . $random_hash . "-- 
";

    }else{
      $headers .= "\r\nContent-Type: multipart/mixed; boundary=\"PHP-mixed-" . $random_hash . "\""; 

      $message = "--PHP-mixed-" . $random_hash . "
Content-Type: text/html; charset=\"iso-8859-1\" 
Content-Transfer-Encoding: 7bit

" . $text . "

--PHP-mixed-" . $random_hash . "--
";

    }

    mail($toMail, $asunto, $message, $headers);
  }

  obtenerCampos();

  envioMail($mailTo, $mailFrom, $asunto, $cuerpoMail, $adjunto);

  if($adjunto != ''){
    unlink($adjunto);
  }

  echo sprintf('<META HTTP-EQUIV="Refresh" CONTENT="0; URL=%s">', $diccionario['agrade'])
?>