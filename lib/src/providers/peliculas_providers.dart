import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculaProvider {
  String _url = 'sauliyo15fisioterapia.glitch.me';
  bool _cargando = false;
  List<Pelicula> _populares = [];

  final _popularesStreamController =
      StreamController<List<Pelicula>>.broadcast();

  void disposeStreams() {
    _popularesStreamController.close();
  }

  Function(List<Pelicula>) get popularesSink =>
      _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream =>
      _popularesStreamController.stream;

  //#2
  Future<List<Pelicula>> _procesarPelicula(Uri url, String cabeceraJson) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final peliculas = Peliculas.fromJsonList(decodedData[cabeceraJson]);
    return peliculas.items;
  }

  //#3
  Future<List<Pelicula>> getCines() async {
    final url = Uri.https(_url, '/peliculas.json');
    return _procesarPelicula(url, 'results');
  }
}
