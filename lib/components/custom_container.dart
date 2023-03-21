

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String labelText;

  final String cabecalho;

  CustomContainer(this.labelText, this.cabecalho);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 50,
        ),
        Positioned(
          right: -1,
          left: 1,
          bottom: 0,

          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 30,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              border: Border.all(color: Colors.black26, width: 2.0),
            ),
            child: Text(labelText,
                style: const TextStyle(
                    color: CupertinoColors.black, fontSize: 10)),
          ),
        ),
        Positioned(
          left: 10,
          bottom: 20,
          child: Container(
              color: CupertinoColors.white,
              child: Text(
                cabecalho,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
              )),
        )
      ],
    );
  }
}

class CustomContainerRow extends StatelessWidget {
  String labelText;

  final String cabecalho;

  CustomContainerRow(this.labelText,  this.cabecalho);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 50,
        ),
        Positioned(
          right: -1,
          left: 0,
          bottom: 0,
          child: Container(
            width: 50,
            height: 35,
            padding: EdgeInsets.only(left: 5,top: 5,bottom: 2,right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              border: Border.all(color: Colors.black26, width: 2.0),
            ),
            child: DropdownButtonFormField(
              icon: const Icon(Icons.arrow_circle_down,color: Colors.blueAccent,size: 10,),
              dropdownColor: Colors.white,
              decoration: const InputDecoration(
                isDense: true,

                labelStyle: TextStyle(color: Colors.black),
                errorStyle: TextStyle(color: Colors.redAccent),
              ),
              onChanged: (String? novovalor) {
                labelText = novovalor!;
              },
              items: <String>['SIM', 'NÃO']
                  .map<DropdownMenuItem<String>>((String valor) {
                return DropdownMenuItem<String>(
                  value: valor,
                  child: Text(
                    valor,
                    style: const TextStyle(color: Colors.black,fontSize: 10),
                  ),
                );
              }).toList(),
              value: labelText,
            ),
          ),
        ),
        Positioned(
          left: 10,
          bottom: 25,
          child: Container(
              color: CupertinoColors.white,
              child: Text(
                cabecalho,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold,fontSize: 10),
              )),
        )
      ],
    );
  }
}