import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr/pages/home_page.dart';
import 'package:qr/pages/mapa_page.dart';
import 'package:qr/providers/scan_list_provider.dart';
import 'package:qr/providers/ui_providers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Qr Reader',
        initialRoute: 'home',
        routes: {'home': (_) => HomeScreen(), 'mapa': (_) => MapaPage()},
        theme: ThemeData(
            primaryColor: Colors.deepPurple,
            // ignore: prefer_const_constructors
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepPurple)),
      ),
    );
  }
}
