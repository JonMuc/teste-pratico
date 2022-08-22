import 'package:exercicio/controller/contato_controller.dart';
import 'package:exercicio/view/page/contato_view_page.dart';
import 'package:exercicio/view/page/home_view_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/home_controller.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/home',
    getPages: [
      GetPage(name: '/home', page: () => HomeViewPage(), binding: SampleBind()),
      GetPage(name: '/contato', page: () => ContatoViewPage(), binding: SampleBind()),
    ],
  ));
}

class SampleBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ContatoController>(() => ContatoController());
  }
}
