import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_providers.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';

//Encargado de llamar al webservice y rellenar la lista de peliculas
PeliculaProvider _peliculas = PeliculaProvider();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //Pagina principal de la aplicación
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home Películas'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _swipeTarjetas(),
            ],
          ),
        ),
      ),
    );
  }

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
