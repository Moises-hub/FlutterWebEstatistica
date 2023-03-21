

import 'package:coliseuestatistica/repository/client_cancelrepository.dart';
import 'package:flutter/material.dart';

import '../controller/clientcancel_controller.dart';

class Table_ClientCancel extends StatefulWidget {
  final List lista;

  Table_ClientCancel(this.lista);

  @override
  State<Table_ClientCancel> createState() => _Table_ClientCancelState(lista);
}

class _Table_ClientCancelState extends State<Table_ClientCancel> {
  final List lista;

  _Table_ClientCancelState(this.lista);








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
                         style: const TextStyle(
                             color: Colors.white,
                             fontStyle: FontStyle.italic,
                             fontFamily: 'Arial',
                             fontSize: 10),
                       ))),
                   DataCell(Container(
                       width: 150,
                       child: Text(
                         lista[i].regiao.toString(),
                         textAlign: TextAlign.start,
                         style: const TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.normal,
                             fontFamily: 'Arial',
                             fontSize: 12),
                       ))),
                   DataCell(Container(
                       width: 100,
                       child: Text(
                        lista[i].qnt.toString(),
                         textAlign: TextAlign.start,
                         style: const TextStyle(
                             color: Colors.white,
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

                         children:const [
                           Spacer(),
                           Icon(

                             Icons.subdirectory_arrow_right,
                             textDirection: TextDirection.rtl,
                             size: 20,
                             color: Colors.red,
                             //   color: _cor(double.parse( controller.lista[i].qnt.toString())),
                           )]),
                   ),

                   DataCell(Container(
                       width: 170,
                       child: Text(
                         lista[i].regiao.toString(),
                         textAlign: TextAlign.start,
                         style: const TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.normal,
                             fontFamily: 'Arial',
                             fontSize: 12),
                       ))),
                   DataCell(Container(
                       width: 15,
                       child: Text(
                         lista[i].qnt.toString(),
                         textAlign: TextAlign.start,
                         style: const TextStyle(
                             color: Colors.white,
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




       @override
       void initState() {

         super.initState();
       }


       @override
  Widget build(BuildContext context) {
         return Container(
           height: MediaQuery
               .of(context)
               .size
               .height - 100,
           width: MediaQuery
               .of(context)
               .size
               .width,
           child: ListView(
             children: [
               const Text(
                 'Clientes Cancelados por Região',
                 style: TextStyle(
                   color: Colors.red,
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

