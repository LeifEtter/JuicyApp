import 'package:flutter/material.dart';
import 'package:juicy_app/extra/colors.dart';

class AppBarIcon extends StatelessWidget {
  final IconData icon;

  AppBarIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(1.0, 1.0),
            color: Colors.black12,
            spreadRadius: 2.0,
            blurRadius: 2.0,
          ),
        ],
        borderRadius: BorderRadius.circular(100.0),
        color: Colors.white,
      ),
      child: Icon(
        icon,
        size: 35,
        color: Colors.black,
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final Color buttonColor;
  final bool categoryActive;
  final Function activateCategory;
  final IconData categoryIcon;
  final String category;


  const CategoryButton({
    Key key,
    @required this.buttonColor,
    @required this.categoryActive,
    @required this.activateCategory,
    @required this.categoryIcon,
    @required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        activateCategory(category, categoryActive);
      },
      child: Container(
        width: 50,
        height: 50,
        child: Icon(categoryIcon),
        decoration: BoxDecoration(
          color: categoryActive ? buttonColor : Colors.grey,
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final Color buttonColor;
  final bool loggedIn;
  final Function login;
  final Function register;
  const SubmitButton({
    Key key,
    @required this.buttonColor,
    @required this.loggedIn,
    @required this.login,
    @required this.register,
  })  :  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: buttonColor,
      ),

      child: FlatButton(
        onPressed: () {
          loggedIn ? register() : login();
        },
        child: Text(
          loggedIn ? "Registrieren" : "Anmelden",
          style: TextStyle(
            fontSize: 40.0,
            color: juicyYellow,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}




