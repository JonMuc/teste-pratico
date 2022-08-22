import 'dart:convert';
import 'package:exercicio/model/empresa_model.dart';
import 'package:flutter/services.dart';

class EmpresaRepository {
  static const platform = MethodChannel("com.flutter.exercicio/getList");

  //'Consumindo' lista do kotlin
  Future<List<EmpresaModel>> obterEmpresas() async{
    String value = await platform.invokeMethod("ObterEmpresas");
    return (jsonDecode(value) as List)
        .map((obj) => EmpresaModel.fromJson(obj))
        .toList();
  }
}