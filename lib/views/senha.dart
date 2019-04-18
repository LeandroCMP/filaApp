import 'package:fila_app_generic/blocs/senhaBloc.dart';
import 'package:flutter/material.dart';

class SenhaScreen extends StatefulWidget {
  @override
  _SenhaScreenState createState() => _SenhaScreenState();
}

class _SenhaScreenState extends State<SenhaScreen> {
  SenhaAtualBloc bloc;

   @override
    void initState(){
      super.initState();
     bloc = SenhaAtualBloc();
    }

  @override
  Widget build(BuildContext context) {
    var sizeFontMySenha = MediaQuery.of(context).size.width -
                            (MediaQuery.of(context).size.width * 0.95);
   

_backgroundImage() {
    return Image.asset(
      "images/backgroundHome.jpg",
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

  _painelSenha() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height * 0.30),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  StreamBuilder(
                    stream: bloc.senhaAtual.stream,
                    initialData: "",
                    builder: (BuildContext context, AsyncSnapshot snapshot){
                      return Text(
                    "${snapshot.data.toString()}",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width -
                            (MediaQuery.of(context).size.width * 0.80)),
                  );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              StreamBuilder(
                initialData: "",
                stream: bloc.getPassword.stream,
                builder: (build, context){
                  return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Sua Senha é: ${context.data.toString()}",
                    style: TextStyle(
                        fontSize: sizeFontMySenha),
                  )
                ],
              );
                },
              )
            ],
          ),
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height * 0.80),
          width: MediaQuery.of(context).size.width -
              (MediaQuery.of(context).size.width * 0.40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(200, 255, 255, 255),
          ),
        )
      ],
    );
  }

  _btnSenha() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.height * 0.40),
          ),
          child: RaisedButton(
              onPressed: bloc.getSenha,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Pegar Senha",
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
              splashColor: Colors.white,
              elevation: 4,
              highlightColor: Colors.redAccent,
              highlightElevation: 0,
              disabledColor: Colors.grey,
              color: Color.fromARGB(255, 130, 0, 0)
              ),
        )
      ],
    );
  }
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _backgroundImage(),
            _logoEmpresa(),
            _painelSenha(),
            _btnSenha(),
          ],
        ),
      ),
    );
  }
}
