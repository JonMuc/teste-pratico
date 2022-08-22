package com.exercicio.exercicio

import android.content.Context
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import com.google.gson.Gson
import java.time.LocalDateTime
import java.time.Month

class MainActivity: FlutterActivity() {
    private val METHOD_CHANNEL_NAME = "com.flutter.exercicio/getList"

    private var methodChannel: MethodChannel? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        setupChannels(this,flutterEngine.dartExecutor.binaryMessenger)
    }

    private fun setupChannels(context:Context, messenger:BinaryMessenger){
        methodChannel = MethodChannel(messenger, METHOD_CHANNEL_NAME)
        methodChannel!!.setMethodCallHandler{
            call,result ->
            if (call.method == "ObterEmpresas") {
                val gson = Gson()
                val jsonTutsList: String = gson.toJson(list)
                result.success(jsonTutsList)
            } else {
                result.notImplemented()
            }
        }
    }

    //Lista de empresas staticas
    private val list = arrayOf(EmpresaModel(1,"11.111.111/1111-11","Rua das Cadeiras, N 111, Jockey, Rio de Janeiro RJ, 11111-111", "Produtos de Informática", "Gtechin Informática", "11 11111-1111", "https://i0.wp.com/gestaodesegurancaprivada.com.br/wp-content/uploads/empresa-02.jpg?w=720&ssl=1", LocalDateTime.of(2016, Month.APRIL, 15, 3, 15).toString()),
            EmpresaModel(2,"22.222.222/2222-22","Rua das Cadeiras, N 222, Jockey, Rio de Janeiro RJ, 22222-222", "Artigos para Trabalho", "Rei das Empresas", "22 22222-2222", "https://digipaper.com.br/wp-content/uploads/2019/01/2018_01_29B.jpg", LocalDateTime.of(2017, Month.DECEMBER, 10, 3, 15).toString()),
            EmpresaModel(3,"33.333.333/3333-33","Rua das Cadeiras, N 333, Jockey, Rio de Janeiro RJ, 33333-333", "Supermercado", "Kilão e Merc. Tem de Tudo", "33 33333-3333", "https://www.proteste.org.br/-/media/proteste/images/home/supermercados/guia-supermercados.png?rev=109582c2-a645-4989-bfb5-9df64272dc89", LocalDateTime.of(2013, Month.APRIL, 5, 3, 15).toString()),
            EmpresaModel(4,"44.444.444/4444-44","Rua das Cadeiras, N 444, Jockey, Rio de Janeiro RJ, 44444-444", "Chocolates e Doces", "Colibri Festas & Decoracoes", "44 44444-4444", "https://static7.depositphotos.com/1007298/710/i/450/depositphotos_7109827-stock-photo-various-chocolate-pralines.jpg", LocalDateTime.of(2015, Month.JANUARY, 25, 3, 15).toString()),
            EmpresaModel(5,"55.555.555/5555-55","Rua das Cadeiras, N 555, Jockey, Rio de Janeiro RJ, 55555-555", "Roupas e Atacados", "Gravataria Moda Masculina", "55 55555-5555", "https://cdn.shopify.com/s/files/1/0076/0994/2086/files/pexels-rachel-claire-5490975_600x600.jpg?v=1627671096", LocalDateTime.of(2012, Month.MARCH, 23, 3, 15).toString()),
            EmpresaModel(6,"66.666.666/6666-66","Rua das Cadeiras, N 666, Jockey, Rio de Janeiro RJ, 66666-666", "Cinema e Bomboniere", "Cine A Norte Sul", "66 66666-6666", "https://s.calendarr.com/upload/datas/sa/la/sala-de-cinema_c.jpg?auto_optimize=low&width=640", LocalDateTime.of(2022, Month.MAY, 11, 3, 15).toString()))
}
