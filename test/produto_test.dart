// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:js';

import 'package:estoque_app/sources/api/produto_dao.dart';
import 'package:estoque_app/sources/model/produto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:estoque_app/main.dart';

void main() {
  var produto = ProdutoDao();

  test('Pegandos Dados da API REST', () async {
    var produto = Produto(
      idProduto: '48',
      nomeProduto: 'Teste atualizar',
      precoProduto: '45.95',
      qtdProduto: '95',
      idModelo: '4',
      idFabricante: '5',
    );
  });
}
