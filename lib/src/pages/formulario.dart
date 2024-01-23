import 'package:flutter/material.dart';
import 'package:peliculas/src/constants.dart';
import 'package:peliculas/src/form_error.dart';
import 'package:peliculas/src/pages/custom_sufix_icon.dart';
import 'package:peliculas/src/size_config.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  late String nombre,
      apellido,
      fechaNacimiento,
      lugarNacimiento,
      email,
      telefono,
      destino,
      diasViaje;

  final List<String> _errores = [];

  void eliminarError({required String error}) {
    if (_errores.contains(error)) {
      setState(() {
        _errores.remove(error);
      });
    }
  }

  void agregarError({required String error}) {
    if (!_errores.contains(error)) {
      setState(() {
        _errores.add(error);
      });
    }
  }

  SizedBox _botonAceptar() {
    return SizedBox(
      width: 400,
      height: getProportionatedScreenHeight(50),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)))),
        child: Text(
          'Aceptar',
          style: TextStyle(
              fontSize: getProportionatedScreenWidth(20), color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            _buildNombreformField(),
            SizedBox(
              height: getProportionatedScreenHeight(40),
            ),
            _buildApellidoformField(),
            SizedBox(
              height: getProportionatedScreenHeight(40),
            ),
            _buildFechaNacimientoformField(),
            SizedBox(
              height: getProportionatedScreenHeight(40),
            ),
            _buildLugarNacimientoformField(),
            SizedBox(
              height: getProportionatedScreenHeight(40),
            ),
            _buildEmailformField(),
            SizedBox(
              height: getProportionatedScreenHeight(40),
            ),
            _buildTelefonoformField(),
            SizedBox(
              height: getProportionatedScreenHeight(40),
            ),
            _buildDestinoformField(),
            SizedBox(
              height: getProportionatedScreenHeight(40),
            ),
            _buildDiasViajeformField(),
            SizedBox(
              height: getProportionatedScreenHeight(20),
            ),
            FormError(errors: _errores),
            SizedBox(
              height: getProportionatedScreenHeight(20),
            ),
            _botonAceptar(),
            SizedBox(
              height: getProportionatedScreenHeight(40),
            ),
          ],
        ));
  }

  TextFormField _buildNombreformField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => nombre = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          eliminarError(error: kNombreNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          agregarError(error: kNombreNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Nombre: ",
          hintText: kNombreNullError,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg")),
    );
  }

  TextFormField _buildApellidoformField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => apellido = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          eliminarError(error: kApellidoNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          agregarError(error: kApellidoNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Apellido: ",
          hintText: kApellidoNullError,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg")),
    );
  }

  TextFormField _buildFechaNacimientoformField() {
    return TextFormField(
      keyboardType: TextInputType.datetime,
      onSaved: (newValue) => fechaNacimiento = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          eliminarError(error: kFechaNacimientoNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          agregarError(error: kFechaNacimientoNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Fecha de nacimiento: ",
          hintText: kFechaNacimientoNullError,
          suffixIcon: CustomSurffixIcon(
              svgIcon: "assets/icons/weeklycalendar_120754.svg")),
    );
  }

  TextFormField _buildLugarNacimientoformField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => lugarNacimiento = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          eliminarError(error: kLugarNacimientoNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          agregarError(error: kLugarNacimientoNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Lugar de nacimiento: ",
          hintText: kLugarNacimientoNullError,
          suffixIcon:
              CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg")),
    );
  }

  TextFormField _buildEmailformField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          eliminarError(error: kEmailNullError);
        } else {
          if (emailValidatorRegExp.hasMatch(value)) {
            eliminarError(error: kEmailInvalidoError);
          }
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          agregarError(error: kEmailNullError);
          return "";
        } else {
          if (!emailValidatorRegExp.hasMatch(value) &&
              !_errores.contains(kEmailInvalidoError)) {
            agregarError(error: kEmailInvalidoError);
          }
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Email: ",
          hintText: kEmailNullError,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg")),
    );
  }

  TextFormField _buildTelefonoformField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => telefono = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          eliminarError(error: kTelefonoNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          agregarError(error: kTelefonoNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Teléfono: ",
          hintText: kTelefonoNullError,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg")),
    );
  }

  TextFormField _buildDestinoformField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => destino = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          eliminarError(error: kDestinonNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          agregarError(error: kDestinonNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Destino del viaje: ",
          hintText: kDestinonNullError,
          suffixIcon:
              CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg")),
    );
  }

  TextFormField _buildDiasViajeformField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => diasViaje = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          eliminarError(error: kDiasViajeNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          agregarError(error: kDiasViajeNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Días de viaje: ",
          hintText: kDiasViajeNullError,
          suffixIcon:
              CustomSurffixIcon(svgIcon: "assets/icons/Question mark.svg")),
    );
  }
}
