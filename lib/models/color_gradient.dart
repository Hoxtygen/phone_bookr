import 'package:flutter/material.dart';

LinearGradient colorGradient(Color color) {
  var baseColor = color as dynamic;
  Color colorA = baseColor[800];
  Color colorB = baseColor[200];

  return LinearGradient(colors: [
    colorA,
    colorB,
  ], begin: Alignment.bottomLeft, end: Alignment.topRight);
}
