class Client_MesCancel {
  String? mes;
  String? qnt;

  Client_MesCancel({this.mes, this.qnt});

  Client_MesCancel.fromJson(Map<String, dynamic> json) {
    mes = json['mes'];
    qnt = json['qnt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mes'] = this.mes;
    data['qnt'] = this.qnt;
    return data;
  }
}
