import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../controller/controller_clinew.dart';
import '../repository/client_new.dart';

class Tab_NewClients extends StatefulWidget {

  final List lista;

 Tab_NewClients(this.lista);
  @override
  State<Tab_NewClients> createState() => _Tab_NewClientsState(lista);
}

class _Tab_NewClientsState extends State<Tab_NewClients> {
 // final controller = ControllerCli_New();
 // final repository = CliNewRepository();
  final List lista;


  _Tab_NewClientsState(this.lista);

 /* _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  _start() {
    return Container();
  }

  _error() {
    return Center(
      child: RaisedButton(
        onPressed: () {
          controller.start(meses);
        },
        child: const Text('Tentar Novamente'),
      ),
    );
  }

  stateManagement(CliNewState state) {
    switch (state) {
      case CliNewState.start:
        return _start();

      case CliNewState.loading:
        return _loading();

      case CliNewState.sucess:
        return _sucess();

      case CliNewState.error:
        return _error();
      default:
        return _start();
    }
  }*/

  _gridClient() {
    String mes = "";

    List<DataRow> columnCell = [];

    for (int i = 0; i < lista.length; i++) {

      if (lista[i].mes.toString() != mes) {
        mes = lista[i].mes.toString();

        columnCell.add(
          DataRow(
            cells: <DataCell>[
              DataCell(Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.transparent,
                  width:60,
                  child: Text(
                    lista[i].mes.toString(),
                    textAlign: TextAlign.left,
                    style:  TextStyle(
                        color: _cor(lista[i].mesatual.toString()),
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Arial',
                        fontSize: 10),
                  ))),
              DataCell(Container(
                  width: 100,
                  child: Text(
                    lista[i].regiao.toString(),
                    textAlign: TextAlign.start,
                    style:  TextStyle(
                        color: _cor(lista[i].mesatual.toString()),
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                        fontSize: 10),
                  ))),
              DataCell(Container(
                  width: 50,
                  child: Text(
                    lista[i].qnt.toString(),
                    textAlign: TextAlign.start,
                    style:  TextStyle(
                        color: _cor(lista[i].mesatual.toString()),
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                        fontSize: 12),
                  ))),
            ],
          ),
        );
      } else {
        columnCell.add(
          DataRow(
            cells: <DataCell>[
               DataCell(


                    Row(

                     children:  [
                       const Spacer(),
                    Icon(

                      Icons.subdirectory_arrow_right,

                      size: 20,
                      color: _cor(lista[i].mesatual.toString()),
                      //   color: _cor(double.parse( controller.lista[i].qnt.toString())),
                    )]),
                ),

              DataCell(Container(
                  width: 100,
                  child: Text(
                    lista[i].regiao.toString(),
                    textAlign: TextAlign.start,
                    style:  TextStyle(
                        color: _cor(lista[i].mesatual.toString()),
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                        fontSize: 10),
                  ))),
              DataCell(Container(
                  width: 10,
                  child: Text(
                    lista[i].qnt.toString(),
                    textAlign: TextAlign.start,
                    style:  TextStyle(
                        color: _cor(lista[i].mesatual.toString()),
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                        fontSize: 12),
                  ))),
            ],
          ),
        );
      }
    }

    return columnCell;
  }

  _cor(String m) {
    if (m == 'JAN') {
      return Colors.blue;
    }
    else {
      if (m == 'FEV') {
        return Colors.green;
      }
      else {
        if (m == 'MAR') {
          return Colors.yellow;
        }
        else {
          if (m == 'ABR') {
            return Colors.lightBlueAccent;
          }
          else {
            if (m == 'MAI') {
              return Colors.deepPurple;
            }
            else {
              if (m == 'JUN') {
                return Colors.deepOrangeAccent;
              }
              else {
                if (m == 'JUL') {
                  return Colors.lightGreenAccent;
                }
                else {
                  if (m == 'AGO') {
                    return Colors.deepOrange;
                  }
                  else {
                    if (m == 'SET') {
                      return Colors.purpleAccent;
                    }
                    else {
                      if (m == 'OUT') {
                        return Colors.tealAccent;
                      }
                      else {
                        if (m == 'NOV') {
                          return Colors.blueGrey;
                        }
                        else {
                          if (m == 'DEZ') {
                            return Colors.orange;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

  }

  _sucess() {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          const Text(
            'Novos Clientes por Região',
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.normal,
                fontFamily: 'Arial',
                fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
          DataTable(
            // Use the default value.

            dataRowHeight: 25,
            rows: _gridClient(),
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  ' ',
                ),
              ),
              DataColumn(
                label: Text(
                  'Classificacao',
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Arial',
                       fontSize: 15),
                ),
              ),
              DataColumn(
                label: Text(
                  'Quantidade',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 15,
                      fontFamily: 'Arial'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          const Text(
            'Novos Clientes por Região',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.normal,
              fontFamily: 'Arial',
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
          DataTable(
            // Use the default value.

            dataRowHeight: 20,
            rows: _gridClient(),
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  ' ',
                ),
              ),
              DataColumn(
                label: Text(
                  'Classificacao',
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Arial'),
                ),
              ),
              DataColumn(
                label: Text(
                  'Quantidade',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Arial'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
