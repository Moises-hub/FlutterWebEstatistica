class ListLogin {
  String? idFUNCIONARIO;
  String? nOME;
  String? sENHA;
  String? fOTO;

  ListLogin({this.idFUNCIONARIO, this.nOME, this.sENHA, this.fOTO});

  ListLogin.fromJson(Map<String, dynamic> json) {
    idFUNCIONARIO = json['id_FUNCIONARIO'];
    nOME = json['NOME'];
    sENHA = json['SENHA'];
    fOTO = json['FOTO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_FUNCIONARIO'] = this.idFUNCIONARIO;
    data['NOME'] = this.nOME;
    data['SENHA'] = this.sENHA;
    data['FOTO'] = this.fOTO;
    return data;
  }
}
