import 'package:flutter/material.dart';
import 'package:peliculas/src/routes/routes.dart';

void main() => runApp(MyApp());

/*Se define cual es la ruta inicial de la aplicacion mas el resto de rutas
  accediendo al archivo de rutas con el metodo getRoutes()*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      initialRoute: '/',
      routes: getRoutes(),
    );
  }
}
