import 'package:coliseuestatistica/controller/classes_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Classes_Cli extends StatefulWidget {
  @override
  State<Classes_Cli> createState() => _Classes_CliState();
}

class _Classes_CliState extends State<Classes_Cli> {
  double somar = 0.0;

  final controller = ClassesController();
  int touchedIndex = 0;

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

  stateManagement(ClassesControllerState state) {
    switch (state) {
      case ClassesControllerState.start:
        return _start();

      case ClassesControllerState.loading:
        return _loading();

      case ClassesControllerState.sucess:
        return _sucess();

      case ClassesControllerState.error:
        return _error();
      default:
        return _start();
    }
  }

  soma() {
    somar = 0.0;
    for (int i = 0; i < controller.lista.length; i++) {
      somar += double.parse(controller.lista[i].qnt.toString());
    }
  }

  criarBarras() {
    soma();
    List<_ClasseData> listas = [];
    for (int i = 0; i < controller.lista.length; i++) {
      listas.add(_ClasseData(
          controller.lista[i].descricao.toString(),
          double.parse(controller.lista[i].qnt.toString()),
          _cor(int.parse(controller.lista[i].qnt.toString())),
          (double.parse(controller.lista[i].qnt.toString()) / somar) * 100));
    }

    return listas;
  }

  createGrid() {
    List<DataRow> columnList = [];
    for (int i = 0; i < controller.lista.length; i++) {
      columnList.add(DataRow(
        cells: <DataCell>[
          DataCell(
            SizedBox(
                width: (MediaQuery.of(context).size.width / 200) * 3,
                child: Icon(
                  Icons.label,
                  color: _cor(int.parse(controller.lista[i].qnt.toString())),
                )),
          ),
          DataCell(
            Container(
              width: (MediaQuery.of(context).size.width / 6) * 2,
              child: Text(controller.lista[i].descricao.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Arial',
                      fontSize: 12)),
            ),
          ),
          DataCell(Container(
              width: (MediaQuery.of(context).size.width / 20) * 3,
              child: Text(
                controller.lista[i].qnt.toString(),
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Arial',
                    fontSize: 12),
              ))),
        ],
      ));
    }
    return columnList.toList();
  }

  _sucess() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 700,
            child:  SfCartesianChart(
                enableAxisAnimation: true,
                isTransposed: true,
                primaryXAxis: CategoryAxis(
                    majorGridLines: const MajorGridLines(width: 0),
                    labelIntersectAction: AxisLabelIntersectAction.wrap,
                    crossesAt: -1,
                    isInversed: true,
                    labelStyle: const TextStyle(fontSize: 10),
                    // labelRotation: 90,

                    placeLabelsNearAxisLine: false),
                plotAreaBorderWidth: 0,
                title: ChartTitle(text: 'Clientes Por Classe'),
                legend: Legend(isVisible: true),
                tooltipBehavior: TooltipBehavior(
                  enable: true,
                  canShowMarker: true,
                  header: '',
                ),
                series: <ChartSeries<_ClasseData, String>>[
                  ColumnSeries<_ClasseData, String>(
                    width: 1,

                    dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                        labelAlignment: ChartDataLabelAlignment.top),
                    //  animationDuration: 1000,
                    spacing: 0.5,
                    dataSource: criarBarras(),
                    xValueMapper: (_ClasseData sales, _) => sales.descricao,
                    yValueMapper: (_ClasseData sales, _) => sales.percentual,
                    pointColorMapper: (_ClasseData sales, _) => sales.cor,
                    dataLabelMapper: (_ClasseData sales, _) =>
                        sales.percentual.toStringAsPrecision(4) + ' %',

                    name: ' ',
                    // Enable data label
                  ),
                ],
              ),
            ),

          Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(50),
              color: Colors.transparent,
              child:
              ListView(
                  controller: ScrollController(),
                  children: [
                    Center(
              child:
                DataTable(

                  columnSpacing: (MediaQuery.of(context).size.width / 50) * 0.5,

                  // Use the default value.

                  dataRowHeight: 25,
                  rows: createGrid(),
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
                    )])),
        ],
      ),
    );
  }

  @override
  void initState() {
    controller.start();
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

_cor(int r) {
  if (r > 100 && r + 100 > 255) {
    return const Color.fromRGBO(0, 91, 236, 10);
  } else {
    return Color.fromRGBO(0, 112, r + 100, 10);
  }
}

class _ClasseData {
  _ClasseData(this.descricao, this.qnt, this.cor, this.percentual);

  final String descricao;
  final double qnt;
  final Color cor;
  final double percentual;
}
