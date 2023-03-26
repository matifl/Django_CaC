from django.urls import path
from Articulos.views import ArticuloListView, ArticuloDetailView, ArticuloCreate, ArticuloUpdate, ArticuloDelete

articulos_patterns = ([
    path('', ArticuloListView.as_view(), name='list'),
    path('<nombre>/', ArticuloDetailView.as_view(), name='detail'),
    path('create', ArticuloCreate.as_view(), name='create'),   
    path('update/<int:pk>/', ArticuloUpdate.as_view(), name='update'),
    path('delete/<int:pk>/', ArticuloDelete.as_view(), name='delete'),
], 'articulos')

