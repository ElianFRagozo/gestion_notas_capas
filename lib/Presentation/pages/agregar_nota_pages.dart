// lib/presentation/pages/agregar_nota_page.dart
import 'package:flutter/material.dart';

class AgregarNotaPage extends StatelessWidget {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Nota'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _tituloController,
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descripcionController,
              decoration: InputDecoration(
                labelText: 'Descripción',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'titulo': _tituloController.text,
                  'descripcion': _descripcionController.text,
                });
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
