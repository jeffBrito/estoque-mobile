import 'dart:convert';

import 'package:estoque_app/config/env.dart';
import 'package:estoque_app/config/snack_bar_utils.dart';
import 'package:estoque_app/sources/model/produto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProdutoDao {
  late String msg = "";

  Future salvar(Produto produto, BuildContext context) async {
    try {
      final url = Uri.http("${Env.URL_PREFIX}", "/api/v1/produto/salvar");
      final response = await http.post(
        url,
        body: jsonEncode(produto.toJson()),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 201) {
        SnackBarUtils()
            .success('Produto Salvo Com Sucesso', Icons.check, context);
      } else {
        SnackBarUtils()
            .error("Error ao processador os dados", Icons.warning, context);
      }
    } catch (e) {
      SnackBarUtils().error(e.toString(), Icons.warning, context);
      print(e);
    }
  }

  Future<List<Produto>> todosProdutos() async {
    final url = Uri.http("${Env.URL_PREFIX}", "/api/v1/produto/");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body) as List<dynamic>;

      return json.map((e) => Produto.fromJson(e)).toList();
    } else {
      throw Exception("Erro ao carregar o produto");
    }
  }

  Future buscarId(var id) async {
    try {
      int idCorreto = id as int;
      final url = Uri.http("${Env.URL_PREFIX}", "/api/v1/produto/${idCorreto}");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return Produto.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Error ao carregar dados');
      }
    } catch (e) {
      print(e);
    }
  }

  Future atualizar(var id, Produto produto, BuildContext context) async {
    try {
      final url =
          Uri.http("${Env.URL_PREFIX}", "/api/v1/produto/atualizar/${id}");
      final response = await http.put(
        url,
        body: jsonEncode(produto.toJson()),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 202) {
        SnackBarUtils()
            .success('Produto atualizado Com Sucesso', Icons.check, context);
      } else {
        SnackBarUtils()
            .error("Error ao processador os dados", Icons.warning, context);
      }
    } catch (e) {
      SnackBarUtils().error(e.toString(), Icons.warning, context);
    }
  }
}
