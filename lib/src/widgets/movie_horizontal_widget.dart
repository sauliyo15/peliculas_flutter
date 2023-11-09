// ignore_for_file: sized_box_for_whitespace, deprecated_member_use, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

//Clase que crea un widget personalizado con la lista de peliculas populares
class MovieHorizontal extends StatelessWidget {
  //Para la creacion del widget personalizao se hará uso de una lista de peliculas
  final List<Pelicula> peliculas;

  final Function siguentePagina;

  //Constructor de la clase
  MovieHorizontal(
      {super.key, required this.peliculas, required this.siguentePagina});

  //Variable que representa un controlador de paginas
  final _pageController = PageController(initialPage: 1, viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    //Se añade el evento escuchador del controlador de paginas
    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        siguentePagina();
      }
    });

    //Construccion del wiget personalizado con la lista de peliculas llamando al metodo _tarjeta con cada pelicula
    return Container(
      height: _screenSize.height * 0.2,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemBuilder: (context, index) {
          return _tarjeta(context, peliculas[index]);
        },
        itemCount: peliculas.length,
      ),
    );
  }

  Widget _tarjeta(BuildContext context, Pelicula pelicula) {
    pelicula.uniqueId = '${pelicula.id}-poster';

    final tarjeta = Container(
      margin: const EdgeInsets.only(right: 15.0),
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Hero(
                tag: pelicula.uniqueId,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: FadeInImage(
                    image: NetworkImage(pelicula.getPosterImage()),
                    placeholder: const AssetImage('assets/img/no-image.jpg'),
                    fit: BoxFit.cover,
                    height: 160.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(pelicula.titulo,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.caption)
            ],
          ),
        ],
      ),
    );

    return GestureDetector(
      child: tarjeta,
      onTap: () {
        //Cuando se pulsa en una pelicula, iniciamos la navegacion (archivo de rutas) con el objeto pelicula
        Navigator.pushNamed(context, 'detalle', arguments: pelicula);
      },
    );
  }
}
