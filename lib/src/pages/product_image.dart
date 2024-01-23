import 'dart:io';

import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? urlPath;
  const ProductImage({Key? key, this.urlPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        height: 450,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          child: /*FadeInImage(
            placeholder: AssetImage('assets/img/loading.gif'),
            image: NetworkImage('https://via.placeholder.com/300x300/green'),
            fit: BoxFit.cover,
          ),*/
              _getImage(urlPath),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.red,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(45),
        topRight: Radius.circular(45),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ],
    );
  }

  Widget _getImage(String? urlPath) {
    if (urlPath == null) {
      return const Image(image: AssetImage('assets/img/no-image.jpg'));
    }
    return Image.file(
      File(urlPath),
      fit: BoxFit.cover,
    );
  }
}
