from django.shortcuts import render
from django.http import HttpResponse
from MundoKid import forms


# Create your views here.

def home(request):   
    return render(request,"MundoKid/home.html")
   

def contacto(request):
    form = forms.ContactForm()
    if request.method == 'post':
        if forms.ContactForm.is_valid():
            pass
    else:
        pass
        
    
    return render(request,"MundoKid/contacto.html",{'form':form})