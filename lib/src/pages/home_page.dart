// ignore_for_file: prefer_final_fields, avoid_unnecessary_containers, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_providers.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';

//Clase que lanza la pantalla principal de la aplicacion representanco con un Widget personalizado una lista de peliculas
class HomePage extends StatelessWidget {
  //Encargado de llamar al webservice y rellenar la lista de peliculas
  PeliculaProvider _peliculas = PeliculaProvider();

  //Constructor
  HomePage({super.key});

  //Este atributo por el momento no se usa--------------------------------------
  //final List<Pelicula> pelicula = [];

  //Metodo que construye la pantalla de la aplicacion con sus elementos-widgets
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas Disney'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swipeTarjetas(),
          ],
        ),
      ),
    );
  }

  //Metodo que devuelve un array de Widgets personalizados con CardSwiper cuyo contenido se obtiene tras llamar al metodo del provider
  Widget _swipeTarjetas() {
    return FutureBuilder(
        future: _peliculas.getCines(),
        builder: (BuildContext context, AsyncSnapshot snapshop) {
          if (snapshop.hasData) {
            return CardSwiper(
              peliculas: snapshop.data,
            );
          } else {
            return Container(
                height: 400.0,
                child: const Center(
                  child: CircularProgressIndicator(),
                ));
          }
        });
  }
}
