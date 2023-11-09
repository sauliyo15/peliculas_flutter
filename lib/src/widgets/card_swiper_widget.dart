// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart'; //Para utilizar este modulo hay que añadirlo en las dependencias de pubspec.yaml
import 'package:peliculas/src/models/pelicula_model.dart';

//Clase que crea un widget personalizado con la lista de peliculas
class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  const CardSwiper({super.key, required this.peliculas});

  //Creacion del widget personalizado
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      child: Swiper(
          layout: SwiperLayout.STACK,
          itemWidth: _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.5,
          itemBuilder: (BuildContext context, int index) {
            peliculas[index].uniqueId = '${peliculas[index].id}-tarjeta';
            return Hero(
                tag: peliculas[index].uniqueId,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: GestureDetector(
                      onTap: () {
                        //Cuando se pulsa en una pelicula, iniciamos la navegacion (archivo de rutas) con el objeto pelicula
                        Navigator.pushNamed(context, 'detalle',
                            arguments: peliculas[index]);
                      },
                      child: FadeInImage(
                        image: NetworkImage(peliculas[index].getPosterImage()),
                        placeholder: const AssetImage(
                            'assets/img/no-image.jpg'), //Para utilizar la carpeta hay que habilitarla en el modulo assets de pubspec.yaml
                        fit: BoxFit.cover,
                      ),
                    )));
          },
          itemCount: peliculas.length,
          viewportFraction: 0.8,
          scale: 0.9),
    );
  }
}
