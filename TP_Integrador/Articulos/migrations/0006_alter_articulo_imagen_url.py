# Generated by Django 4.1.2 on 2023-03-26 03:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Articulos', '0005_alter_articulo_imagen_url'),
    ]

    operations = [
        migrations.AlterField(
            model_name='articulo',
            name='imagen_url',
            field=models.ImageField(blank=True, default='No-Image-Placeholder.svg', null=True, upload_to='articulos'),
        ),
    ]
