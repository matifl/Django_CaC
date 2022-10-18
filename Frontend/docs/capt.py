#!/usr/bin/python


from Captcha.Visual.Tests import PseudoGimpy
import sha
import cgi, os, sys
from PIL import Image

print "Content-Type: text/html\r\n\r\n",

def genCaptcha():
	g = PseudoGimpy()
	i = g.render()
	valor = sha.new()
	valor.update(g.solutions[0])
	clave = valor.hexdigest()
	i.save("/tmp/%s.png" % clave)
	print clave

def checkCaptcha(valor1, valor2):
	valor = sha.new()
	if valor1 == '':
		valor1 = 'NO'

	valor.update(valor1)
	lista = valor2.split('\n')
	if (str(valor.hexdigest()) == str(lista[0])):
		print "1"
	else:
		print "0"




##MAIN##
datos = cgi.FieldStorage()

action = datos.getvalue('action')
if action == 'generar':
	genCaptcha()
elif action == 'check':
	checkCaptcha(datos.getvalue('valor'),datos.getvalue('original'))
else:
	print "Accion incorrecta"
