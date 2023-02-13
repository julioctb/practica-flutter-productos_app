import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  // se selecciona establece una variable donde se especifica que es una
  // clave global donde se afecta el estado del formulario (tipo form ()),
  // si fuera tipo scaffold, sería tipo ScaffoldState

  GlobalKey<FormState> formKey = GlobalKey();

  String email = '';
  String password = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(value) {
    _isLoading = value;

    notifyListeners();
  }

  bool isValidForm() {
   // print(formKey.currentState?.validate());
    //print('$email - $password');

    return formKey.currentState?.validate() ?? false;
  }
}
