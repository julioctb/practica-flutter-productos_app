import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {

  final String? url;

  const ProductImage({super.key,  this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10, left: 10 , right: 10),
      child: Container(
        height: 450,
        width: double.infinity,
        decoration: _detailimageDecoration(),
        child:  Opacity(
          opacity: 0.8,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(topLeft:Radius.circular(45),topRight: Radius.circular(45 )),
            child: url == null
            ? const Image(image: AssetImage('assets/no-image.png'),
            fit:BoxFit.cover)
            : FadeInImage(
              placeholder: const AssetImage('assets/cargando.gif'),
              image: NetworkImage(url!),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _detailimageDecoration() =>  BoxDecoration(
    color: Colors.black,
    borderRadius: const BorderRadius.only(topLeft:Radius.circular(45),topRight: Radius.circular(45 )),
    boxShadow: [
      BoxShadow(
      color: Colors.black.withOpacity(0.05),
      offset: const Offset(0,5),
      blurRadius:10
      )
       ]
    );

  
}