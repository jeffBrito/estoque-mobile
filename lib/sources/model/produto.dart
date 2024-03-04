class Produto {
  String idProduto;
  String nomeProduto;
  String precoProduto;
  String qtdProduto;
  String idModelo;
  String idFabricante;

  Produto({
    required this.idProduto,
    required this.nomeProduto,
    required this.precoProduto,
    required this.qtdProduto,
    required this.idModelo,
    required this.idFabricante,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      idProduto: json['id'].toString(),
      nomeProduto: json['nome'],
      precoProduto: json['preco'].toString(),
      qtdProduto: json['quantidade'].toString(),
      idModelo: json['idModelo'].toString(),
      idFabricante: json['idFabricante'].toString(),
    );
  }

  Map<dynamic, dynamic> toJson() => {
        'nome': nomeProduto,
        'preco': precoProduto,
        'quantidade': qtdProduto,
        'idModelo': idModelo,
        'idFabricante': idFabricante
      };
}
