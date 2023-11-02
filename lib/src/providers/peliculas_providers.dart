import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/pelicula_model.dart';

class PeliculaProvider {
  //Url del webservice a utilizar
  String _url = 'pelicula.devetechnologies.com';
  bool _cargando = false;
  List<Pelicula> _populares = [];

  //Metodo asincrono que hace la llamada al webservice y crea la lista de peliculas
  Future<List<Pelicula>> _procesarPelicula(Uri url, String cabecerajson) async {
    //Llamada al webservice con la url
    final respuesta = await http.get(url);

    //Se obtiene el cuerpo del json
    final decodeData = json.decode(respuesta.body);

    //A traves del metodo de la clase peliculas se crean todos los elementos que esten contenidos en la cabecera (results) del json
    final peliculas = Peliculas.fromjsonList(decodeData[cabecerajson]);
    return peliculas.items;
  }

  //Metodo que retorna la lista de peliculas tras llamar a _procesarPelicula
  Future<List<Pelicula>> getCines() async {
    //Se crea la url completa para esta llamada especifica
    final url = Uri.https(_url, '/public/peliculas');

    //Se retorna la lista de peliculas que se genera con todo lo contenido en 'results'
    return _procesarPelicula(url, 'results');
  }

  Future<List<Pelicula>> getPopulares() async {
    final url = Uri.https(_url, '');
    return _procesarPelicula(url, '');
  }

  Future<List<Pelicula>> getActor() async {
    final url = Uri.https(_url, '');
    return _procesarPelicula(url, '');
  }

  Future<List<Pelicula>> buscarPeliculas() async {
    final url = Uri.https(_url, '');
    return _procesarPelicula(url, '');
  }
}
