import 'package:flutter/material.dart';
import 'package:juicy_app/extra/colors.dart';
import 'package:juicy_app/widgets/list_display.dart';
import 'package:juicy_app/widgets/text.dart';

class ProductCardRedesign extends StatefulWidget {
  final product;

  ProductCardRedesign({
    Key key,
    this.product,
  }) : super(key: key);
  @override
  _ProductCardRedesignState createState() => _ProductCardRedesignState();
}

class _ProductCardRedesignState extends State<ProductCardRedesign> {

  @override
  Widget build(BuildContext context) {
    List<String> sizes = List.from(widget.product['sizes']);
    return Stack(
      children: [
        Hero(
          tag: widget.product["id"] + '.container',
          child: Container(
            alignment: Alignment.center,
            height: 250,
            width: 200,
            decoration: BoxDecoration(
              color: getColor(widget.product["color"]),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: widget.product["id"],
                child: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Image.asset(
                    widget.product["imagePath"],
                    width: 170,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 155.0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlackText(widget.product["name"], 20.0, FontWeight.w500),
              Row(
                children: [
                  BlackText("sizes: ", 15.0, FontWeight.w500),
                  Container(
                    height: 15,
                    child: ListDisplay(sizes, Colors.black, 14.0, FontWeight.w500),
                  ),
                ],
              ),
              BlackText("Price: " + widget.product["price"].toString() + "€", 20.0, FontWeight.w500),
            ],
          ),
        ),
      ],
    );
  }
}
