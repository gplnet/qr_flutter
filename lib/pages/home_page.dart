// ignore_for_file: prefer_const_constructors, prefer_const_declarations, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr/pages/direcciones_page.dart';
import 'package:qr/pages/mapas_page.dart';
import 'package:qr/providers/scan_list_provider.dart';
import 'package:qr/providers/ui_providers.dart';
import 'package:qr/widgets/custom_navigatorbar.dart';
import 'package:qr/widgets/scan_bottom.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              Provider.of<ScanListProvider>(context, listen: false)
                  .borrarTodos();
            },
          )
        ],
      ),
      body: _HomePAgeBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButtom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePAgeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Obtener el selected opt
    final uiProvider = Provider.of<UiProvider>(context);
    //Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    //usar el scanlistprovider

    final scanListProvider = Provider.of<ScanListProvider>(context,
        listen: false); //se agrega el listen false para que no se redibuje

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return MapasPage();
      case 1:
        scanListProvider.cargarScansPorTipo('http');
        return DireccionesPAge();
      default:
        return MapasPage();
    }
  }
}
