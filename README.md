# Django_CaC
Este repositorio es de un curso realizado por la agencia de aprendizaje Codo a Codo 4.0
->pude clonar este repo M. Moyano
->yo tambien. Cecilia Ramos
->Estoy en eso. Hugo
->Ahora si. Diego Sanz Roldán

### Arrancar el proyecto
Se va a crear un venv y/o activar uno y se va instalar las librerias requeridas para correr el proyecto,
una vez que tengamos el ambiente activado vamos a correr:

```bash
pip install -r requeriments.txt
```

### Levantar el proyecto

Tenes que pararte en la carpeta TP_Integrador con el virtualenv que creaste prendido.

En settings.py vas a tener que modificar la configuracion que tiene DATABASES actualmente mockeada para que apunte a tu base de datos
una vez termines de configurar los pasos para que se conecte a tu base de datos podemos correr las migraciones

```python
python manage.py migrate
```


Eso va a correr todas las migraciones que necesitas para poder levantar el proyecto, una vez terminado el comando, corremos

```python
python manage.py runserver
```
