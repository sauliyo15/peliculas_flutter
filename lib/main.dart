import 'package:flutter/material.dart';
import 'package:peliculas/src/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /*Se define cual es la ruta inicial de la aplicacion mas el resto de rutas
  accediendo al archivo de rutas con el metodo getRoutes()*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplicación de pelis',
      initialRoute: '/',
      routes: getRoutes(),
    );
  }
}
