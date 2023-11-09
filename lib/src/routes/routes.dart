import 'package:flutter/material.dart';
import 'package:peliculas/src/pages/home_page.dart';
import 'package:peliculas/src/pages/pelicula_detalle.dart';

//Archivo de rutas que con su metodo devolvera un map con todas las rutas (y metodos/pantallas) indicadas en el return
Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'detalle': (BuildContext context) => const PeliculaDetalle()
  };
}
