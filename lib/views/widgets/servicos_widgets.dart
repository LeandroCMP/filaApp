import 'package:fila_app_generic/models/servicosModel.dart';
import 'package:flutter/material.dart';

class ServicosWidgets extends StatelessWidget {

  final List<ServicosModel> servicos;
  String servico;
  double valor;

  ServicosWidgets({this.servico, this.valor, this.servicos});
  @override
  Widget build(BuildContext context) {
    _loadServicos() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).size.height * 0.80)),
              child: Container(
                width: MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width * 0.20),
                height: MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).size.height * 0.80),
                child: Card(
                    color: Color.fromARGB(230, 255, 255, 255),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width -
                                    (MediaQuery.of(context).size.width * 0.90),
                              ),
                              Expanded(
                                  child: Text(
                                " ${servicos.map((item) => item.servico)}",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width -
                                            (MediaQuery.of(context).size.width *
                                                0.93),
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                              Container(
                                width: MediaQuery.of(context).size.width -
                                    (MediaQuery.of(context).size.width * 0.90),
                                height: 50,
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height -
                                (MediaQuery.of(context).size.height * 0.98),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "R\$${valor.toString()}",
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: MediaQuery.of(context).size.width -
                                      (MediaQuery.of(context).size.width *
                                          0.93),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
              ))
        ],
      );
    }

    _loadNull() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).size.height * 0.60)),
            child: Container(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height * 0.90),
              width: MediaQuery.of(context).size.width -
                  (MediaQuery.of(context).size.width * 0.80),
            ),
          )
        ],
      );
    }

    return servico == null ? _loadNull() : _loadServicos();
  }
}
