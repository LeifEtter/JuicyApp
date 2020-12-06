import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:juicy_app/extra/colors.dart';
import 'package:juicy_app/screens/home_view_scroll.dart';
import 'package:juicy_app/widgets/authentication_form.dart';
import 'package:juicy_app/widgets/buttons.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> with SingleTickerProviderStateMixin {
  GlobalKey<FormState> _authenticationFormKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isSignUp = false;
  AnimationController _controller;
  Animation _animation;
  FocusNode _focusNode = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 200.0, end: 50.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
    _focusNode2.addListener(() {
      if (_focusNode2.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
    _focusNode3.addListener(() {
      if (_focusNode3.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.reverse();
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Image.asset(
                "assets/logos/juicy_logo.png",
                width: 220,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _animation.value),
              child: Center(
                child: Column(
                  children: [
                    AuthenticationForm(
                      authenticationFormKey: _authenticationFormKey,
                      isSignUp: isSignUp,
                      nameController: _nameController,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      focusNode: _focusNode,
                      focusNode2: _focusNode2,
                      focusNode3: _focusNode3,
                    ),
                    SizedBox(height: 5.0),
                    SubmitButton(
                      buttonColor: juicyPurple,
                      loggedIn: isSignUp,
                      login: login,
                      register: register,
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      isSignUp
                          ? 'Hast du bereits einen Account?'
                          : 'Noch kein Account?',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Container(
                      height: 50.0,
                      child: TextButton(
                        child: Text(
                          isSignUp ? 'Login' : 'Registrieren',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Theme
                                .of(context)
                                .primaryColor,
                          ),
                        ),
                        onPressed: () {
                          setState(() => isSignUp = !isSignUp);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> authentication() async {
    if (isSignUp) {
      try {
        await register();
      } catch (e) {
        print(e);
      }
    } else {
      try {
        await login();
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  Future<void> register() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    await login();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }
}