import 'package:flutter/material.dart';

import '../pages/home_page.dart';

//Archivo de rutas que con su metodo devolvera un map con todas las rutas (y metodos/pantallas) indicadas en el return
Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const HomePage(),
  };
}
