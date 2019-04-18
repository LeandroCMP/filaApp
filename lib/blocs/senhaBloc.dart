import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class SenhaAtualBloc extends BlocBase{

var senhaAtual = BehaviorSubject<dynamic>();

var getPassword = BehaviorSubject<dynamic>();

BehaviorSubject<bool> boolBtn = new BehaviorSubject<bool>.seeded(false);

void buscaSenhaAtual(){
  Firestore.instance.collection("Senhas").document("senhaAtual").snapshots().listen(
    (snapshot){
      if(snapshot.data["Senha"] != null){
        var resultadoConsulta = snapshot.data['Senha'];
        senhaAtual.sink.add(resultadoConsulta.toString());
      }
    }
  );
}

void getSenha() async{
  QuerySnapshot snapshot = await Firestore.instance.collection("filaSenha").getDocuments();
  int calc = snapshot.documents.length;
  print("TESTE GET $calc");
  var soma = calc + 1;
  print("TESTE SOMA $soma");
  Firestore.instance.collection("filaSenha").document().setData({"senhaFila":soma});
  getPassword.sink.add(soma);
  boolBtn.sink.add(true);
  boolBtn.stream.listen(print);
}

SenhaAtualBloc(){
  buscaSenhaAtual();
}

@override
void dispose(){
  senhaAtual.close();
  getPassword.close();
  boolBtn.close();
}

}