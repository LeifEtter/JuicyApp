import 'package:flutter/material.dart';
import 'package:juicy_app/widgets/buttons.dart';
import 'package:juicy_app/extra/colors.dart';

class TopBar extends StatefulWidget {
  bool showAppbar = true;
  bool iconOpacity = true;
  TopBar({
    Key key,
    this.showAppbar,
    this.iconOpacity
  }) : super(key: key);
  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: juicyBlue,
      height: widget.showAppbar ? 100.0 : 0.0,
      duration: Duration(milliseconds: 200),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Opacity(
              child: AppBarIcon(Icons.shopping_cart_outlined),
              opacity: widget.iconOpacity ? 1.0 : 0.0,
            ),
            Image.asset("assets/logos/juicy_logo.png", fit: BoxFit.contain, width: 150),
            Opacity(
              child: AppBarIcon(Icons.search),
              opacity: widget.iconOpacity ? 1.0 : 0.0,
            ),
          ],
        ),
      ),
    );
  }
}
