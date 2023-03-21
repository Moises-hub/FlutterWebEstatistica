
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controller/data_controller.dart';

import '../repository/client_new.dart';


class ClientNew_Month extends StatefulWidget {
  final String mes;

  ClientNew_Month( this.mes);
  @override
  State<ClientNew_Month> createState() => _ClientNew_MonthState(mes);
}

class _ClientNew_MonthState extends State<ClientNew_Month> {
  final controller = DataController();
  final repository = CliNewRepository();
  final String mes;

  _ClientNew_MonthState(this.mes);

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
          controller.start(mes);
        },
        child: const Text('Tentar Novamente'),
      ),
    );
  }

  stateManagement(DataState state) {
    switch (state) {
      case DataState.start:
        return _start();

      case DataState.loading:
        return _loading();

      case DataState.sucess:
        return _sucess();

      case DataState.error:
        return _error();
      default:
        return _start();
    }
  }

  criarBarras() {
    List<_ClassData> listas = [];
    for (int i = 0; i < controller.lista.length; i++) {
      listas.add(_ClassData(
          controller.lista[i].mes.toString(),
          double.parse(controller.lista[i].qnt.toString()),
          _cor(controller.lista[i].mesatual.toString()),
          controller.lista[i].mesatual.toString()));
    }

    return listas;
  }

  _sucess() {

    return SfCartesianChart(
      enableAxisAnimation: true,
      primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          labelIntersectAction: AxisLabelIntersectAction.wrap,
          crossesAt: -1,
          labelStyle: const TextStyle(fontSize: 10),
          // labelRotation: 90,

          placeLabelsNearAxisLine: false),
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Novos Clientes'),
      legend: Legend(isVisible: true),
      tooltipBehavior:
      TooltipBehavior(enable: true, canShowMarker: true, header: ''),
      series: <ChartSeries<_ClassData, String>>[
        ColumnSeries<_ClassData, String>(

          width: 0.5,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, labelAlignment: ChartDataLabelAlignment.top),
          //  animationDuration: 1000,
          dataSource: criarBarras(),
          xValueMapper: (_ClassData sales, _) => sales.mes,
          yValueMapper: (_ClassData sales, _) => sales.qnt,
          pointColorMapper: (_ClassData sales, _) => sales.cor,

          name: ' ',
          // Enable data label
        ),
      ],
    );
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

  @override
  void initState() {
    controller.start(mes);

    super.initState();
  }

  @override
  void dispose() {
    setState(() {
      controller.start(mes);
      super.dispose();
    }
    );
    // animationController.dispose() instead of your controller.dispose
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

class _ClassData {
  _ClassData(this.mes, this.qnt, this.cor,this.mesatual);

  final String mes;
  final double qnt;
  final Color cor;
  final String mesatual;
}
