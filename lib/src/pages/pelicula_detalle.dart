// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers

//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:peliculas/src/models/actores_model.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_providers.dart';

//Clase que representa la pantalla que muestra los datos de una pelicula seleccionada
class PeliculaDetalle extends StatelessWidget {
  //Constructor
  const PeliculaDetalle({super.key});

  //Construccion de los elementos de la pantalla
  @override
  Widget build(BuildContext context) {
    //se obtiene la película que se va a mostrar en la pantalla a través de la propiedad arguments de la ruta actual.
    final Pelicula pelicula =
        ModalRoute.of(context)!.settings.arguments as Pelicula;
    return Scaffold(
      body: CustomScrollView(
        //Slivers son elementos que se utilizan dentro de un CustomScrollView.
        slivers: <Widget>[
          _crearAppBar(pelicula),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(height: 10.0),
            _posterTitulo(context, pelicula),
            _descripcion(pelicula),
            _crearCasting(pelicula)
          ])),
        ],
      ),
    );
  }

  //Metodo que coloca la imagen de la pelicula en la parte superior de la pantalla
  Widget _crearAppBar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.titulo,
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage(pelicula.getBackgroundImage()),
          placeholder: const AssetImage('assets/img/loading.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  //Metodo que coloca en una fila una miniatura de la imagen de la pelicula y su titulo original
  Widget _posterTitulo(BuildContext context, Pelicula pelicula) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: pelicula.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(pelicula.getPosterImage()),
                height: 100.0,
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                pelicula.titulo,
                style: Theme.of(context).textTheme.headline4,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                pelicula.tituloOriginal,
                style: Theme.of(context).textTheme.headline6,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: <Widget>[
                  const Icon(Icons.star_border),
                  Text(
                    pelicula.votosAveraje.toString(),
                    style: Theme.of(context).textTheme.subtitle2,
                  )
                ],
              )
            ],
          )),
        ],
      ),
    );
  }

  //Metodo que coloca la descripcion de la pelicula debajo del titulo original
  Widget _descripcion(Pelicula pelicula) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }

  //
  Widget _crearCasting(Pelicula pelicula) {
    final peliculaProvider = PeliculaProvider();
    return FutureBuilder(
        future: peliculaProvider.getActores(pelicula.id.toString()),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return _createActoresPageView(snapshot.data);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  //
  Widget _createActoresPageView(List<Actor> actores) {
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
          pageSnapping: false,
          controller: PageController(viewportFraction: 0.3, initialPage: 1),
          itemCount: actores.length,
          itemBuilder: (context, i) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _actorTarjeta(actores[i]),
            );
          }),
    );
  }

  //
  Widget _actorTarjeta(Actor actor) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: const AssetImage('assets/img/no-image.jpg'),
              image: NetworkImage(actor.getFoto()),
              height: 150.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            actor.nombre,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
