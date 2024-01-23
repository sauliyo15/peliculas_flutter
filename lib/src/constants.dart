import 'package:flutter/material.dart';
import 'package:peliculas/src/size_config.dart';

// Colores utilizados en la aplicación
const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFCDFF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

// Duración de animación predeterminada
const kAnimationDuration = Duration(milliseconds: 200);

// Estilo de texto para los encabezados
final headingStyle = TextStyle(
    fontSize: getProportionatedScreenWidth(28),
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1.5);

// Duración predeterminada para ciertas operaciones
const defaultDuration = Duration(milliseconds: 250);

// Expresión regular para validar direcciones de correo electrónico
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

// Errores de validación de formularios
const String kNombreNullError = "Introduzca su nombre";
const String kApellidoNullError = "Introduzca su apellido";
const String kFechaNacimientoNullError = "Introduzca su fecha de nacimiento";
const String kLugarNacimientoNullError = "Introduzca su lugar de nacimiento";
const String kEmailNullError = "Introduzca su email";
const String kEmailInvalidoError = "Introduzca un email valido";
const String kTelefonoNullError = "Introduzca su teléfono";
const String kDestinonNullError = "Introduzca el destino del viaje";
const String kDiasViajeNullError = "Introduzca los días del viaje";

const String kPassNullError = "Introduzca su contraseña";
const String kShortPassError =
    "La contraseña debe de ser mayor o igual a 8 caracteres";
const String kMatchPassError = "Password no pudo ser macheado";
const String kAddressNullError = "Introduzca su dirección";
