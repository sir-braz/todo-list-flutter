import 'package:flutter/material.dart';
import '../models/item.dart';
import 'tela_detalhes.dart';

class TelaInicial extends StatelessWidget {
  final List<Item> itens = [
    Item("Item 1", "Descrição do item 1"),
    Item("Item 2", "Descrição do item 2"),
    Item("Item 3", "Descrição do item 3"),
    Item("Item 4", "Descrição do item 4"),
    Item("Item 5", "Descrição do item 5"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Itens'),
      ),
      body: ListView.builder(
        itemCount: itens.length,
        itemBuilder: (context, index) {
          final item = itens[index];
          return ListTile(
            title: Text(item.titulo),
            subtitle: Text(item.descricao),
            onTap: () {
              // Navegação para a Tela de Detalhes
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaDetalhes(item: item),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
