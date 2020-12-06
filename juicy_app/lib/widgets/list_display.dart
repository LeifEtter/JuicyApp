import 'package:flutter/material.dart';
import 'package:juicy_app/widgets/text.dart';

class ListDisplay extends StatelessWidget {
  final List list;
  final Color color;
  final double fs;
  final FontWeight fw;
  const ListDisplay(this.list, this.color, this.fs, this.fw);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return BlackText(
          list[index] + ', ',
          fs,
          fw,
        );
      },
    );
  }
}
