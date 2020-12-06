import 'package:flutter/material.dart';

Color juicyYellow = Color.fromRGBO(252, 204, 104, 1.0);
Color juicyBlue = Color.fromRGBO(126, 205, 236, 1.0);
Color juicyPurple = Color.fromRGBO(201, 158, 204, 1.0);
Color juicyOrange = Color.fromRGBO(243, 146, 0, 1.0);

Color getColor(color) {
  if(color == "juicyYellow") {
    return juicyYellow;
  } else if(color == "juicyBlue") {
    return juicyBlue;
  } else if(color == "juicyPurple") {
    return juicyPurple;
  } else if(color == "juicyOrange") {
    return juicyOrange;
  } else {
    return Colors.red;
  }
}

Color textColor1 = Color.fromRGBO(19, 21, 22, 1);
Color textColor2 = Color.fromRGBO(55, 61, 63, 1);
