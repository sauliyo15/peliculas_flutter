//Clase Peliculas, que sirve para crear la lista de peliculas
class Peliculas {
  //La lista de objetos del tipo Pelicula se inicializa vacia
  List<Pelicula> items = [];

  //Constructor
  Peliculas();

  //Metodo que permite operar con los datos que provienen de un archivo json
  Peliculas.fromJsonList(List<dynamic> jsonList) {
    //Si el json esta vacio, no hay nada que hacer
    if (jsonList.isEmpty) return;

    //Recorremos los elementos del archivo json llamando al metodo de la clase pelicula
    for (var item in jsonList) {
      //Tendremos un elemento del json con sus claves-valores con el que llamar al metodo y construir el objeto pelicula
      final pelicula = Pelicula.fromjsonMap(item);

      //Tras ello se añade la pelicula a la lista de peliculas
      items.add(pelicula);
    }
  }
}

//Clase Pelicula con todos los atributos que contendra una pelicula
class Pelicula {
  late String uniqueId;
  late int id;
  late String lenguajeOriginal;
  late String tituloOriginal;
  late String overview;
  late int popularidad;
  late String posterImg;
  late String fecLanzamiento;
  late String titulo;
  late String video;
  late int votosAveraje;
  late int cantidadVotos;
  late dynamic createdAt;
  late dynamic updatedAt;

  //Constructor de la clase
  Pelicula(
      {required this.id,
      required this.lenguajeOriginal,
      required this.tituloOriginal,
      required this.overview,
      required this.popularidad,
      required this.posterImg,
      required this.fecLanzamiento,
      required this.titulo,
      required this.video,
      required this.votosAveraje,
      required this.cantidadVotos,
      required this.createdAt,
      required this.updatedAt});

  //Metodo que mapea un elemento de json y a traves de sus claves asigna el valor contenido a los atributos del objeto pelicula
  Pelicula.fromjsonMap(Map<String, dynamic> json) {
    id = json['id'];
    lenguajeOriginal = json['lenguaje_original'];
    tituloOriginal = json['titulo_original'];
    overview = json['overview'];
    popularidad = json['popularidad'];
    posterImg = json['poster_img'];
    fecLanzamiento = json['fec_lanzamiento'];
    titulo = json['titulo'];
    video = json['video'];
    votosAveraje = json['votos_averaje'];
    cantidadVotos = json['cantidad_votos'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  //Validacion del contenido de la variable que corresponde a la imagen de la pelicula
  getPosterImage() {
    if (posterImg.isEmpty) {
      //Si el contenido de la variable esta vacio retornamos una imagen por defecto
      return 'https://thumbs.dreamstime.com/b/no-image-available-icon-photo-camera-flat-vector-illustration-132483141.jpg';
    } else {
      //Sino se devuelve el contenido de la variable correspondiente a la imagen de la pelicula
      return posterImg.toString();
    }
  }

  //Validacion del contenido de la variable que corresponde a la imagen de la pelicula
  getBackgroundImage() {
    if (posterImg.isEmpty) {
      //Si el contenido de la variable esta vacio retornamos una imagen por defecto
      return 'https://thumbs.dreamstime.com/b/no-image-available-icon-photo-camera-flat-vector-illustration-132483141.jpg';
    } else {
      //Sino se devuelve el contenido de la variable correspondiente a la imagen de la pelicula
      return posterImg.toString();
    }
  }
}
