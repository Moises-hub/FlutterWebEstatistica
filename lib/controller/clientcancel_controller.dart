import 'package:coliseuestatistica/repository/client_cancelrepository.dart';
import 'package:flutter/cupertino.dart';
import '../classes/client_monthcancel.dart';

class ClientCancel_Controller{
     List<Client_Cancel> lista =[];
     final repository = ClientCancel_Repository();
     final state = ValueNotifier<ClientCancelState>(ClientCancelState.start);

     Future start(String month) async {
       state.value = ClientCancelState.loading;
       try {
         lista = await repository.fetch(month);
       }catch (e) {
         state.value = ClientCancelState.error;
       }
       state.value = ClientCancelState.sucess;
     }



}
enum ClientCancelState{start, loading, sucess,error}