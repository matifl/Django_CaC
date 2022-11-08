# Generated by Django 4.0.6 on 2022-11-08 16:39

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Articulo',
            fields=[
                ('id', models.BigIntegerField(primary_key=True, serialize=False, verbose_name='Id_Artículo')),
                ('nombre', models.TextField(max_length=40)),
                ('categoria', models.CharField(max_length=2)),
                ('subcategoria', models.TextField(max_length=10)),
                ('stock', models.IntegerField()),
                ('precio', models.FloatField()),
                ('imagen_url', models.ImageField(upload_to='articulos')),
            ],
            options={
                'verbose_name': 'articulo',
                'verbose_name_plural': 'articulos',
            },
        ),
        migrations.CreateModel(
            name='Categoria',
            fields=[
                ('id_categoria', models.CharField(max_length=2, primary_key=True, serialize=False, verbose_name='Id_Categoría')),
                ('desc_categoria', models.TextField(max_length=15, verbose_name='Descripción Categoría')),
            ],
        ),
        migrations.CreateModel(
            name='Subcategoria',
            fields=[
                ('id_subcategoria', models.TextField(max_length=10, primary_key=True, serialize=False, verbose_name='Id Subcategoría')),
                ('id_categoria', models.CharField(max_length=2, verbose_name='Id_Categoría')),
                ('desc_subcategoria', models.TextField(max_length=40, verbose_name='Descripción Subcategoría')),
            ],
        ),
    ]
