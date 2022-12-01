import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteso_library_project/items/material_item.dart';
import 'package:iteso_library_project/pages/Search/bloc/data_fire_b_bloc.dart';
import 'package:iteso_library_project/pages/Search/search_page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  QRViewController? controller;
  Barcode? result;

  final qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    //implement reassemble
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          buildQRview(context),
          Positioned(bottom: 50, child: buildResult()),
        ],
      ),
    );
  }

  Widget buildQRview(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderRadius: 10,
            borderLength: 20,
            borderWidth: 10,
            borderColor: Theme.of(context).colorScheme.secondary,
            cutOutSize: MediaQuery.of(context).size.width * 0.80),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream
        .listen((barcode) => setState(() => this.result = barcode));

    controller.pauseCamera();
    controller.resumeCamera();
  }

  buildResult() {
    return Container(
        child: Column(
      children: [
        Text(
          result != null ? 'Resultado: ${result!.code}' : 'Scan a code!',
          maxLines: 3,
          style: TextStyle(color: Colors.white),
        ),
        Container(
          child: result != null
              ? ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<DataFireBBloc>(context)
                        .add(SearchEvent(strToSearch: result!.code));
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => SearchPage())));
                  },
                  child: Text("Buscar"))
              : SizedBox(
                  height: 10,
                ),
        )
      ],
    ));
  }
}
