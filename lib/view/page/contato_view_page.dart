import 'package:exercicio/controller/contato_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:exercicio/themes/theme.dart';

class ContatoViewPage extends GetView<ContatoController> {
  @override
  final ContatoController controller = Get.put(ContatoController());

  var spaceItens = const SizedBox(height: 20);
  var styleTextHeaderBtn =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contato",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: ThemeApp.appBarHeader,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Envie uma mensagem para empresa ${Get.arguments}",
                    style: styleTextHeaderBtn, textAlign: TextAlign.center),
                spaceItens,
                TextFormField(
                  validator: (value) {
                    return controller.nomeValidator(value!);
                  },
                  onSaved: (value) {
                    controller.nome = value!;
                  },
                  decoration: inputDecoration("Nome"),
                ),
                spaceItens,
                TextFormField(
                  validator: (value) {
                    return controller.emailValidator(value!);
                  },
                  onSaved: (value) {
                    controller.email = value!;
                  },
                  decoration: inputDecoration("Email"),
                ),
                spaceItens,
                TextFormField(
                  validator: (value) {
                    return controller.mensagemValidator(value!);
                  },
                  onSaved: (value) {
                    controller.mensagem = value!;
                  },
                  maxLines: 5,
                  decoration: inputDecoration("Mensagem"),
                ),
                spaceItens,
                Center(
                  child: SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      child: Text(
                        'Enviar',
                        style: styleTextHeaderBtn,
                      ),
                      onPressed: () => controller.submit(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ));

  InputDecoration inputDecoration(label) {
    return InputDecoration(
        alignLabelWithHint: true,
        border: const OutlineInputBorder(),
        labelText: label,
        filled: true);
  }
}
