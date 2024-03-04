import 'dart:async';
import 'dart:convert';

import 'package:estoque_app/config/env.dart';
import 'package:estoque_app/pages/add_page.dart';
import 'package:estoque_app/pages/update_page.dart';
import 'package:estoque_app/sources/api/produto_dao.dart';
import 'package:estoque_app/sources/model/produto.dart';
import 'package:estoque_app/sources/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Produto>> produtoDao = ProdutoDao().todosProdutos();

  @override
  InitState() {
    super.initState();
    setState(() {
      produtoDao = ProdutoDao().todosProdutos();
    });
  }

  Future<void> _refresh() async {
    Future<List<Produto>> novaLista = await Future.delayed(
        Duration(seconds: 2), () => ProdutoDao().todosProdutos());

    setState(() {
      produtoDao = novaLista;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size mySize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Estoque de Produtos - Crud',
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
          ),
        ),
        backgroundColor: Colors.pink,
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder<List<Produto>>(
          future: produtoDao,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Text('Erro ao carregar dados');
            } else {
              return SizedBox(
                width: double.infinity,
                height: mySize.height * 0.75,
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final post = snapshot.data![index];
                    return ListTile(
                      title: Text(post.nomeProduto!),
                      subtitle: Text(post.precoProduto!),
                      trailing: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdatePage(
                                idProduto: int.parse(post.idProduto),
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.amber,
                        ),
                        child: const Icon(
                          Icons.edit,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                      leading: Icon(
                        Icons.category,
                        color: Colors.grey[400],
                      ),
                    );
                  },
                ),
              );
            }
            // By default, show a loading spinner.
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AddPage(),
            ),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
