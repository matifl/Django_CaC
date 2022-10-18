/* ARRAY DE IMAGENES */
ads = new Array(5);
ads[0] = "http://www.carcajadasweb.com.ar/images/banner_personajes.png";
ads[1] = "http://www.carcajadasweb.com.ar/images/banner_kermesse.png";
ads[2] = "http://www.carcajadasweb.com.ar/images/banner_halloween.png";
ads[3] = "http://www.carcajadasweb.com.ar/images/banner_spa.png";
ads[4] = "http://www.carcajadasweb.com.ar/images/banner_egresaditos.png";

//variable para llevar la cuenta de las imagenes
var longuitudArray = ads.length;
var contador = 0

// Cojemos un numero aleatorio
contador = Math.floor((Math.random() * longuitudArray))

// Cambia la imagen cada segundo en este ejemplo
var tiempo = 1// En segundos
var timer = tiempo * 1000;

function banner() {
	contador++;
	contador = contador % longuitudArray
	document.banner.src = ads[contador];
	setTimeout("banner()", timer);
}