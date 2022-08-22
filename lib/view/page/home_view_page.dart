import 'package:exercicio/controller/home_controller.dart';
import 'package:exercicio/view/widgets/empresa_item_view_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:exercicio/themes/theme.dart';

class HomeViewPage extends GetView<HomeController> {
  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lojas do Shopping",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: ThemeApp.appBarHeader,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ThemeApp.corBase,
              ThemeApp.corMax,
            ],
          ),
        ),
        child: Container(
          padding: const EdgeInsets.only(bottom: 50),
          child: EmpresaItemViewWidget(),
        ),
      ),
      floatingActionButton: Container(
        color: Colors.white,
        child: TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Procure empresas',
          ),
          onChanged: (value) => controller.filtrarEmpresa(value),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked);
}
