import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:productos_app/models/models.dart';



class ProductsService extends ChangeNotifier {

 final _baseUrl = 'flutter-storage-82964-default-rtdb.firebaseio.com';
 final List<Product> products = [];
 bool isLoading = true;
 late Product selectedProduct;


  // dispara el metodo una vez se inicie el Servicio
  ProductsService() {
    loadProducts(); 
  }


  Future loadProducts() async {

    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);
    final Map<String, dynamic> productsMap = json.decode(resp.body);

   productsMap.forEach((key, value) {
    final tempProduct = Product.fromMap(value);// se toma del modelo que creamos en quicktype
    tempProduct.id =key; // se crea el id y se iguala al key que recibimos (se tiene que agregar en el modelo)
    products.add(tempProduct);
   });
      
    isLoading = false;
    notifyListeners();
  }


}