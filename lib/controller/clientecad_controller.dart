
import 'package:coliseuestatistica/classes/cliente_cadastro.dart';
import 'package:coliseuestatistica/repository/clieentecadastro_repositorio.dart';
import 'package:flutter/cupertino.dart';


class ClientCad_Controller{
  List<Cliente_Cadastro> lista =[];
  final repository = ClienteCad_Repository();
  final state = ValueNotifier<ClientCadState>(ClientCadState.start);

  Future start() async {
    state.value = ClientCadState.loading;
    try {
      lista = await repository.fetch();
    }catch (e) {
      state.value = ClientCadState.error;
    }
    state.value = ClientCadState.sucess;
  }



}
enum ClientCadState{start, loading, sucess,error}