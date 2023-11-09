// ignore_for_file: prefer_final_fields

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart'
    as http; //Para utilizar este modulo hay que añadirlo en las dependencias de pubspec.yaml
import 'package:peliculas/src/models/pelicula_model.dart';

//Clase que se encarga de llamar al webservice y solicitar los datos necesarios en cada caso
class PeliculaProvider {
  //Url del webservice-servidor a utilizar
  String _url = 'sauliyo15fisioterapia.glitch.me';

  //Variable booleana para controlar la carga de datos (peliculas populres)
  bool _cargando = false;

  //Variable que almacenara la lista de peliculas populares
  List<Pelicula> _populares = [];

  //Declaracion del Controlador de tramision
  final _popularesStreamController =
      StreamController<List<Pelicula>>.broadcast();

  //Metodo que cierra el controlador de trasmision
  void disposeStreams() {
    _popularesStreamController.close();
  }

  //Metodo que permite agregar listas de películas populares al controlador de transmisión.
  Function(List<Pelicula>) get popularesSink =>
      _popularesStreamController.sink.add;

  //Metodo que obtiene un flujo de datos del canal de transmision
  Stream<List<Pelicula>> get popularesStream =>
      _popularesStreamController.stream;

  //Metodo asincrono que hace la llamada al webservice y crea la lista de peliculas
  Future<List<Pelicula>> _procesarPelicula(Uri url, String cabeceraJson) async {
    //Llamada al webservice con la url
    final resp = await http.get(url);

    //Se obtiene el cuerpo del json
    final decodedData = json.decode(resp.body);

    //A traves del metodo de la clase peliculas se crean todos los elementos que esten contenidos en la cabecera (results) del json
    final peliculas = Peliculas.fromJsonList(decodedData[cabeceraJson]);

    //Se retorna la lista de peliculas
    return peliculas.items;
  }

  //Metodo que retorna la lista de peliculas tras llamar a _procesarPelicula
  Future<List<Pelicula>> getCines() async {
    //Se crea la url completa para esta llamada especifica
    final url = Uri.https(_url, '/peliculas.json');

    //Se retorna la lista de peliculas que se genera con todo lo contenido en 'results'
    return _procesarPelicula(url, 'results');
  }

  //Metodo que retorna la lista de peliculas populares tras llamar a _procesarPelicula
  Future<List<Pelicula>> getPopulares() async {
    if (_cargando) {
      return [];
    } else {
      _cargando = true;
    }

    //Se crea la url completa para esta llamada especifica
    final url = Uri.https(_url, '/peliculas.json');

    //Se retorna la lista de peliculas que se genera con todo lo contenido en 'results'
    final respuesta = await _procesarPelicula(url, 'results');

    //se están añadiendo las películas recibidas en la respuesta al final de la lista _populares.
    _populares.addAll(respuesta);

    //Llamada al metodo para agregar la lista de peliculas populares al controlador de transmision
    popularesSink(_populares);

    _cargando = false;
    return respuesta;
  }
}
