// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr/utils/utils.dart';

import '../providers/scan_list_provider.dart';

class ScanTitles extends StatelessWidget {
  final String tipo;

  const ScanTitles({required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);

    return ListView.builder(
      itemCount: scanListProvider.scans.length,
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .borrarPorId(scanListProvider.scans[i].id!);
        },
        child: ListTile(
          leading: Icon(
              this.tipo == 'http' ? Icons.home_outlined : Icons.map_outlined,
              color: Theme.of(context).primaryColor),
          title: Text(scanListProvider.scans[i].valor),
          subtitle: Text(scanListProvider.scans[i].id.toString()),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
          onTap: () => launchURL(context, (scanListProvider.scans[i])),
        ),
      ),
    );
  }
}
