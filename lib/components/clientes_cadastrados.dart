

import 'package:flutter/material.dart';

import '../controller/clientecad_controller.dart';

class Clientes_Cadastrados extends StatefulWidget {


  @override
  State<Clientes_Cadastrados> createState() => _Clientes_CadastradosState();
}

class _Clientes_CadastradosState extends State<Clientes_Cadastrados> {
  final controller = ClientCad_Controller();

  _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  _start() {
    return Container();
  }

  _error() {
    return Center(
      child: RaisedButton(
        onPressed: () {
          controller.start();
        },
        child: const Text('Tentar Novamente'),
      ),
    );
  }

  stateManagement(ClientCadState state) {
    switch (state) {
      case ClientCadState.start:
        return _start();

      case ClientCadState.loading:
        return _loading();

      case ClientCadState.sucess:
        return _sucess();

      case ClientCadState.error:
        return _error();
      default:
        return _start();
    }
  }

  _sucess() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
      Container(
        height: 20,
        child:Text('Ultimos Clientes Cadastrados',style: TextStyle(fontSize: 10,color: Colors.tealAccent)),
      ),
Expanded(child:
      ListView.builder(
        itemCount: controller.lista.length,
        itemBuilder: (context, index) {
          return
            Card(
            color: Colors.black,
            elevation: 1,
            shadowColor: Colors.tealAccent,
            child:
            ListTile(title: Text(controller.lista[index].nome.toString(),style: TextStyle(fontSize: 10),),
            subtitle: Text(controller.lista[index].regiao.toString(),style: TextStyle(fontSize: 10,color: Colors.white)),
            trailing: Text(controller.lista[index].cadastro.toString(),style: TextStyle(fontSize: 10)),
          ));
        }
    ))]
    );
  }


  @override
  void initState() {
    super.initState();
    controller.start();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.state,
      builder: (context, child) {
        return stateManagement(controller.state.value);
      },
    );
  }
}
