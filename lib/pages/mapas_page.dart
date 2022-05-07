// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr/providers/scan_list_provider.dart';
import 'package:qr/widgets/scan_titles.dart';

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanTitles(tipo: 'http');
  }
}
