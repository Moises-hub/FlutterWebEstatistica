class Client_Month {
  String? mes;
  String? qnt;
  String? mesatual;

  Client_Month({this.mes, this.qnt, this.mesatual});

  Client_Month.fromJson(Map<String, dynamic> json) {
    mes = json['mes'];
    qnt = json['qnt'];
    mesatual = json['mesatual'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mes'] = this.mes;
    data['qnt'] = this.qnt;
    data['mesatual'] = this.mesatual;
    return data;
  }
}
