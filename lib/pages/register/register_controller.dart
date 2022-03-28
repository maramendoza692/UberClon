import 'package:flutter/material.dart';

class RegisterController {
  BuildContext context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Future init(BuildContext context) {
    this.context = context;
  }

  void register() {
  }

  void goToLoginPage() {
    Navigator.pushNamed(context, 'login');
  }
}
