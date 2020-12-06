import 'package:flutter/material.dart';
import 'package:juicy_app/widgets/buttons.dart';
import 'package:juicy_app/extra/colors.dart';

class TopBar extends StatefulWidget {
  bool showAppbar = true;
  bool iconOpacity = true;
  bool isSearching = false;
  TopBar({
    Key key,
    this.showAppbar,
    this.iconOpacity,
    this.isSearching,
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
            Visibility(
              visible: !widget.isSearching,
              child: Opacity(
                child: AppBarIcon(Icons.shopping_cart_outlined),
                opacity: widget.iconOpacity ? 1.0 : 0.0,
              ),
            ),
            Visibility(
              visible: !widget.isSearching,
                child: Image.asset(
                    "assets/logos/juicy_logo.png",
                    fit: BoxFit.contain,
                    width: 150,
                ),
            ),
            Opacity(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if(widget.isSearching == true) {
                      widget.isSearching = false;
                    } else if(widget.isSearching == false) {
                      widget.isSearching = true;
                    }

                  });
                },
                  child: AppBarIcon(Icons.search)
              ),
              opacity: widget.iconOpacity ? 1.0 : 0.0,
            ),
          ],
        ),
      ),
    );
  }
}
