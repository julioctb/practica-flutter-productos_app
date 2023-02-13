import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:productos_app/services/products_services.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  final productsService = Provider.of<ProductsService>(context);

    if(productsService.isLoading){
      return LoadingPage();
    }
  
    return  Scaffold(
      appBar:  AppBar(title: const Text('Productos')),
      body: ListView.builder(
        itemCount: productsService.products.length,

        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            productsService.selectedProduct = productsService.products[index].copy();
            Navigator.pushNamed(context, 'detail_product');
          },
          child: ProductCard(
            product: productsService.products[index]
          )
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
        
      },),

        );
  }
}
