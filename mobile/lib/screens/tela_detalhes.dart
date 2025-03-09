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
    novoTitulo = widget.item.titulo;
    novaDescricao = widget.item.descricao;
  }

  void _editarCampo(String campo, String valorAtual, Function(String) onSave) {
    TextEditingController controller = TextEditingController(text: valorAtual);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Editar $campo"),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Digite um novo $campo"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                onSave(controller.text);
                Navigator.pop(context);
              },
              child: Text("Salvar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(novoTitulo ?? widget.item.titulo),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => _editarCampo("Título", novoTitulo ?? widget.item.titulo, (novoValor) {
              setState(() {
                novoTitulo = novoValor;
              });
            }),
            tooltip: "Editar Título",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    novoTitulo ?? widget.item.titulo,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _editarCampo("Título", novoTitulo ?? widget.item.titulo, (novoValor) {
                    setState(() {
                      novoTitulo = novoValor;
                    });
                  }),
                  tooltip: "Editar Título",
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    novaDescricao ?? widget.item.descricao,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _editarCampo("Descrição", novaDescricao ?? widget.item.descricao, (novoValor) {
                    setState(() {
                      novaDescricao = novoValor;
                    });
                  }),
                  tooltip: "Editar Descrição",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}