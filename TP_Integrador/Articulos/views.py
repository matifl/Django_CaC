from django.shortcuts import render
from .models import Articulo, Categoria, Subcategoria

# Create your views here.

def juegos(request):
    articulos=Articulo.objects.filter(categoria = 'ju')
    return render(request,"Articulos/juegos.html",{'articulos':articulos})

def plazas_blandas(request):
    articulos=Articulo.objects.filter(categoria = 'pb')
    return render(request,"Articulos/plazas_blandas.html",{'articulos':articulos})

def inflables(request):
    articulos=Articulo.objects.filter(categoria = 'in')
    return render(request,"Articulos/inflables.html",{'articulos':articulos})
