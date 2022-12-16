from cProfile import label
from django import forms

class ContactForm(forms.Form):
    name = forms.CharField(label='Nombre', max_length=100,required=True)
    surname = forms.CharField(label='Apellido', max_length=100,required=True)
    mail = forms.EmailField(label='Email', max_length=100,required=True)
    comment = forms.CharField(label='Deja tu comentario!',widget=forms.Textarea,required=False)
    