class Client_Region {
  String? regiao;
  String? qnt;

  Client_Region({this.regiao, this.qnt});

  Client_Region.fromJson(Map<String, dynamic> json) {
    regiao = json['regiao'];
    qnt = json['qnt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['regiao'] = this.regiao;
    data['qnt'] = this.qnt;
    return data;
  }
}
