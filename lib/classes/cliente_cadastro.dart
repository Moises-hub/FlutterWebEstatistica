class Cliente_Cadastro {
  String? regiao;
  String? nome;
  String? cadastro;

  Cliente_Cadastro({this.regiao, this.nome, this.cadastro});

  Cliente_Cadastro.fromJson(Map<String, dynamic> json) {
    regiao = json['regiao'];
    nome = json['nome'];
    cadastro = json['cadastro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['regiao'] = this.regiao;
    data['nome'] = this.nome;
    data['cadastro'] = this.cadastro;
    return data;
  }
}
