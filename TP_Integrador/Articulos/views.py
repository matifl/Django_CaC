from django.shortcuts import render
from .models import Articulo, Categoria, Subcategoria

# Create your views here.

def juegos(request):
    articulos=Articulo.objects.all()
    return render(request,"Articulos/juegos.html",{'articulos':articulos})

def plazas_blandas(request):
    articulos=Articulo.objects.all()
    return render(request,"Articulos/plazas_blandas.html",{'articulos':articulos})

def inflables(request):
    articulos=Articulo.objects.all()
    return render(request,"Articulos/inflables.html",{'articulos':articulos})
