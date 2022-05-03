import 'package:flutter/material.dart';
import 'package:qr/pages/home_page.dart';
import 'package:qr/pages/mapa_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qr Reader',
      initialRoute: 'home',
      routes: {'home': (_) => HomeScreen(), 'mapa': (_) => MapaScreen()},
    );
  }
}
