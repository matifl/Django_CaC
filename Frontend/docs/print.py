#!/usr/bin/python

import os, sys, cgi
print "Content-type: image/png\r\n\r\n",


datos = cgi.FieldStorage()
archivo = datos.getvalue('img')

try:
	archivo1 = open('/tmp/%s.png' % archivo ,'r')
except:
	print "Error al abrir el archivo"
	sys.exit(1)

print archivo1.read()
archivo1.close()
