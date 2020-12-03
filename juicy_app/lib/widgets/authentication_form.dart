import 'package:flutter/material.dart';
import 'package:juicy_app/widgets/input_fields.dart';

class AuthenticationForm extends StatelessWidget {
  const AuthenticationForm({
    Key key,
    @required GlobalKey<FormState> authenticationFormKey,
    @required this.isSignUp,
    @required TextEditingController nameController,
    @required TextEditingController emailController,
    @required TextEditingController passwordController,
    @required focusNode,
    @required focusNode2,
    @required focusNode3,
    @required topPadding,
  })  : _authenticationFormKey = authenticationFormKey,
        _nameController = nameController,
        _emailController = emailController,
        _passwordController = passwordController,
        _focusNode = focusNode,
        _focusNode2 = focusNode2,
        _focusNode3 = focusNode3,
        super(key: key);

  final GlobalKey<FormState> _authenticationFormKey;
  final bool isSignUp;
  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final FocusNode _focusNode, _focusNode2, _focusNode3;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _authenticationFormKey,
      child: Column(
        children: [
          Visibility(
            visible: isSignUp,
            child: InputFieldAuth(
              textController: _nameController,
              hintText: 'Name*',
              prefixIcon: Icons.perm_identity,
              obscureText: false,
              focusNode: _focusNode,
            ),
          ),
          SizedBox(height: 10),
          InputFieldAuth(
            textController: _emailController,
            hintText: "Email*",
            prefixIcon: Icons.mail,
            obscureText: false,
            focusNode: _focusNode2,
          ),
          SizedBox(height: 10),
          InputFieldAuth(
            textController: _passwordController,
            hintText: "Passwort*",
            prefixIcon: Icons.lock,
            obscureText: true,
            focusNode: _focusNode3,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
