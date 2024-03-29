import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';


class ProductFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Product product;

  ProductFormProvider(this.product);

  void updateAvailability (bool value){

    product.available = value;
    notifyListeners();

  }

   
  bool isValidForm(){

    return formKey.currentState?.validate() ?? false;
  }

}