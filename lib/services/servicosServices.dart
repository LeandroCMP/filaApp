import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fila_app_generic/models/servicosModel.dart';

class ServicosServices{

  CollectionReference collection;

  ServicosServices(){
    collection = Firestore.instance.collection('Servicos');
  }

  Future<List<ServicosModel>> getServicos() async{
    try{
      var servicos = await collection.getDocuments();
       var servicosResult = servicos.documents.map((item) => 
       ServicosModel.fromJson(item.data)).toList();
       return servicosResult;
    } catch(e){
      print(e.toString());
      return null;
    }
  }

}