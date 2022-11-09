from django.shortcuts import render
from .models import Articulo, Categoria, Subcategoria

# Create your views here.

# Mi cambio

def juegos(request):
    articulos=Articulo.objects.filter(categoria = 'ju')
    subcategorias=Subcategoria.objects.filter(id_categoria = 'ju')
    return render(request,"Articulos/articulos.html",{'articulos':articulos,'subcategorias' : subcategorias, 'titulo':'Juegos'})

def plazas_blandas(request):
    articulos=Articulo.objects.filter(categoria = 'pb')
    subcategorias=Subcategoria.objects.filter(id_categoria = 'pb')
    return render(request,"Articulos/articulos.html",{'articulos':articulos,'subcategorias' : subcategorias, 'titulo':'Plazas Blandas'})


def inflables(request):
    articulos=Articulo.objects.filter(categoria = 'in')
    subcategorias=Subcategoria.objects.filter(id_categoria = 'in')
    return render(request,"Articulos/articulos.html",{'articulos':articulos,'subcategorias' : subcategorias, 'titulo':'Inflables'})
