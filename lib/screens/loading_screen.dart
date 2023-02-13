import 'package:flutter/material.dart';


// ignore: use_key_in_widget_constructors
class LoadingPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: const Center(child: CircularProgressIndicator(color: Colors.indigo)),
    );
  }
}