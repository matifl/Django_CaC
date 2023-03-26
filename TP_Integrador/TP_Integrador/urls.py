"""TP_Integrador URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from MundoKid import views as MundoKid_views
from Articulos import views as Articulos_views
from django.conf import settings
from Articulos.urls import articulos_patterns
from django.conf.urls.static import static
urlpatterns = [
    path('',MundoKid_views.home,name="home"),
    path('home/',MundoKid_views.home,name="home"),
    path('juegos/',Articulos_views.juegos,name="juegos"),
    path('plazas_blandas/',Articulos_views.plazas_blandas,name="plazas_blandas"),
    path('inflables/',Articulos_views.inflables,name="inflables"),
    path('articulos/', include(articulos_patterns)), 
    path('contacto/',MundoKid_views.contacto,name="contacto"),
    path('admin/', admin.site.urls),
    #path de auth
    path('accounts/', include('django.contrib.auth.urls')),
    path('accounts/', include('registration.urls')),
]

if settings.DEBUG:
    #from django.conf.urls.static import static
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    