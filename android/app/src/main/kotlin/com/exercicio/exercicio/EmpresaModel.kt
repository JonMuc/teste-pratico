package com.exercicio.exercicio

class EmpresaModel {
    constructor(id: Int ,cnpj: String, endereco: String?, razaoSocial: String?, nome: String?, contato: String?, fotoEmpresa: String?, dataCriacao: String?) {
        this.id = id
        this.cnpj = cnpj
        this.endereco = endereco
        this.razaoSocial = razaoSocial
        this.nome = nome
        this.contato = contato
        this.fotoEmpresa = fotoEmpresa
        this.dataCriacao = dataCriacao
    }

    var id = 0
    var dataCriacao: String? = null
    var cnpj: String? = null
    var endereco: String? = null
    var razaoSocial: String? = null
    var nome: String? = null
    var contato: String? = null
    var fotoEmpresa: String? = null
}