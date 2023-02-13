import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/widgets/widgets.dart';
import 'package:productos_app/providers/providers.dart';
import 'package:productos_app/ui/inputs_decorations.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
              child: Column(
        children: [
          const SizedBox(height: 250),
          CardContainer(
            child: Column(
              children: [
                Text('Login', style: Theme.of(context).textTheme.headline5),
                const SizedBox(height: 30),
                ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(),
                  child: const _LoginForm(),
                )
              ],
            ),
          ),
          const SizedBox(height: 50),
          const Text('Crear una cuenta nueva',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ))),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputsDecorations.authInputsDecoration(
                hintText: 'ejemplo@ejemplo.com',
                labelText: 'correo electronico',
                prefixIcon: Icons.alternate_email),
            onChanged: ((value) => loginForm.email = value),
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);

              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'Formato de correo incorrecto';
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputsDecorations.authInputsDecoration(
                hintText: '******',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline),
            onChanged: ((value) => loginForm.password = value),
            validator: (value) {
              return (value != null && value.length >= 8)
                  ? null
                  : 'la contraseña tiene que ser mayor a 8 caracteres';
            },
          ),
          const SizedBox(height: 35),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.deepPurple,
            disabledColor: Colors.grey,
            elevation: 0,
            onPressed: loginForm.isLoading
                ? null
                : () async {
                    //para quitar el teclado usamos el comando
                    FocusScope.of(context).unfocus();

                    //condicional si no es valido no regresa nada
                    if (!loginForm.isValidForm()) return;

                    loginForm.isLoading = true;

                    // simulamos el delay de la peticion http
                    await Future.delayed(const Duration(seconds: 2));

                    //TODO: validar si el login es correcto
                    loginForm.isLoading = false;

                    //se agrega la navegación hacia el home o pagina principal
                    //Navigator.pushReplacementNamed(context, 'home');
                  },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
              child: Text(loginForm.isLoading ? 'Espere...' : 'Ingresar',
                  style: const TextStyle(
                    color: Colors.white,
                  )),
            ),
          )
        ]));
  }
}
