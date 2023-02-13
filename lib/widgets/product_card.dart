import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, 
    required this.product});

  final Product product;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top:20, bottom: 10),
        height: 300,
        width: double.infinity,
        decoration: _listBox(),
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
             _BackgroundImage(product.picture),
            
              _CardBottom(
                title: product.name, 
                subtitle: product.id!
                ),

              Positioned(top:0,child: _CardTop(price: product.price,)),

             if(!product.available)
                Positioned(top:0, left:0, child: _PriceTag())
          ],
        ),
      ),    
    );
  }

  BoxDecoration _listBox() => BoxDecoration(
    borderRadius: BorderRadius.circular(25),
    color: Colors.white,
    boxShadow: const [
       BoxShadow(
        color: Colors.black12,
        offset: Offset(0,5),
        blurRadius: 10,
      )
    ]

  );
}

class _PriceTag extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      decoration: const BoxDecoration(
        color: Colors.orange,
        borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(25)
        )
      ),
      child: const Center(
        child: Text('No disponible',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
            ),
      )),
    );
  }
}

class _CardTop extends StatelessWidget {
  
  final double price;

  const _CardTop({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 110,      
      decoration: _cardTopDecoration(),       
      child: Center(
        child: Text('\$$price',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
          ))),
    );
  }

BoxDecoration _cardTopDecoration() {
    return const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          topRight: Radius.circular(25) )
    );
  }
}

class _CardBottom extends StatelessWidget {
  
  final String title;
  final String subtitle;

  const _CardBottom({required this.title, required this.subtitle});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50.0),
      child: Container(
        height: 60,
        width: double.infinity,
        
        decoration: _bottomBoxInfo(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text( title, 
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold
            )),
            const Spacer(),
            Text( subtitle, 
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            
            ))]
          ),
        ),
      ),
    );
  }

  BoxDecoration _bottomBoxInfo() => const BoxDecoration(
   borderRadius: BorderRadius.only(
    topRight: Radius.circular(25),
    bottomLeft: Radius.circular(25)    
     ),
   color: Colors.indigo,
  );
}

class _BackgroundImage extends StatelessWidget {
  final String? url;

   const _BackgroundImage( this.url);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: url == null
        ? const Image(
          image: AssetImage('assets/no-image.png'),
          fit: BoxFit.cover)
        : FadeInImage(
          placeholder: const AssetImage('assets/cargando.gif'),
          image: NetworkImage(url!),
          fit: BoxFit.cover,
        ),
        
      ),
    );
  }
}