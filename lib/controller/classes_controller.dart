import 'package:coliseuestatistica/classes/clientes_classes.dart';
import 'package:coliseuestatistica/repository/classes_repository.dart';
import 'package:flutter/material.dart';

class ClassesController {
  List<Clientes_Classes> lista=[];

  final repository = ClassesRepository();

  final state = ValueNotifier<ClassesControllerState>(ClassesControllerState.start);



  Future start() async {
    state.value = ClassesControllerState.loading;
    try {
      lista = await repository.fetch();
    }catch (e) {
      state.value = ClassesControllerState.error;
    }
    state.value = ClassesControllerState.sucess;
  }

}
enum ClassesControllerState{start, loading, sucess,error}