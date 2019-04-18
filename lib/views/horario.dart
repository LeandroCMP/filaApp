import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HorarioScreen extends StatefulWidget {
  @override
  _HorarioScreenState createState() => _HorarioScreenState();
}

class _HorarioScreenState extends State<HorarioScreen> {
  _backgroundImage() {
    return Image.asset(
      "images/backgroundHorario.jpg",
      fit: BoxFit.cover,
      height: MediaQuery.of(context).size.height,
    );
  }

  _logoEmpresa() {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width -
              (MediaQuery.of(context).size.width * 0.90),
          left: MediaQuery.of(context).size.width -
              (MediaQuery.of(context).size.width * 0.95)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            "images/LogoPositivo.png",
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.height * 0.90),
            width: MediaQuery.of(context).size.width -
                (MediaQuery.of(context).size.width * 0.70),
          )
        ],
      ),
    );
  }

  _btnAgendar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.height * 0.20),
          ),
          child: RaisedButton(
              onPressed: () {},
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Agendar Horário",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width -
                            (MediaQuery.of(context).size.width * 0.95),
                      ),
                    ),
                  ],
                ),
                height: MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).size.height * 0.92),
                width: MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width * 0.55),
              ),
              color: Color.fromARGB(255, 130, 0, 0)),
        )
      ],
    );
  }


  _espacoForm(){
    return SizedBox(
      height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height * 0.95),
    );
  }


  _formHorario() {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height * 0.80),
          left: MediaQuery.of(context).size.width -
              (MediaQuery.of(context).size.width * 0.95)),
      child: Column(
        children: <Widget>[
          Row(
        children: <Widget>[
          Container(
        width: MediaQuery.of(context).size.width -
              (MediaQuery.of(context).size.width * 0.10),
        child: TextField(
          autocorrect: true,
          cursorColor: Colors.red,
          cursorRadius: Radius.circular(50),
          dragStartBehavior: DragStartBehavior.start,
          enableInteractiveSelection: true,
          keyboardAppearance: Brightness.light,
          textCapitalization: TextCapitalization.words,
          style: TextStyle(
            color: Colors.white
          ),
          decoration: InputDecoration(
              hintText: "Nome",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white
                )
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.yellow
                )
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green
                )
              )
              ),
        ),
      ),
        ],
      ),
      _espacoForm(),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            _backgroundImage(),
            _logoEmpresa(),
            _btnAgendar(),
            _formHorario()
          ],
        ),
      ),
    );
  }
}
