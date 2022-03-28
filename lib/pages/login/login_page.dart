import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_uber/pages/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _con = new LoginController(); //Objeto Controlador

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _bannerApp(),
            _textDescription(),
            _textLogin(),
            _textFieldEmail(),
            _textFieldPassword(),
            _buttonLogin(),
            _buttonDontHaveAccount(),
            //_textDontHaveAccount()
          ],
        ),
      ),
    );
  } //Termina build

  Widget _bannerApp() {
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              colors: [Colors.white, Colors.black54]),
        ),
        height: MediaQuery.of(context).size.height * 0.30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/img/logo_app.png',
              width: 150,
              height: 100,
            ),
            Text(
              'Facil y Rapido',
              style: TextStyle(
                  color: Colors.black54, fontSize: 30, fontFamily: 'Pacifico'),
            )
          ],
        ),
      ),
    );
  } //Terminar _bannerApp

  Widget _textDescription() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Continua con:',
        style: TextStyle(color: Colors.black54, fontSize: 24),
      ),
    );
  } //Termina _textDescription

  Widget _textLogin() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'Login',
        style: TextStyle(
            color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
      ),
    );
  } // Termina _textLogin

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _con.emailController, //Se asigna el controlador del email
        decoration: InputDecoration(
          hintText: 'correo@gmail.com',
          labelText: 'Correo Electronico',
          suffix: Icon(
            Icons.email_outlined,
            color: Colors.black54,
          ),
        ),
      ),
    );
  } //Termina _textFieldEmail

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: TextField(
        controller: _con.passwordController, //Controlador de password
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Contraseña',
          suffix: Icon(
            Icons.lock_clock_outlined,
            color: Colors.black54,
          ),
        ),
      ),
    );
  } // Termina _textFieldPassword

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        onPressed: _con.goToMapsPage, //metodo que ejecuta la accion rnt

        child: Stack(
          children: [
            Container(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Iniciar Sesión',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.centerRight,
                child: CircleAvatar(
                  child: Icon(Icons.arrow_forward_ios),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  radius: 15,
                ),
              ),
            )
          ],
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black)),
      ),
    );
  }

  Widget _buttonDontHaveAccount() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        onPressed: _con.goToRegisterPage, //metodo que ejecuta la accion rnt

        child: Stack(
          children: [
            Container(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '¿No tienes cuenta?',
                  style: TextStyle(fontSize: 20, color: Colors.black45),
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.centerRight,
              ),
            )
          ],
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white)),
      ),
    );
  }

  /*Widget _textDontHaveAccount() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50),
      child: Text(
        '¿No tienes cuenta?',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
      ),
    );
  }*/
}
