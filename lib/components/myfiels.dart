import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import '../controller/classificacao_controller.dart';

class Charts_Classificacao extends StatefulWidget {
  @override
  State<Charts_Classificacao> createState() => _Charts_Classificacao();
}

class _Charts_Classificacao extends State<Charts_Classificacao> {
  final controller = ClassificacaoController();
  var somar = 0.0;

  _loading() {
    return Center(child: CircularProgressIndicator());
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
        child: Text('Tentar Novamente'),
      ),
    );
  }

  stateManagement(ClassificacaoState state) {
    switch (state) {
      case ClassificacaoState.start:
        return _start();

      case ClassificacaoState.loading:
        return _loading();

      case ClassificacaoState.sucess:
        return _sucess();

      case ClassificacaoState.error:
        return _error();
      default:
        return _start();
    }
  }

  createChart() {
    List<PieChartSectionData> seriesList = [];
    for (int i = 0; i < controller.lista.length; i++) {
      seriesList.add(PieChartSectionData(
        color: _cor(controller.lista[i].status.toString()),
        value: double.parse(controller.lista[i].qnt.toString()),
        title: controller.lista[i].qnt.toString(),
        titleStyle: const TextStyle(fontSize: 10),
        radius: 25,
      ));
    }
    return seriesList.toList();
  }
/*
  criarBarras() {
    List<_ClassData> listas = [];
    for (int i = 0; i < controller.lista.length; i++) {
      listas.add(_ClassData(
          controller.lista[i].status.toString(),
          double.parse(controller.lista[i].qnt.toString()),
          _cor(controller.lista[i].status.toString())));
    }

    return listas;
  }*/


  soma(){
    somar = 0.0;
    for (int i = 0; i < controller.lista.length; i++) {
       somar += double.parse(controller.lista[i].qnt.toString());
    }

    }







  _sucess() {
    soma();
    return

        Column(
      children: [

        SizedBox(
          height:200,

          child:Stack(children:[
            PieChart(

            PieChartData(


                sectionsSpace: 0,
                centerSpaceRadius: 70,
                startDegreeOffset: -90,
                sections: createChart()),
          ),
           Positioned.fill(child:
           SizedBox(
             height: 50,
            child:
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
              const Text('Total de Clientes'),
              Text(somar.toString())
             ],
           )),
           )],)
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
         padding: const EdgeInsets.all(10),
          child:
          ListView.builder(
            itemCount: controller.lista.length,
            itemBuilder: (BuildContext ctx, index) =>

            Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),

                ),
                elevation: 2,
               shadowColor: Colors.white54,
                color: CupertinoColors.darkBackgroundGray,
                child:


                ListTile(
                  leading: Icon(_icone(controller.lista[index].status.toString()),color: _cor(controller.lista[index].status.toString())),
                  title: Text(
                    controller.lista[index].status.toString(),
                    style: const TextStyle(color: Colors.white54),
                  ),
                  trailing: Text(
                    controller.lista[index].qnt.toString(),
                    style: const TextStyle(color: Colors.white54),
                  ),
                ),),
          ),
        ),

      ],
    );

    /*  SfCircularChart(
          //title: ChartTitle(text: 'Clientes'),
          legend: Legend(isVisible: true),

          tooltipBehavior:
              TooltipBehavior(enable: true, canShowMarker: true, header: ''),
          series: <PieSeries<_ClassData, String>>[

            PieSeries<_ClassData, String>(

              explode: true,
              explodeIndex: 0,
              dataSource: criarBarras(),
              xValueMapper: (_ClassData sales, _) => sales.status,
              yValueMapper: (_ClassData sales, _) => sales.qnt,
              pointColorMapper: (_ClassData sales, _) => sales.cor,
              name: ' ', // Enable data label
            ),
          ],

    );*/
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


_cor(String state) {
  if (state == "ATIVOS") {
    return const Color.fromRGBO(68, 114, 200, 10);
  } else {
    if (state == "INATIVOS") {
      return const Color.fromRGBO(237, 125, 49, 10);
    } else {
      if (state == "CANCELADOS") {
        return Colors.amber;
      } else {
        if (state == "SERASA") {
          return const Color.fromRGBO(255, 0, 0, 70);
        }
      }
    }
  }
}

_icone(String state) {
  if (state == "ATIVOS") {
    return Icons.airplanemode_active;
  } else {
    if (state == "INATIVOS") {
      return Icons.airplanemode_inactive;
    } else {
      if (state == "CANCELADOS") {
        return Icons.cancel_presentation;
      } else {
        if (state == "SERASA") {
          return Icons.no_encryption_gmailerrorred_sharp;
        }
      }
    }
  }
}

/*
 SfCartesianChart(
      primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          labelIntersectAction: AxisLabelIntersectAction.wrap,
          crossesAt: -1,
          placeLabelsNearAxisLine: false),
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Clientes'),
      legend: Legend(isVisible: true),
      tooltipBehavior:
      TooltipBehavior(enable: true, canShowMarker: true, header: ''),
      series: <ChartSeries<_ClassData, String>>[
        ColumnSeries<_ClassData, String>(
          width: 0.5,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, labelAlignment: ChartDataLabelAlignment.top),
          animationDuration: 1000,
          dataSource: criarBarras(),
          xValueMapper: (_ClassData sales, _) => sales.status,
          yValueMapper: (_ClassData sales, _) => sales.qnt,
          pointColorMapper: (_ClassData sales, _) => sales.cor,
          name: ' ',
          // Enable data label
        ),
      ],


    );
  }










Expanded(
      flex: 0,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(9.0),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 180,
              childAspectRatio: 4 / 4,
              crossAxisSpacing: 5,
              mainAxisSpacing: 10),
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: CupertinoColors.secondaryLabel,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(' '+
                    lista[index].qnt.toString(),

                    style: const TextStyle(fontSize: 50),

                  ),
                  Spacer(),

                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.topLeft,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CupertinoColors.darkBackgroundGray,
                      ),
                      child: Row(children: [
                          CircleAvatar(
                          radius: 15,
                         // backgroundColor: _cor((lista[index].status.toString())),
                          child:Icon(
                          _icone(((lista[index].status.toString()))),
                          size: 20,
                         color:_cor((lista[index].status.toString())),
                        ),
                          ),

                      Text(lista[index].status.toString()),

                      ]),
                    ),
                  ),

                ],
              ),
            );
          }),
    );
  }

  _icone(String state){
    if(state=="ATIVOS") {
      return
        Icons.airplanemode_active;
    }else{

      if(state=="INATIVOS") {
        return
          Icons.airplanemode_inactive;
      }else{
        if(state=="CANCELADOS") {
          return
            Icons.cancel_presentation;
        }else{
          if(state=="SERASA") {
            return
              Icons.no_encryption_gmailerrorred_sharp;
          }

        }
      }
    }

  }



  _cor(String state){
     if(state=="ATIVOS") {
       return
           Colors.blue;
     }else{

     if(state=="INATIVOS") {
       return
         Colors.blueGrey;
     }else{
       if(state=="CANCELADOS") {
         return
           Colors.deepOrangeAccent;
       }else{
         if(state=="SERASA") {
           return
             Colors.red;
         }

         }
       }
     }

     }

  }


*/
