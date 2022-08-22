import 'package:exercicio/themes/theme.dart';
import 'package:exercicio/view/page/visualizar_empresa_view_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';

class EmpresaItemViewWidget extends GetView<HomeController> {
  @override
  Widget build(context) => Obx(() => ListView.builder(
      itemCount: controller.lista.length,
      itemBuilder: (context, index) {
        var obj = controller.lista[index];
        return Container(
          margin: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () =>
                Get.to(() => VisualizarEmpresaViewPage(), arguments: obj),
            child: Card(
              child: Column(children: [
                Image.network(obj.fotoEmpresa),
                Text(
                  obj.nome,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  obj.razaoSocial,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: ThemeApp.subText),
                ),
              ]),
            ),
          ),
        );
      }));
}
