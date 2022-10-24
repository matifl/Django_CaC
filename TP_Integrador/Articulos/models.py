from tabnanny import verbose
from django.db import models

# Create your models here.
class Articulo(models.Model):
    id=models.BigIntegerField(primary_key=True,verbose_name="Id_Artículo")
    nombre=models.TextField(max_length=40)
    categoria=models.CharField(max_length=2)
    subcategoria=models.TextField(max_length=10)
    stock=models.IntegerField()
    precio=models.FloatField()
    imagen_url=models.ImageField(verbose_name="Imagen",upload_to="articulos")
    # created=models.DateTimeField(auto_now_add=True, verbose_name="Fecha de creación")
    # updated=models.DateTimeField(auto_now=True, verbose_name="Fecha de modificación")

class Categoria(models.Model):
    id_categoria=models.CharField(primary_key=True,max_length=2,verbose_name="Id_Categoría")
    desc_categoria=models.TextField(max_length=15,verbose_name="Descripción Categoría")

class Subcategoria(models.Model):
    id_subcategoria=models.TextField(primary_key=True,max_length=10,verbose_name="Descripción Subcategoría")
    id_categoria=models.CharField(max_length=2,verbose_name="Id_Categoría")
    desc_subcategoria=models.TextField(max_length=40,verbose_name="Descripción Subcategoría")


    def __str__(self):
        return self.title
    
    class Meta:
        verbose_name ="articulo"
        verbose_name_plural="articulos"
        # ordering= ["id"]
