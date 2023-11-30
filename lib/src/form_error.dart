import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; //Necesario incluir dependencias en pubspec.yaml

import 'package:peliculas/src/size_config.dart';

// Widget reutilizable para mostrar errores en un formulario
class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    // Construye una columna que contiene una lista de mensajes de error
    return Column(
      children: List.generate(
        errors.length,
        (index) => formErrorText(error: errors[index]),
      ),
    );
  }

  // Método para construir un mensaje de error individual
  Row formErrorText({required String error}) {
    return Row(
      children: <Widget>[
        // Icono de error utilizando un archivo SVG
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: getProportionatedScreenWidth(14),
          width: getProportionatedScreenWidth(14),
        ),
        SizedBox(width: getProportionatedScreenWidth(10)), // Espaciado
        Text(error), // Texto del mensaje de error
      ],
    );
  }
}
