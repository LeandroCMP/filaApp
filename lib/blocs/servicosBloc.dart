import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fila_app_generic/models/servicosModel.dart';
import 'package:fila_app_generic/services/servicosServices.dart';
import 'package:rxdart/rxdart.dart';

class ServicosBloc extends BlocBase{

ServicosServices _servicosServices;

List<ServicosModel> _listaServicos = List<ServicosModel>();
var servicos = BehaviorSubject<List<ServicosModel>>();

buscaServicos() async{
  _listaServicos = await _servicosServices.getServicos();
  servicos.sink.add(_listaServicos);
}

ServicosBloc(){
  _servicosServices = ServicosServices();
  buscaServicos();
}

@override
void dispose(){
  servicos.close();
}
}