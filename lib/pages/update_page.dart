import 'package:estoque_app/pages/home_page.dart';
import 'package:estoque_app/sources/api/produto_dao.dart';
import 'package:estoque_app/sources/model/produto.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  final int? idProduto;

  const UpdatePage({
    super.key,
    required this.idProduto,
  });

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  final TextEditingController qtdController = TextEditingController();
  final TextEditingController modeloController = TextEditingController();
  final TextEditingController fabricanteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var dados = ProdutoDao().buscarId(widget.idProduto);

    @override
    initState() {
      super.initState();
      setState(() {
        dados;
      });
    }

    return Scaffold(
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
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Atualização de Produto',
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
          child: Form(
            child: FutureBuilder(
              future: dados,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  nomeController.text = snapshot.data.nomeProduto;
                  precoController.text = snapshot.data.precoProduto;
                  qtdController.text = snapshot.data.qtdProduto;
                  modeloController.text = snapshot.data.idModelo;
                  fabricanteController.text = snapshot.data.idFabricante;

                  return Column(
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
                              idProduto: widget.idProduto.toString(),
                              nomeProduto: nomeController.text,
                              qtdProduto: qtdController.text,
                              precoProduto: precoController.text,
                              idModelo: modeloController.text,
                              idFabricante: fabricanteController.text,
                            );

                            ProdutoDao()
                                .atualizar(widget.idProduto, produto, context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                          ),
                          child: Text(
                            'Atualizar',
                            style: TextStyle(
                              color: Colors.brown[900],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}
