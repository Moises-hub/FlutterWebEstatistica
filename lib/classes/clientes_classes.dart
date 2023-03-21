class Clientes_Classes {
  String? descricao;
  String? qnt;

  Clientes_Classes({this.descricao, this.qnt});

  Clientes_Classes.fromJson(Map<String, dynamic> json) {
    descricao = json['descricao'];
    qnt = json['qnt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descricao'] = this.descricao;
    data['qnt'] = this.qnt;
    return data;
  }
}
