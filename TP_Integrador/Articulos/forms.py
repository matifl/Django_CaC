from django import forms
from .models import Articulo, Categoria, Subcategoria

class ArticuloForm(forms.ModelForm):
    # categoria= forms.ModelChoiceField(
    #     queryset=Categoria.objects.all()
    # )
    # subcategoria=forms.ModelChoiceField(
    #     queryset=Subcategoria.objects.filter(id_categoria=categoria)
    # )
    class Meta:

        model = Articulo
        fields = ['nombre', 'categoria', 'subcategoria','precio','stock', 'imagen_url']
        widgets = {
            'nombre': forms.TextInput(attrs={'class':'form-control', 'placeholder':'Nombre'}),
            'categoria': forms.Select(attrs={'class':'form-control'}),
            'subcategoria': forms.TextInput(attrs={'class':'form-control', 'placeholder':'Subcategoría'}),           
            # 'subcategoria': forms.Select(attrs={'class':'form-control'}),
            'precio': forms.NumberInput(attrs={'class':'form-control', 'placeholder':'Precio'}),
            'stock': forms.NumberInput(attrs={'class':'form-control','placeholder':'Stock'}),
            'imagen':forms.ImageField(allow_empty_file='static/Articulos/img/no-img.jpg')
        }
        labels = {
            'nombre':'', 'categoria':'', 'subcategoria':'', 'precio':'', 'stock':'', 'imagen':''
        }

