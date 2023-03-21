
import 'package:coliseuestatistica/classes/client_new.dart';
import 'package:flutter/material.dart';

import '../repository/client_new.dart';

class ControllerCli_New {
  List<Client_New> lista=[];

  final repository =  CliNewRepository();

  final state = ValueNotifier<CliNewState>(CliNewState.start);



  Future start(String month) async {
    state.value = CliNewState.loading;
    try {
      lista = await repository.fetch(month);
    }catch (e) {
      state.value = CliNewState.error;
    }
    state.value = CliNewState.sucess;
  }

}
enum CliNewState{start, loading, sucess,error}