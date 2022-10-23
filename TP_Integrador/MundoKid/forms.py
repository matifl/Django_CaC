from cProfile import label
from django import forms

class ContactForm(forms.Form):
    name = forms.CharField(label='Nombre', max_length=100)
    surname = forms.CharField(label='Apellido', max_length=100)
    mail = forms.EmailField(label='Email', max_length=100)
    comment = forms.CharField(label='Deja tu comentario!',widget=forms.Textarea)