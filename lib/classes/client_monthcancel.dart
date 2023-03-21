class Client_Cancel {
  String? regiao;
  String? mes;
  String? qnt;

  Client_Cancel({this.regiao, this.mes, this.qnt});

  Client_Cancel.fromJson(Map<String, dynamic> json) {
    regiao = json['regiao'];
    mes = json['mes'];
    qnt = json['qnt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['regiao'] = this.regiao;
    data['mes'] = this.mes;
    data['qnt'] = this.qnt;
    return data;
  }
}
