import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../controller/data_cancelcontroller.dart';
import '../repository/datacancel_repository.dart';

class ClientCancel_Mes extends StatefulWidget {
 final String mes;

  const ClientCancel_Mes(this.mes);
  @override
  State<ClientCancel_Mes> createState() => _ClientCancel_MesState(mes);
}

class _ClientCancel_MesState extends State<ClientCancel_Mes> {
  final controller = DataCancelController();
  final repository = DataCancelRepository();
  final String mes;

  _ClientCancel_MesState(this.mes);

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

  stateManagement(DataCancelState state) {
    switch (state) {
      case DataCancelState.start:
        return _start();

      case DataCancelState.loading:
        return _loading();

      case DataCancelState.sucess:
        return _sucess();

      case DataCancelState.error:
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
          CupertinoColors.destructiveRed));
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
      title: ChartTitle(text: 'Clientes Cancelados'),
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

  @override
  void initState() {
    controller.start(mes);

    super.initState();
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
  _ClassData(this.mes, this.qnt, this.cor);

  final String mes;
  final double qnt;
  final Color cor;
}
