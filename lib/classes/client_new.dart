class Client_New {
  String? regiao;
  String? mes;
  String? mesatual;
  String? qnt;

  Client_New({this.regiao, this.mes, this.mesatual, this.qnt});

  Client_New.fromJson(Map<String, dynamic> json) {
    regiao = json['regiao'];
    mes = json['mes'];
    mesatual = json['mesatual'];
    qnt = json['qnt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['regiao'] = this.regiao;
    data['mes'] = this.mes;
    data['mesatual'] = this.mesatual;
    data['qnt'] = this.qnt;
    return data;
  }
}
