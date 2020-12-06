import 'package:flutter/material.dart';
import 'package:juicy_app/extra/colors.dart';

class WhiteText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  WhiteText(this.text, this.size, this.weight);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: "Arial",
        color: Colors.white,
        fontWeight: weight,
      ),
    );
  }
}

class BlackText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  BlackText(this.text, this.size, this.weight);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor1,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}



