import 'package:flutter/material.dart';
import 'color.dart';
import 'functions.dart';
////Buttons
///

OutlinedButton buttonoutline(
    {double? mobilewidth,
    double? mobileheight,
    required String text,
    Function()? fun}) {
  mobilewidth ??= 100;
  mobileheight ??= 100;
  return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(width: 2, color: Appcolor.third),
        minimumSize: Size(mobilewidth, mobileheight / 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
      ),
      onPressed: fun,
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, color: Appcolor.third),
      ));
}

ElevatedButton button(
    {double? mobilewidth,
    double? mobileheight,
    required String text,
    required Function() fun}) {
  mobileheight ??= 100;
  mobilewidth ??= 100;
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        minimumSize: Size(mobilewidth, mobileheight / 16),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
        backgroundColor:
            MaterialStateColor.resolveWith((states) => Appcolor.third)),
    onPressed: fun,
    child: Text(
      text,
      style: const TextStyle(fontSize: 20, color: Appcolor.first),
    ),
  );
}

TextFormField textfield(
    {required double height,
    required String text,
    bool? obscureText2,
    IconData? icon,
    TextEditingController? control,
    required Function(String?) f,
    required String? Function(String?) fun,
    TextInputType? keyboard}) {
  obscureText2 ??= false;
  return TextFormField(
    controller: control,
    onSaved: f,
    keyboardType: keyboard,
    decoration: InputDecoration(
        prefixIcon: Icon(icon,color: Appcolor.second,),
        
        contentPadding: EdgeInsets.symmetric(
            vertical: height / 2.5, horizontal: height / 1.5),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.5, color: Colors.red),
            borderRadius: BorderRadius.circular(21)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1.5,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(21)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 1.5, color: Appcolor.second),
            borderRadius: BorderRadius.circular(21)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 1.5, color: Appcolor.third,),
            borderRadius: BorderRadius.circular(21)),
        hintText: text,
        hintStyle: const TextStyle(fontSize: 18, color: Colors.grey)),
    validator: fun,
    obscureText: obscureText2,
  );
}
