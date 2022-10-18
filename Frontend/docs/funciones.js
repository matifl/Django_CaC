function check(){
	var rest;
	var tipo = $('#app').attr('value');
	var dato = $('#captcha_txt').attr('value');
	var data = "action=check&valor=" + dato + "&original=" + tipo;
	$.ajax({
                async:false,
                type: "POST", 
                dataType: "html", 
                contentType: "application/x-www-form-urlencoded",
                url:"capt.py",
		data:data,
                success:function(rta){
			if(parseInt(rta) == 1){ 
				rest = 1;
	        	}else{ 
                		rest = 0;
       			 }       
		}
	});
	if (rest == 1){
		return true;
	}else{
		alert("El texto verificador es incorrecto");
		return false;
	}
}


function validar(){
        var error = ''
        var args = validar.arguments;
        for (var i=0; i<(args.length-2); i+=3){
		switch (args[i]){
			case 'numero':
				pattern = /[0-9*]$/;
			break;
                        case 'texto':
                                pattern = /^[\w]+$/i;
                        break;
                        case 'mail': 
                                pattern = /(^[0-9a-zA-Z]+(?:[._][0-9a-zA-Z]+)*)@([0-9a-zA-Z]+(?:[._-][0-9a-zA-Z]+)*\.[0-9a-zA-Z]{2,3})$/;
                        break;
                        case 'url':
                                pattern = /^(http:|https:|ftp:)\/\/\w+(\.\w+)*(\-\w+)?\.\w{2,3}(\:\d{2,6})?(\/{1,2}(\:|\-|\w|\.|\?|\/|\=|\&|\%|\@|\\|\,)*)?$/;
                        break;
			case 'none':
			break;

                }
                if(args[i] != 'none' && !pattern.test(document.getElementById(args[i+1]).value)){
                        //error += 'Error en el campo ' + args[i+2] + '\n'; 
			if (args[i] == 'mail'){
			  error += "Campo "+ args[i+2] +": La direccion de correo es invalida, coloque una de la forma nombre@dominio.com.\n";
			}else if(args[i] == 'numero'){
			  error += "Campo "+ args[i+2] +": Este campo solo acepta valores numericos.\n";
			}
                }
        }
        if(error != ''){ 
                alert(error);
		return false;
        }else{
		return true;
	}
}



function mostrar(){
	$.ajax({
		async:true,
		type: "POST",
		dataType: "html",
		contentType: "application/x-www-form-urlencoded",
		url:"capt.py",
		data:"action=generar",
		success:llegadaDatos
	});
	return true;
}

function llegadaDatos(rta){
	$('#app').attr('value',rta.split("\n")[0]);
	$('#captcha').html("<img src='print.py?img=" + rta + "' width='200px' height='40px'>");
	return true;
}


