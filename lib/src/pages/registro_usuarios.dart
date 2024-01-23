import 'package:flutter/material.dart';
import 'package:peliculas/src/pages/formulario.dart';
import 'package:peliculas/src/size_config.dart';

class Registro extends StatelessWidget {
  const Registro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Registro'),
        centerTitle: true,
      ),
      body: SizedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionatedScreenHeight(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                ),
                const Formulario()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
