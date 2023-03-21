
class Classificacao {
  String? status;
  String? qnt;

  Classificacao({this.status, this.qnt});

  Classificacao.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    qnt = json['qnt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['qnt'] = this.qnt;
    return data;
  }
}