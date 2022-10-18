from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.

def home(request):   
    return render(request,"MundoKid/home.html")
   
def juegos(request):
    return render(request,"MundoKid/juegos.html")

def plazas_blandas(request):
    return render(request,"MundoKid/plazas_blandas.html")

def inflables(request):
    return render(request,"MundoKid/inflables.html")

def contacto(request):
    return render(request,"MundoKid/contacto.html")