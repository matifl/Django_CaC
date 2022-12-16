from django.shortcuts import render
from .models import Articulo, Categoria, Subcategoria
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
#from MundoKid import views

from django.shortcuts import get_object_or_404
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView
from Articulos.models import Articulo

from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.contrib.admin.views.decorators import staff_member_required
from django.utils.decorators import method_decorator
from django.shortcuts import redirect
from django.urls import reverse, reverse_lazy
from .forms import ArticuloForm


# Create your views here.
# display de Artículos por categoría y subcategoría. Sólo para registrados

@login_required
def juegos(request):
    articulos=Articulo.objects.filter(categoria = 'ju')
    subcategorias=Subcategoria.objects.filter(id_categoria = 'ju')
    return render(request,"Articulos/articulos.html",{'articulos':articulos,'subcategorias' : subcategorias, 'titulo':'Juegos'})

@login_required
def plazas_blandas(request):
    articulos=Articulo.objects.filter(categoria = 'pb')
    subcategorias=Subcategoria.objects.filter(id_categoria = 'pb')
    return render(request,"Articulos/articulos.html",{'articulos':articulos,'subcategorias' : subcategorias, 'titulo':'Plazas Blandas'})

@login_required
def inflables(request):
    articulos=Articulo.objects.filter(categoria = 'in')
    subcategorias=Subcategoria.objects.filter(id_categoria = 'in')
    return render(request,"Articulos/articulos.html",{'articulos':articulos,'subcategorias' : subcategorias, 'titulo':'Inflables'})


# Lista y detalle de artículos sólo para staff
@method_decorator(staff_member_required, name='dispatch')
class ArticuloListView(ListView):
    model = Articulo
    template_name = 'Articulos/articulo_list.html'
    paginate_by = 6

@method_decorator(staff_member_required, name='dispatch')
class ArticuloDetailView(DetailView):
    model = Articulo
    template_name = 'Articulos/articulo_detail.html'

    def get_object(self):
        return get_object_or_404(Articulo, nombre=self.kwargs['nombre'])

# CRUD de artículos sólo para staff

@method_decorator(staff_member_required, name='dispatch')
class ArticuloCreate(CreateView):
    model = Articulo
    form_class = ArticuloForm
    success_url = reverse_lazy('articulos:list')
    
    
@method_decorator(staff_member_required, name='dispatch')
class ArticuloUpdate(UpdateView):
    model = Articulo
    form_class = ArticuloForm
    template_name_suffix = '_update_form'

    def get_success_url(self):
        return reverse_lazy('articulos:update', args=[self.object.id]) + '?ok'
    
@method_decorator(staff_member_required, name='dispatch')
class ArticuloDelete(DeleteView):
    model = Articulo
    success_url = reverse_lazy('articulos:list')   