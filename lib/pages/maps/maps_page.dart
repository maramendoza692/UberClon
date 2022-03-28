import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class MapsPage extends StatefulWidget {
  MapsPage({Key key}) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  MapsController _con = new MapsController();

  get backgroundImage => null; //Objeto Controlador

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
        title: Text('Maps Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [_textMaps(), _imgMaps()],
        ),
      ),
    );
  } //Termina build

  Widget _textMaps() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'Mapa',
        style: TextStyle(
            color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
      ),
    );
  } // Termina _textRegister

  Widget _imgMaps() {
    return Container(
      child: Image.asset(
        'assets/img/UberCap.jpg',
        width: 500,
        height: 500,
      ),
    );
  }
}

class MapsController {
  void init(BuildContext context) {}
}
