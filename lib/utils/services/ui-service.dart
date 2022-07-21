
import 'package:flutter/material.dart';

double rSpaceMax(double dec, double max){
  return dec < max ? dec : max;
}

class UIService {
  static Color primaryColor = const Color(0xff1e329d);

  static Decoration boxDecor = const BoxDecoration(
      boxShadow:[
        BoxShadow(
          color: Color(0xffe9e9e9),
          blurRadius: 25.0,
          spreadRadius: 1.0,
          offset: Offset(1.0, 1.0),
        )
      ]
  );
}
