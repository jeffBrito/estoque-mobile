import 'package:estoque_app/pages/home_page.dart';
import 'package:estoque_app/sources/api/produto_dao.dart';
import 'package:estoque_app/sources/model/produto.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  final TextEditingController qtdController = TextEditingController();
  final TextEditingController modeloController = TextEditingController();
  final TextEditingController fabricanteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 16,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Cadastro de Produto',
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
          child: Column(
            children: [
              TextFormField(
                controller: nomeController,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Nome do Produto',
                  contentPadding: EdgeInsets.all(14),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              TextFormField(
                controller: precoController,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Preço do Produto',
                  contentPadding: EdgeInsets.all(14),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              TextFormField(
                controller: qtdController,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Quantidade do Produto',
                  contentPadding: EdgeInsets.all(14),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              TextFormField(
                controller: modeloController,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Modelo',
                  contentPadding: EdgeInsets.all(14),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              TextFormField(
                controller: fabricanteController,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Fabricante',
                  contentPadding: EdgeInsets.all(14),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Produto produto = Produto(
                      idProduto: '',
                      nomeProduto: '',
                      qtdProduto: '',
                      precoProduto: '',
                      idModelo: '',
                      idFabricante: '',
                    );

                    produto.nomeProduto = nomeController.text;
                    produto.precoProduto = precoController.text;
                    produto.qtdProduto = qtdController.text;
                    produto.idModelo = modeloController.text;
                    produto.idFabricante = fabricanteController.text;

                    ProdutoDao().salvar(produto, context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  child: Text(
                    'Salvar',
                    style: TextStyle(
                      color: Colors.green[900],
                      fontSize: 15,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
