import 'package:flutter/material.dart';

class InputFieldAuth extends StatefulWidget {

  const InputFieldAuth({
    Key key,
    @required this.textController,
    @required this.hintText,
    @required this.prefixIcon,
    @required this.obscureText,
    @required this.focusNode,
  })  : super(key: key);

  final bool obscureText;
  final IconData prefixIcon;
  final String hintText;
  final TextEditingController textController;
  final FocusNode focusNode;
  @override
  _InputFieldAuthState createState() => _InputFieldAuthState();
}

class _InputFieldAuthState extends State<InputFieldAuth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      child: TextField(
        focusNode: widget.focusNode,
        obscureText: widget.obscureText,
        controller: widget.textController,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.prefixIcon),
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 2.0,
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(1, 2),
          ),
        ],
      ),
    );
  }
}