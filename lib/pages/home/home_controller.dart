import 'package:flutter/material.dart';

class HomeController {
  BuildContext context;

  //Constructor
  Future init(BuildContext context) {
    this.context = context;
  }

  void goToLoginPage() {
    Navigator.pushNamed(context, 'login');
  }
  
}
