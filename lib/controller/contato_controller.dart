import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContatoController extends GetxController {
  final formKey = GlobalKey<FormState>();
  String nome = '';
  String email = '';
  String mensagem = '';


  //Simulando envio de formulario
  void submit() {
    final isValid = formKey.currentState!.validate();

    if (isValid) {
      showModalConfirmado().then((value) =>  {
        Get.back()
      });
    }
  }

  Future showModalConfirmado() async {
    return Get.defaultDialog(
        title: "Mensagem enviada com sucesso!",
        middleText: "A empresa entrará em contato com você nas próximas  horas",
        backgroundColor: Colors.green,
        titleStyle: const TextStyle(color: Colors.white),
        middleTextStyle: const TextStyle(color: Colors.white),
        radius: 30
    );
  }

  String? emailValidator(String value) {
    if (value.isEmpty || !value.contains('@')) {
      return 'Por favor insira um e-mail válido.';
    }
    return null;
  }

  String? nomeValidator(String value) {
    if (value.isEmpty || value.length < 4) {
      return 'O nome deve ter pelo menos 4 caracteres.';
    }
    return null;
  }

  String? mensagemValidator(String value) {
    if (value.isEmpty || value.length < 7) {
      return 'A mensagem deve ter pelo menos 7 caracteres.';
    }
    return null;
  }
}