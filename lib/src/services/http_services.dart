import 'package:dio/dio.dart';

import '../models/product.dart';

class HttpServices {
  Dio? _dio;

  final _baseUrl = 'https://sauliyo15fisioterapia.glitch.me'; //end-point

  HttpServices() {
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void getResquest(String endpoint) async {
    Response? response;
    try {
      response = await _dio?.get(endpoint);
      print(response?.data);
    } on DioException {
      print('error');
    }
  }

  void saveForm(String endPoint, Product product) async {
    String fileName = product.imagen!.split('/').last;
    var data = FormData.fromMap({
      "name": product.name,
      "description": product.name,
      "price": product.price,
      "imagen":
          await MultipartFile.fromFile(product.imagen!, filename: fileName),
    });

    try {
      var response = await _dio!.post(endPoint, data: data);
    } on DioException {
      print('Ocurrio un error');
    }
  }
}
