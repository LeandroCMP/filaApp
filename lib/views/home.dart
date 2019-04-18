import 'package:fila_app_generic/views/horario.dart';
import 'package:fila_app_generic/views/senha.dart';
import 'package:fila_app_generic/views/servicos.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
    indice.close();
  }

  var indice = BehaviorSubject<dynamic>();

  int _indexController = 0;

  @override
  Widget build(BuildContext context) {
    _senhaHome() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset(
                "images/ticketIcon.png",
                width: MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width * 0.92),
                color: _indexController == 0 ? Colors.red : Colors.white,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                "Senha",
                style: TextStyle(
                  color: _indexController == 0 ? Colors.red : Colors.white,
                ),
              )
            ],
          ),
        ],
      );
    }

    _horarioHome(){
      return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          "images/clockIcon.png",
                          width: MediaQuery.of(context).size.width -
                              (MediaQuery.of(context).size.width * 0.92),
                          color:
                              _indexController == 1 ? Colors.red : Colors.white,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Horário",
                          style: TextStyle(
                            color: _indexController == 1
                                ? Colors.red
                                : Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                );
    }

  _servicosHome(){
    return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          "images/servicesIcon.png",
                          width: MediaQuery.of(context).size.width -
                              (MediaQuery.of(context).size.width * 0.92),
                          color:
                              _indexController == 2 ? Colors.red : Colors.white,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Serviços",
                          style: TextStyle(
                            color: _indexController == 2
                                ? Colors.red
                                : Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                );
  }

    _containerBottom() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.height * 0.92),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color.fromARGB(180, 0, 0, 0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StreamBuilder(
                  stream: indice.stream,
                  builder: (build, context) {
                    return _senhaHome();
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width * 0.80),
                ),
                StreamBuilder(
                  stream: indice.stream,
                  builder: (build, context){
                    return _horarioHome();
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width * 0.80),
                ),
                StreamBuilder(
                  stream: indice.stream,
                  builder: (build, context){
                    return _servicosHome();
                  },
                )
              ],
            ),
          )
        ],
      );
    }

    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            PageView(
              onPageChanged: (index) {
                _indexController = index;

                indice.sink.add(_indexController);
              },
              children: <Widget>[
                SenhaScreen(),
                HorarioScreen(),
                ServicosScreen()
              ],
            ),
            _containerBottom()
          ],
        ),
      ),
    );
  }
}
/*
*/
