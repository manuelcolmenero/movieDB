# movieDB
Aplicación módulo Superpoderes iOS

## Descripción
El proyecto es una aplicación en Swift que se nutre del API de themoviedb.org para obtener una aplciación que muestra los datos de las peliculas, series y actores.

## Objetivos
Realizar las siguientes actividades en el proyecto realizado durante las clases
Ejercicio 1
Ocultar el scrollview y mostrar un activity indicator mientras se cargan los contenidos de la pantalla de Featured.

Ejercicio 2
Hacer presenter para person detail

Ejercicio 3
Navegación de cast a detalle de persona

## Extras
Se ha añadido a la barra de busqueda que tambien se muestre el detalle de los actores.

## Instalación
```
$ mkdir movieDB
$ cd movieDB
$ git clone https://github.com/manuelcolmenero/movieDB.git
$ cd movieDB
$ carthage build --platform iOS
```
Una vez actualizado, esto puede demorarse varios minutos, se procede a crear el archivo Keys.xcconfig dentro de la ruta del proyecto `../TMDbCore/Config`. Este fichero debe contener el siguiente formato

```
TMDB_API_KEY = <personalApiKey>
```

Donde personalApiKey es la clave personal para poder acceder al contenido del api de The Movie Database.

Para más informcación de como obtener la clave acceda al siguiente enlace:
[register for an API key](https://developers.themoviedb.org/3/getting-started/introduction)

## Pantallas
Activity Indicator | Listado inicial | Detalle peliculas | Detalle series TV 
------------ | ------------- | ------------- | -------------
<img src = "https://github.com/manuelcolmenero/movieDB/blob/master/screenshots/activityIndicator.png" width="250px"> | <img src = "https://github.com/manuelcolmenero/movieDB/blob/master/screenshots/main.png" width="250px"> | <img src = "https://github.com/manuelcolmenero/movieDB/blob/master/screenshots/movies.png" width="250px"> | <img src = "https://github.com/manuelcolmenero/movieDB/blob/master/screenshots/tvshows.png" width="250px">

Detalle actores peliculas | Detalle actores series TV 
------------- | -------------
<img src = "https://github.com/manuelcolmenero/movieDB/blob/master/screenshots/activityIndicator.png" width="250px"> | <img src = "https://github.com/manuelcolmenero/movieDB/blob/master/screenshots/Pantalla02.png" width="250px"> | <img src = "https://github.com/manuelcolmenero/movieDB/blob/master/screenshots/Pantalla03.png" width="250px"> | <img src = "https://github.com/manuelcolmenero/movieDB/blob/master/screenshots/Pantalla04.png" width="250px">
