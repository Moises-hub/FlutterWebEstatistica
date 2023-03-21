

import 'package:coliseuestatistica/classes/classificacao.dart';
import 'package:coliseuestatistica/repository/classificacao_repository.dart';
import 'package:flutter/material.dart';

class ClassificacaoController {
  List<Classificacao> lista=[];

  final repository = ClassificacaoRepository();

  final state = ValueNotifier<ClassificacaoState>(ClassificacaoState.start);



  Future start() async {
    state.value = ClassificacaoState.loading;
    try {
      lista = await repository.fetch();
    }catch (e) {
      state.value = ClassificacaoState.error;
    }
    state.value = ClassificacaoState.sucess;
  }

}
enum ClassificacaoState{start, loading, sucess,error}