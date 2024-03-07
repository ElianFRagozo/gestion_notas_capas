// lib/presentation/pages/notas_page.dart
import 'package:flutter/material.dart';
import 'package:gestion_notas_capas/Presentation/pages/agregar_nota_pages.dart';
import 'package:gestion_notas_capas/business_logic/notas_manager.dart';


class NotasPage extends StatefulWidget {
  final NotasManager notasManager;

  NotasPage({required this.notasManager});

  @override
  _NotasPageState createState() => _NotasPageState();
}

class _NotasPageState extends State<NotasPage> {
  @override
  void initState() {
    super.initState();
    cargarNotas();
  }

  Future<void> cargarNotas() async {
    await widget.notasManager.cargarNotas();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.notasManager.notaSeleccionada?.titulo ?? 'Notas'),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Notas',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  for (var nota in widget.notasManager.notas)
                    ListTile(
                      title: Text(nota.titulo),
                      onTap: () {
                        widget.notasManager.seleccionarNota(nota);
                        Navigator.pop(context);
                      },
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          widget.notasManager.eliminarNota(nota.id);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    onPressed: () async {
                      final nota = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AgregarNotaPage()),
                      );
                      if (nota != null) {
                        await widget.notasManager.agregarNota(nota['titulo'], nota['descripcion']);
                      }
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: widget.notasManager.notaSeleccionada != null
          ? Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    widget.notasManager.notaSeleccionada!.titulo,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.notasManager.notaSeleccionada!.descripcion,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            )
          : Center(
              child: Text('Seleccione una nota desde el menú lateral'),
            ),
    );
  }
}
