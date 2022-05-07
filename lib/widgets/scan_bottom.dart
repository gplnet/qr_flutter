// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr/providers/scan_list_provider.dart';
import 'package:qr/utils/utils.dart';

class ScanButtom extends StatelessWidget {
  const ScanButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        child: Icon(Icons.filter_center_focus),
        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#3D8BEF', 'Cancelar', false, ScanMode.QR);
          //String barcodeScanRes = 'https://cbermeo.com';
          //final barcodeScanRes = '-3.266784,-79.973928';
          if (barcodeScanRes == '-1') {
            return;
          }
          //print(barcodeScanRes);
          final scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);
          scanListProvider.nuevoScan(barcodeScanRes);
          //scanListProvider.nuevoScan('geo:15033,15.66');
          final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
          launchURL(context, nuevoScan);
        });
  }
}
