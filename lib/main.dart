import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gestion_notas_capas/Presentation/pages/notas_pages.dart';
import 'package:gestion_notas_capas/business_logic/notas_manager.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GestionNotasApp(
    notasManager: NotasManager(),
  ));
}

class GestionNotasApp extends StatelessWidget {
  final NotasManager notasManager;

  GestionNotasApp({required this.notasManager});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Notas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: NotasPage(notasManager: notasManager),
    );
  }
}
