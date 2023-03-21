import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../controller/regions_controller.dart';

class Charts_Region extends StatefulWidget {

  @override
  State<Charts_Region> createState() => _Charts_RegionState();
}

class _Charts_RegionState extends State<Charts_Region> {
  final controller = RegionController();

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



  stateManagement(RegionControllerState state) {
    switch (state) {
      case RegionControllerState.start:
        return _start();

      case RegionControllerState.loading:
        return _loading();

      case RegionControllerState.sucess:
        return _sucess();

      case RegionControllerState.error:
        return _error();
      default:
        return _start();
    }
  }

  criarBarras() {
    List<_ClassData> listas = [];
    for (int i = 0; i < controller.lista.length; i++) {

      listas.add(_ClassData(controller.lista[i].regiao.toString(),
          double.parse(controller.lista[i].qnt.toString()),
          _cor(double.parse(controller.lista[i].qnt.toString()))));
    }

    return listas;
  }

  _sucess() {
    return
      SfCartesianChart(

      enableAxisAnimation: true,
       primaryXAxis: CategoryAxis(
           majorGridLines: const MajorGridLines(width: 0),
           labelIntersectAction: AxisLabelIntersectAction.wrap,
           crossesAt: -1,
          labelStyle: const TextStyle(fontSize: 10),
          // labelRotation: 90,


       placeLabelsNearAxisLine: false),
       plotAreaBorderWidth: 0,
       title: ChartTitle(text: 'Clientes Por Região'),
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
           xValueMapper: (_ClassData sales, _) => sales.regiao,
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
    controller.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller.state,
        builder: (context, child)
    {
      return stateManagement(controller.state.value);
    },
    );
  }
}
class _ClassData {
  _ClassData(this.regiao, this.qnt,this.cor);

  final String regiao;
  final double qnt;
  final Color  cor;
}


  _cor(double qtd) {
    if (qtd >= 200) {
      return CupertinoColors.activeBlue;
    } else {
      if (qtd < 200 && (qtd >= 100)) {
        return Colors.blueGrey;
      } else {
        if (qtd < 100 && qtd >= 50) {
          return CupertinoColors.systemIndigo;
        }
        else {
          if (qtd < 50 && qtd >= 15) {
            return Colors.green;
          }
          else {
            if (qtd < 15) {
              return Colors.brown;
            }
          }
        }
      }
    }
  }