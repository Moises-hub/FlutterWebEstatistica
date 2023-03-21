import 'package:flutter/material.dart';

import '../controller/client_softcontroller.dart';
import '../responsive.dart';

class Lista_Soft extends StatefulWidget {
  @override
  State<Lista_Soft> createState() => _Lista_SoftState();
}

class _Lista_SoftState extends State<Lista_Soft> {
  final controller = ClientSoftController();

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

  stateManagement(ClientSoftControllerState state) {
    switch (state) {
      case ClientSoftControllerState.start:
        return _start();

      case ClientSoftControllerState.loading:
        return _loading();

      case ClientSoftControllerState.sucess:
        return _sucess();

      case ClientSoftControllerState.error:
        return _error();
      default:
        return _start();
    }
  }

  _sucess() {
    if (Responsive.isDesktop(context)) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text('NF-e: ', style: const TextStyle(fontSize: 12)),
                  Text(
                    controller.lista[0].nFE.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
                Row(children: [
                  Text('NFC-e: ', style: const TextStyle(fontSize: 12)),
                  Text(
                    controller.lista[0].nFCE.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
                Row(children: [
                  Text('NFS-e: ', style: const TextStyle(fontSize: 12)),
                  Text(
                    controller.lista[0].nFSE.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
                Row(children: [
                  Text('SPED: ', style: const TextStyle(fontSize: 12)),
                  Text(
                    controller.lista[0].sPED.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text('Boleto B.: ', style: const TextStyle(fontSize: 12)),
                  Text(
                    controller.lista[0].bOLETOBANCARIO.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
                Row(children: [
                  Text('Folha P.: ', style: const TextStyle(fontSize: 12)),
                  Text(
                    controller.lista[0].fOLHADEPAGAMENTO.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
                Row(children: [
                  Text('Cobrança: ', style: const TextStyle(fontSize: 12)),
                  Text(
                    controller.lista[0].cOBRANCA.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
                Row(children: [
                  Text('Pontuação: ', style: const TextStyle(fontSize: 12)),
                  Text(
                    controller.lista[0].pONTUACAO.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text('Whats: ', style: const TextStyle(fontSize: 12)),
                  Text(
                    controller.lista[0].eNVIOORCWHATS.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
                Row(children: [
                  Text('Pix: ', style: const TextStyle(fontSize: 12)),
                  Text(
                    controller.lista[0].pIX.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
                Row(children: [
                  Text('Ordem de S.: ', style: const TextStyle(fontSize: 12)),
                  Text(
                    controller.lista[0].oS.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text('CT-e: ', style: const TextStyle(fontSize: 12)),
                  Text(
                    controller.lista[0].cTE.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
                Row(children: [
                  Text('MDF-e: ', style: const TextStyle(fontSize: 12)),
                  Text(
                    controller.lista[0].mDFE.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text('Sales.: ', style: const TextStyle(fontSize: 12)),
                  Text(
                    controller.lista[0].sALES.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
                Row(children: [
                  Text('Dash: ', style: const TextStyle(fontSize: 12)),
                  Text(
                    controller.lista[0].dASH.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
                Row(children: [
                  Text('Coletor: ', style: const TextStyle(fontSize: 12)),
                  Text(
                    controller.lista[0].cOLETOR.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
              ],
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Expanded(
            child: Row(children: [
              Text('NF-e: '),
              Text(
                controller.lista[0].nFE.toString(),
                style: const TextStyle(color: Colors.blue, fontSize: 12),
              ),
              const SizedBox(
                width: 5,
              ),
              Text('NFC-e: '),
              Text(
                controller.lista[0].nFCE.toString(),
                style: const TextStyle(color: Colors.blue, fontSize: 12),
              ),
              const SizedBox(
                width: 5,
              ),
              Text('NFS-e: '),
              Text(
                controller.lista[0].nFSE.toString(),
                style: const TextStyle(color: Colors.blue, fontSize: 12),
              ),
              const SizedBox(
                width: 5,
              ),
              Text('SPED: '),
              Text(
                controller.lista[0].sPED.toString(),
                style: const TextStyle(color: Colors.blue, fontSize: 12),
              )
            ]),
          ),
          Expanded(
            child: Row(
              children: [
                Row(children: [
                  Text('Boleto B.: '),
                  Text(
                    controller.lista[0].bOLETOBANCARIO.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
                Row(children: [
                  Text('Folha P.: '),
                  Text(
                    controller.lista[0].fOLHADEPAGAMENTO.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
                Row(children: [
                  Text('Cobrança: '),
                  Text(
                    controller.lista[0].cOBRANCA.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
                Row(children: [
                  Text('Pontuação: '),
                  Text(
                    controller.lista[0].pONTUACAO.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Row(children: [
                  Text('Whats: '),
                  Text(
                    controller.lista[0].eNVIOORCWHATS.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
                Row(children: [
                  Text('Pix: '),
                  Text(
                    controller.lista[0].pIX.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
                Row(children: [
                  Text('Ordem de S.: '),
                  Text(
                    controller.lista[0].oS.toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                  )
                ]),
              ],
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          Expanded(
            child: Row(
              children: [
                Text('CT-e: '),
                Text(
                  controller.lista[0].cTE.toString(),
                  style: const TextStyle(color: Colors.blue, fontSize: 12),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text('MDF-e: '),
                Text(
                  controller.lista[0].mDFE.toString(),
                  style: const TextStyle(color: Colors.blue, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          Expanded(
            child: Row(children: [
              Text('Sales.: '),
              Text(
                controller.lista[0].sALES.toString(),
                style: const TextStyle(color: Colors.blue, fontSize: 12),
              ),
              const SizedBox(
                width: 5,
              ),
              Text('Dash: '),
              Text(
                controller.lista[0].dASH.toString(),
                style: const TextStyle(color: Colors.blue, fontSize: 12),
              ),
              const SizedBox(
                width: 5,
              ),
              Text('Coletor: '),
              Text(
                controller.lista[0].cOLETOR.toString(),
                style: const TextStyle(color: Colors.blue, fontSize: 12),
              )
            ]),
          )
        ],
      );
    }
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
