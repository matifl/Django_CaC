# Generated by Django 4.1.2 on 2023-03-21 03:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Articulos', '0004_alter_articulo_imagen_url'),
    ]

    operations = [
        migrations.AlterField(
            model_name='articulo',
            name='imagen_url',
            field=models.ImageField(blank=True, default='no-img.jpg', null=True, upload_to='articulos'),
        ),
    ]