#!/usr/bin/python

import os, cgi, smtplib, sys
from email.MIMEMultipart import MIMEMultipart
from email.MIMEBase import MIMEBase
from email.MIMEText import MIMEText
from email import Encoders

print 'Content-Type: text/html\r\n\r\n',


def envio(msg):
	p=os.popen("/opt/haiti/servers/postfix/usr/sbin/sendmail -t -i","w")
	p.write(msg)
	status = p.close()
	if status:
		print "Sendmail exit status", status

##Envio de mail##
def envioMail(toMail, fromMail, asunto, text, attach = ''):
	msg = MIMEMultipart()

	msg['From'] = fromMail 
	msg['To'] = toMail
	msg['Subject'] = asunto 
	msg.attach(MIMEText(text,'html'))

	if attach != '':	
		try:
			part = MIMEBase('application', 'octet-stream')
			part.set_payload(open(attach, 'rb').read())
			Encoders.encode_base64(part)
			part.add_header('Content-Disposition','attachment; filename="%s"' % os.path.basename(attach))
			msg.attach(part)
			
		except:
			envio(msg.as_string())
		envio(msg.as_string())
	else:
		envio(msg.as_string())


diccionario = {}
def parser(cadena):
        global diccionario
        lista = cadena.split("#")
        contador = 1
        while (contador < len(lista)):
                cad = lista[contador]
                claveValor = cad.split("=")
                diccionario[claveValor[0]] = claveValor[1]
                contador = contador + 1
        return diccionario 


def subirTemporal(nombreCampo):
	item = ''
	try:
		item = datos[nombreCampo]
	except:
		pass

	try:
		if item.file:
    			data = item.file.read()
			nombreArchivo = item.filename
			fileHandle = open(nombreArchivo, 'w+')
			fileHandle.write(data)
			fileHandle.close()
			if(os.path.getsize(nombreArchivo) <= 2000000):
				return nombreArchivo
			else:
				os.unlink(nombreArchivo)
				nombreArchivo = ''
				return nombreArchivo
	except:
		return ''


def isTrue(x):
    if x: 
        return 0 
    return 1



adjunto = ''
cuerpoMail = ''
def generarCuerpoDelMail(lineaConf):
	global diccioario
	global cuerpoMail
	parser(lineaConf)
	tipo = diccionario['tipo']
	titulo = diccionario['titulo']
	nombre = diccionario['nombre']
	contenido = datos.getvalue(nombre)
	if isTrue(contenido):
		contenido = 'Sin completar'
	if tipo != 'attach':
		lineaMail = '<tr><td>%s:</td>' % titulo.replace('<','&lt;').replace('>','&gt;')
		lineaMail += '<td>%s</td></tr>\n' % str(contenido.replace('<','&lt;').replace('>','&gt;'))
		cuerpoMail = cuerpoMail + lineaMail
		return True
	else:
		global adjunto
		adjunto = subirTemporal(nombre)
	diccioario = {}


def tw_get_domain():
        linea =  os.environ['SCRIPT_FILENAME']
        lista = linea.split('/')
        if(lista[3] == 'nt'):
                return lista[4] 
        else:
                return lista[3]


def crearEncabezado(cantidad, lineasConf):
	global mailTo, mailFrom, asunto, cuerpoMail
	lineaE = lineasConf[cantidad -1]
	parser(lineaE)
        mailTo = diccionario['mailTo']
        mailFrom = diccionario['mailFrom']
        asunto = diccionario['asunto']
	cuerpoMail = '<table><tr><td colspan=2><b>%s</b></td></tr>' % diccionario['titu']


##Usa el archivo de configuracion para obtener los campos del Formulario y sus nombres##
def obtenerCampos():
        global cuerpoMail
	archivoConfig = tw_get_domain() + '.ini'
        try:
                config = open(archivoConfig,'rt')
        except:
                print "Error al abrir archivo de configuracion: [%s]" % archivoConfig
                sys.exit(1)
        lineas = config.readlines()
        crearEncabezado(len(lineas),lineas)
	contador = 1 
	for linea in lineas:
		if(contador < len(lineas)-1 ):
			generarCuerpoDelMail(linea)
                else:
			if (contador == len(lineas) -1):
				generarCuerpoDelMail(linea)
				cuerpoMail += '</table>'
		contador = contador + 1





######MAIN#######
datos = cgi.FieldStorage()

obtenerCampos()


envioMail(mailTo, mailFrom, asunto, cuerpoMail, adjunto)

if adjunto != '':
	os.unlink(adjunto)

print '<META HTTP-EQUIV="Refresh" CONTENT="0; URL=%s">' % (diccionario['agrade']) 

