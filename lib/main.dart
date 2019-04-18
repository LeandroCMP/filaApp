import 'package:fila_app_generic/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
.then((_){
  runApp(
    App()
  );
});

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App fila Generico",
      home: InitialPage(),
  
    );
  }
}