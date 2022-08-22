import 'package:exercicio/repository/empresa_repository.dart';
import 'package:get/get.dart';
import '../model/empresa_model.dart';

class HomeController extends GetxController {
  final empresaRepository = EmpresaRepository();

  RxList<EmpresaModel> lista = <EmpresaModel>[].obs;
  List<EmpresaModel> bsList = <EmpresaModel>[];

  @override
  void onInit() {
    obterEmpresas();
    super.onInit();
  }

  void obterEmpresas() async {
    bsList = await empresaRepository.obterEmpresas();
    lista.addAll(bsList);
  }

  void filtrarEmpresa(nome) async {
    lista.clear();
    lista.addAll(bsList.where((x) => x.nome.toLowerCase().contains(nome.toLowerCase()))
        .toList());
  }
}