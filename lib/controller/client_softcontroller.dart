import 'package:coliseuestatistica/classes/client_soft.dart';
import 'package:flutter/material.dart';
import '../repository/client_softrepository.dart';

class ClientSoftController {
  List<Client_Soft> lista=[];

  final repository = ClientSofRepository();

  final state = ValueNotifier<ClientSoftControllerState>(ClientSoftControllerState.start);



  Future start() async {
    state.value = ClientSoftControllerState.loading;
    try {
      lista = await repository.fetch();
    }catch (e) {
      state.value = ClientSoftControllerState.error;
    }
    state.value = ClientSoftControllerState.sucess;
  }

}
enum ClientSoftControllerState{start, loading, sucess,error}