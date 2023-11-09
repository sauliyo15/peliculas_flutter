// ignore_for_file: prefer_final_fields, avoid_unnecessary_containers, sized_box_for_whitespace, must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_providers.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:peliculas/src/widgets/movie_horizontal_widget.dart';

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
    //Llamada al metodo del provider para hacer la carga de datos del webservice y este disponible a la hora de crear el footer
    _peliculas.getPopulares();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas Disney'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[_swipeTarjetas(), _footer(context)],
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

  /*Metodo que devuelve un array de Widget personalizados con MovieHorizontal cuyo contenido se obtiene tras llamar al metodo del provider 
  y construir el footer de la pantalla principal*/
  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            child:
                Text('Populares', style: Theme.of(context).textTheme.subtitle1),
          ),
          const SizedBox(
            height: 5.0,
          ),
          StreamBuilder(
            stream: _peliculas.popularesStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return MovieHorizontal(
                    peliculas: snapshot.data,
                    siguentePagina: _peliculas.getPopulares);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
    );
  }
}


/*
Usar FutureBuilder:

Situaciones de carga única: FutureBuilder es especialmente útil cuando estás realizando 
una única solicitud asincrónica y esperas una respuesta. Por ejemplo, cuando obtienes 
una lista de películas de cines que se carga una vez al abrir una pantalla.

Simplicidad: FutureBuilder es más sencillo de usar y requiere menos código en comparación
 con la gestión manual de un controlador de transmisión. Es una buena opción si solo 
 necesitas cargar datos una vez y no necesitas actualizaciones en tiempo real.


Usar un controlador de transmisión con StreamBuilder:

Actualizaciones en tiempo real: Si necesitas manejar datos en tiempo real que cambian 
con el tiempo (por ejemplo, una lista de películas populares que se actualiza periódicamente),
 un controlador de transmisión y StreamBuilder son más adecuados. Puedes recibir 
 actualizaciones continuas a medida que llegan nuevos datos.

Varios eventos: Si trabajas con flujos de eventos que pueden emitir múltiples valores,
 un controlador de transmisión te permite manejar esos eventos de manera más eficiente.
  Puedes agregar valores al controlador de transmisión a medida que llegan.

Flexibilidad: Los controladores de transmisión te brindan mayor flexibilidad en la 
gestión de flujos de datos. Puedes pausar, reanudar, agregar nuevos eventos o cerrar
 el controlador según tus necesidades.

En resumen, si solo necesitas cargar datos una vez o en situaciones simples, 
FutureBuilder es una opción más simple. Si necesitas manejar datos en tiempo real, 
recibir actualizaciones continuas y gestionar flujos de eventos, un controlador de 
transmisión con StreamBuilder es más recomendable. La elección depende de la complejidad
 de tus necesidades y la naturaleza de los datos con los que estás trabajando.*/
