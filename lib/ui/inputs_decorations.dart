import 'package:flutter/material.dart';


class InputsDecorations {


  static InputDecoration authInputsDecoration({
    required String hintText, 
    required String labelText,
    IconData? prefixIcon 
}){

    return  InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple
              )
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple, width: 2.0)
            ),
            hintText:  hintText,
            labelText: labelText,
            labelStyle: const TextStyle(
              color: Colors.grey
            ),
            prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color:Colors.deepPurple)
            : null
           );


  }

}