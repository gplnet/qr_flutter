// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:qr/widgets/scan_titles.dart';

class DireccionesPAge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanTitles(tipo: 'geo');
  }
}
