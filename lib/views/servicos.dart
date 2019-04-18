import 'package:fila_app_generic/blocs/servicosBloc.dart';
import 'package:fila_app_generic/models/servicosModel.dart';
import 'package:fila_app_generic/views/widgets/servicos_widgets.dart';
import 'package:flutter/material.dart';

class ServicosScreen extends StatefulWidget {
  @override
  _ServicosScreenState createState() => _ServicosScreenState();
}

class _ServicosScreenState extends State<ServicosScreen> {

  ServicosBloc bloc;

  @override 
  void initState(){
    super.initState();
    bloc = ServicosBloc();
  }


  _backgroundImage() {
    return Image.asset(
      "images/backgroundServicos.jpg",
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

  _servicos(){
    return SingleChildScrollView(
      child: StreamBuilder(
        stream: bloc.buscaServicos(),
        builder: (BuildContext build, AsyncSnapshot<List<ServicosModel>> snapshot){
          return snapshot == null || snapshot.data == null ? Center(
            child: CircularProgressIndicator(),
          ) : Container(
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                
              },
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _backgroundImage(),
            _logoEmpresa(),
            _servicos()
          ],
        ),
      ),
    );
  }
}