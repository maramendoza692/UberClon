import 'package:flutter/material.dart';

class LoginController {
  BuildContext context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Future init(BuildContext context) {
    this.context = context;
  }

  void goToMapsPage() {
    Navigator.pushNamed(context, 'maps');
  }

    void goToRegisterPage() {
    Navigator.pushNamed(context, 'register');
  }

}
