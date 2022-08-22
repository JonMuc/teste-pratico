import 'package:exercicio/themes/theme.dart';
import 'package:exercicio/view/page/contato_view_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VisualizarEmpresaViewPage extends GetView {
  final formatHora = DateFormat('dd/MM/yyyy');

  var spaceItens = const SizedBox(height: 10);
  var styleHeaders = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  var styleTitulos = const TextStyle(fontSize: 17, fontWeight: FontWeight.w500);
  var styleInformacao = const TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: ThemeApp.subText);

  @override
  Widget build(context) => Scaffold(
        appBar: AppBar(
            title: Text("Detalhe loja", style: styleHeaders),
            backgroundColor: ThemeApp.appBarHeader),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(children: [
              Image.network(Get.arguments.fotoEmpresa),
              spaceItens,
              Text(
                Get.arguments.nome,
                style: styleHeaders,
              ),
              spaceItens,
              Row(
                children: [
                  Text("Razão Social: ", style: styleTitulos),
                  Text(
                    Get.arguments.razaoSocial,
                    style: styleInformacao,
                  )
                ],
              ),
              spaceItens,
              Row(
                children: [
                  Text("Contato: ", style: styleTitulos),
                  Text(Get.arguments.contato, style: styleInformacao)
                ],
              ),
              spaceItens,
              Row(
                children: [
                  Text("Endereço: ", style: styleTitulos),
                  Flexible(
                      child: Text(
                    Get.arguments.endereco,
                    style: styleInformacao,
                  )),
                ],
              ),
              spaceItens,
              Row(
                children: [
                  Text("CNPJ: ", style: styleTitulos),
                  Text(Get.arguments.cnpj, style: styleInformacao)
                ],
              ),
              spaceItens,
              Row(
                children: [
                  Text("Data de Criação: ", style: styleTitulos),
                  Text(formatHora.format(Get.arguments.dataCriacao),
                      style: styleInformacao)
                ],
              ),
              spaceItens,
              ElevatedButton(
                child: Text('Entrar em contato'),
                onPressed: () => Get.to(() => ContatoViewPage(),
                    arguments: Get.arguments.nome),
              )
            ]),
          ),
        ),
      );
}
