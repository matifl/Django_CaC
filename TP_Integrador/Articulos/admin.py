from django.contrib import admin

# Register your models here.

from .models import Articulo
from .models import Categoria
from .models import Subcategoria

admin.site.register(Articulo)
admin.site.register(Categoria)
admin.site.register(Subcategoria)