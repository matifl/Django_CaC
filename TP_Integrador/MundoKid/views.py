from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.

def home(request):   
    return render(request,"MundoKid/home.html")
   
def juegos(request):
    return render(request,"MundoKid/juegos.html")

def contacto(request):
    return render(request,"MundoKid/contacto.html")