from tabnanny import verbose
from django.db import models
from django.urls import reverse

categorias_id=[
    ('in','Inflable'),
    ('ju','Juego'),
    ('pb','Plaza Blanda'),
]


# def custom_upload_to(instance, filename):
#     old_instance = Articulo.objects.get(pk=instance.pk)
#     old_instance.imagen_url.delete()
#     return 'Articulos/' + filename

def custom_upload_to(instance, filename):
    old_instance = Articulo.objects.get(pk=instance.pk)
    old_instance.imagen_url.delete()
    return 'articulo/' + filename

# Create your models here.
class Articulo(models.Model):
    id=models.AutoField(primary_key=True,verbose_name="Id_Artículo")
    nombre=models.TextField(max_length=40)
    categoria=models.CharField(
        models.ForeignKey('Categoria',on_delete=models.CASCADE),
        max_length=2, null=False, blank=False,
        choices=categorias_id,
        default='in')
    subcategoria=models.TextField(
        models.ForeignKey('Subcategoria',on_delete=models.CASCADE),
        null=False, blank=False,
        # choices=subcategorias_id,
        max_length=10)
    stock=models.IntegerField()
    precio=models.FloatField()
    imagen_url = models.ImageField(upload_to='articulos', null=True, blank=True, default='No-Image-Placeholder.svg')

    def __str__(self):
        return self.nombre
    
    class Meta:
        verbose_name ="articulo"
        verbose_name_plural="articulos"
        ordering= ['nombre']
    

    
class Categoria(models.Model):
    id_categoria=models.CharField(primary_key=True,max_length=2,verbose_name="Id_Categoría")
    desc_categoria=models.TextField(max_length=15,verbose_name="Descripción Categoría")

    def __str__(self):
        return self.desc_categoria

class Subcategoria(models.Model):
    id_subcategoria=models.TextField(primary_key=True,max_length=10,verbose_name="Id Subcategoría")
    id_categoria=models.CharField(
        models.ForeignKey('Categoria',on_delete=models.CASCADE),
        max_length=2, null=False, blank=False,
        choices=categorias_id,
        default='in')
    desc_subcategoria=models.TextField(max_length=40,verbose_name="Descripción Subcategoría")

    def __str__(self):
        return self.desc_subcategoria

