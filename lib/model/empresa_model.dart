class EmpresaModel {
  late int id;
  late DateTime dataCriacao;
  late String cnpj;
  late String endereco;
  late String razaoSocial;
  late String nome;
  late String contato;
  late String fotoEmpresa;

  EmpresaModel({required this.id,required this.dataCriacao,required this.cnpj,required this.endereco,required this.razaoSocial,
  required this.nome, required this.fotoEmpresa, required this.contato});

  EmpresaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dataCriacao = DateTime.parse(json['dataCriacao']);
    cnpj = json['cnpj'];
    endereco = json['endereco'];
    razaoSocial = json['razaoSocial'];
    nome = json['nome'];
    contato = json['contato'];
    fotoEmpresa = json['fotoEmpresa'];
  }
}