import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final List product;

  ProductCard({
    Key key,
    this.product,
  }) : super(key: key);
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 200,
      child: Stack(
        children: [

          Hero(
            tag: widget.product[0] + '.container',
            child: Container(
              alignment: Alignment.center,
              height: 170,
              width: 200,
              decoration: BoxDecoration(
                color: widget.product[2],
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          Hero(
            tag: widget.product[0],
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Image.asset(
                  "assets/product_images/" + widget.product[0] + ".png",
                  width: 170,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 2.0,
                    blurRadius: 2.0,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              width: 200,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("sizes: "),
                        Container(
                          height: 15,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.product[3].length,
                            itemBuilder: (context, index) {
                              return Text(
                                widget.product[3][index] + ', ',
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Text("Price: " + widget.product[4].toString()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
