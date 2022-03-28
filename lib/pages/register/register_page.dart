import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_uber/pages/register/register_controller.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterController _con = new RegisterController(); //Objeto Controlador

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
        title: Text('Register Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _bannerApp(),
            _textRegistro(),
            _textFieldNombre(),
            _textFieldApellido(),
            _textFieldCiudad(),
            _textFieldEmail(),
            _textFieldPassword(),
            _buttonLogin()
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
              'Fácil y Rápido',
              style: TextStyle(
                  color: Colors.black54, fontSize: 30, fontFamily: 'Pacifico'),
            )
          ],
        ),
      ),
    );
  } //Terminar _bannerApp

  Widget _textRegistro() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'Regístrate',
        style: TextStyle(
            color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
      ),
    );
  } // Termina _textRegister

  Widget _textFieldNombre() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Nombre',
        ),
      ),
    );
  } //Termia textFieldNombre

  Widget _textFieldApellido() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _con.passwordController, //Controlador de password
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Apellido',
        ),
      ),
    );
  }

  Widget _textFieldCiudad() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _con.passwordController, //Controlador de password
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Ciudad',
        ),
      ),
    );
  }

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
      margin: EdgeInsets.symmetric(horizontal: 30),
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
        onPressed: _con.goToLoginPage, //metodo que ejecuta la accion rnt

        child: Stack(
          children: [
            Container(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '¿Ya tienes cuenta? Inicia sesión',
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
}
