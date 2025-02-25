import 'package:flutter/material.dart';
import '../models/item.dart';

class TelaDetalhes extends StatefulWidget {
  final Item item;

  TelaDetalhes({required this.item});

  @override
  _TelaDetalhesState createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  String? novoTitulo;
  String? novaDescricao;

  @override
  void initState() {
    super.initState();
    // Inicializa as variáveis com o título e descrição originais
    novoTitulo = widget.item.titulo;
    novaDescricao = widget.item.descricao;
  }

  void _alterarTitulo() {
    setState(() {
      novoTitulo = "Título Alterado!";
    });
  }

  void _alterarDescricao() {
    setState(() {
      novaDescricao = "Descrição alterada pelo usuário.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(novoTitulo ?? widget.item.titulo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              novoTitulo ?? widget.item.titulo,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              novaDescricao ?? widget.item.descricao,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _alterarTitulo,
              child: Text("Alterar Título"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _alterarDescricao,
              child: Text("Alterar Descrição"),
            ),
          ],
        ),
      ),
    );
  }
}
