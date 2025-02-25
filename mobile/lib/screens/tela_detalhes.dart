import 'package:flutter/material.dart';
import '../models/item.dart';

class TelaDetalhes extends StatelessWidget {
  final Item item;

  TelaDetalhes({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.titulo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.titulo,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              item.descricao,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
