class ServicosModel{

  String servico;
  String valor;

  ServicosModel({this.servico, this.valor});

  Map<String, dynamic> toJson(){

    Map map = Map<String, dynamic>();

    map["Servico"] = servico;
    map["Valor"] = valor;

    return map;


  }

  static ServicosModel fromJson(Map<String, dynamic> json) => ServicosModel(
    servico: json['Servico'],
    valor: json['Valor']
  );


}