//Clase Actores, que sirve para crear la lista de actores
class Actores {
  //La lista de objetos del tipo Actor se inicializa vacia
  List<Actor> items = [];

  //Constructor
  Actores();

  //Metodo que permite operar con los datos que provienen de un archivo json
  Actores.fromJsonList(List<dynamic> jsonList) {
    //Si el json esta vacio, no hay nada que hacer
    if (jsonList.isEmpty) return;

    //Recorremos los elementos del archivo json llamando al metodo de la clase actor
    for (var item in jsonList) {
      //Tendremos un elemento del json con sus claves-valores con el que llamar al metodo y construir el objeto actor
      final actor = Actor.fromJsonMap(item);

      //Tras ello se añade el actor a la lista de actores
      items.add(actor);
    }
  }
}

//Clase Actor con todos los atributos que contendra un actor
class Actor {
  late int id;
  late String nombre;
  late String nombreOriginal;
  late int popularidad;
  late String actorImg;
  late String actorPapel;
  late int idPelicula;
  late dynamic createdAt;
  late String updatedAt;
  late String lenguajeOriginal;
  late String tituloOriginal;
  late String overview;
  late String posterImg;
  late String fecLanzamiento;
  late String titulo;
  late String video;
  late int votosAveraje;
  late int cantidadVotos;

  //Constructor de la clase
  Actor({
    required this.id,
    required this.nombre,
    required this.nombreOriginal,
    required this.popularidad,
    required this.actorImg,
    required this.actorPapel,
    required this.idPelicula,
    required this.createdAt,
    required this.updatedAt,
    required this.lenguajeOriginal,
    required this.tituloOriginal,
    required this.overview,
    required this.posterImg,
    required this.fecLanzamiento,
    required this.titulo,
    required this.video,
    required this.votosAveraje,
    required this.cantidadVotos,
  });

  //Metodo que mapea un elemento de json y a traves de sus claves asigna el valor contenido a los atributos del objeto actor
  Actor.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    nombreOriginal = json['nombre_original'];
    popularidad = json['popularidad'];
    actorImg = json['actor_img'];
    actorPapel = json['actor_papel'];
    idPelicula = json['id_pelicula'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lenguajeOriginal = json['lenguaje_original'];
    overview = json['overview'];
    posterImg = json['poster_img'];
    fecLanzamiento = json['fec_lanzamiento'];
    titulo = json['titulo'];
    video = json['video'];
    votosAveraje = json['votos_averaje'];
    cantidadVotos = json['cantidad_votos'];
  }

  //Validacion del contenido de la variable que corresponde a la fotografia del actor
  getFoto() {
    if (actorImg.isEmpty) {
      //Si esta vacio se retornara una imagen por defecto
      return 'https://www.brightlands.com/sites/default/files/2019-12/No%20avater.jpg';
    } else {
      //Sino se retorna la imagen del actor contenida en la variable
      return actorImg.toString();
    }
  }
}
