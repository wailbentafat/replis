import 'package:flutter/material.dart';

void Navigateto(BuildContext context ,Widget page){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
}