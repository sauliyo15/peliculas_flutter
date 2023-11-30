import 'package:flutter/material.dart';

// Clase utilitaria para manejar el tamaño de la pantalla y proporcionar dimensiones proporcionales
class SizeConfig {
  static MediaQueryData _mediaQueryData = MediaQueryData();
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double defaultSize =
      0; // Se corrigió el nombre de la variable "defatulSize" a "defaultSize"
  static Orientation orientation = _mediaQueryData.orientation;

  // Método de inicialización que debe llamarse al inicio para obtener las dimensiones de la pantalla
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Función para obtener la altura proporcional según el tamaño de la pantalla
double getProportionatedScreenHeight(double inputHeight) {
  // Se devuelve la misma altura sin modificar (puedes ajustar esto según tus necesidades)
  return inputHeight;
}

// Función para obtener el ancho proporcional según el tamaño de la pantalla
double getProportionatedScreenWidth(double inputWidth) {
  // Se devuelve el mismo ancho sin modificar (puedes ajustar esto según tus necesidades)
  return inputWidth;
}
