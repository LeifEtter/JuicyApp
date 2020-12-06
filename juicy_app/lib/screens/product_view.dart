import 'package:flutter/material.dart';
import 'package:juicy_app/widgets/text.dart';
import 'package:juicy_app/extra/colors.dart';

class ProductView extends StatefulWidget {
  final product;
  final double screenHeight;
  final double screenWidth;

  ProductView({
    Key key,
    @required this.product,
    @required this.screenHeight,
    @required this.screenWidth,
  })  : super(key: key);
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation _edgeAnimation;
  Animation _descriptionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1500));
    _edgeAnimation = Tween<double>(begin: 20.0, end: 0).animate(_controller);
    _descriptionAnimation = Tween<double>(begin: widget.screenHeight+250, end: widget.screenHeight/2).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeInOut,
        )
    )
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    List<String> categories = List.from(widget.product['categories']);
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.product["id"] + '.container',
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_edgeAnimation.value),
                color: getColor(widget.product["color"]),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: widget.screenWidth-60, top: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                  Icons.cancel,
                  color: Colors.white,
                size: 35.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: _descriptionAnimation.value),
            child: Container(
              height: MediaQuery.of(context).size.height - 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: widget.screenWidth/2-100, top: widget.screenHeight/2-200),
            child: Hero(
              tag: widget.product["id"],
              child: Image.asset(
                widget.product["imagePath"],
                width: 300,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 70.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WhiteText("Categories: ", 16.0, FontWeight.w400),
                    Container(
                      height: 20.0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return WhiteText(
                            categories[index] + ', ',
                            16.0,
                            FontWeight.w400,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                WhiteText(widget.product["name"], 30.0, FontWeight.w500),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: widget.screenHeight/2-100, left: 20.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WhiteText("Price", 20.0, FontWeight.w400),
                  WhiteText(widget.product["price"].toString() + "€", 40.0, FontWeight.w500),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}

/*class StaggeredAnimations {
  StaggeredAnimations(this.controller)
    : _edgeAnimation = Tween<double>(begin: 20.0, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0, 0.3, curve: Curves.easeIn),
      ),
    ),
        _descriptionAnimation = Tween<double>(begin: 1000, end: 500).animate(
          CurvedAnimation(
        parent: controller,
        curve: Interval(0.3, 0.5, curve: Curves.easeIn),
      ),
  );

  final AnimationController controller;
  final Animation<double> _edgeAnimation;
  final Animation<double> _descriptionAnimation;
}*/
