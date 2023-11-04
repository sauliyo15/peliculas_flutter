import 'package:flutter/material.dart';
import 'package:peliculas/src/routes/routes.dart';

//Inicio de la aplicacion
void main() => runApp(const MyApp());

/*Se define cual es la ruta inicial de la aplicacion mas el resto de rutas
  accediendo al archivo de rutas con el metodo getRoutes() del archivo de rutas*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
