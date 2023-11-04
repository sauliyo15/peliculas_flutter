import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_providers.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  PeliculaProvider _peliculas = new PeliculaProvider();
  final List<Pelicula> pelicula = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Movies'),
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
                child: Center(
                  child: CircularProgressIndicator(),
                ));
          }
        });
  }
}
