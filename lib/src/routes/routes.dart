import 'package:flutter/material.dart';

import 'package:peliculas/src/pages/home_page.dart';
import 'package:peliculas/src/pages/pelicula_detalle.dart';
import 'package:peliculas/src/pages/product_admin.dart';
import 'package:peliculas/src/pages/registro_usuarios.dart';

//Archivo de rutas que con su metodo devolvera un map con todas las rutas (y metodos/pantallas) indicadas en el return
Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'detalle': (BuildContext context) => const PeliculaDetalle(),
    'registro': (BuildContext context) => const Registro(),
    'product_admin': (BuildContext context) => const ProductAdmin()
  };
}
