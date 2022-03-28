import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_uber/pages/home/home_controller.dart';

class HomePage extends StatelessWidget {
  //Instancia del controlador
  HomeController _con = new HomeController();

  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _con.init(context); // Ejecutar contructor con el contexto
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: [Colors.black45, Colors.black]),
          ),
          child: Column(
            children: [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  color: Colors.white,
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
                            color: Colors.black54,
                            fontSize: 30,
                            fontFamily: 'Pacifico'),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              Text(
                'SELECCIONA TU ROL',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: _con.goToLoginPage, //Metodo que maneja el evento
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/img/pasajero.png'),
                  radius: 50,
                  backgroundColor: Colors.black,
                ),
              ),
              Text(
                'Cliente',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: _con.goToLoginPage,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/img/driver.png'),
                  radius: 50,
                  backgroundColor: Colors.black,
                ),
              ),
              Text('Conductor', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  } //Método build

  //void goToLoginPage(BuildContext context) {
  //Navigator.pushNamed(context, 'login');
  //}
} //Clase HomePage
