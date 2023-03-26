from django.shortcuts import render
from MundoKid import forms

# Create your views here.

def home(request):   
    return render(request,"MundoKid/home.html")


def contacto(request):
    form = forms.ContactForm()
    if request.method == 'POST':
        if forms.ContactForm.is_valid():
            pass
    else:
        pass
    return render(request,"MundoKid/contacto.html",{'form':form})