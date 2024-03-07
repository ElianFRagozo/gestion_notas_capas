// lib/data/repositories/notas_repository.dart

import 'package:gestion_notas_capas/data/models/nota.dart';
import 'package:gestion_notas_capas/services/firebase_service.dart';

class NotasRepository {
  final FirebaseService _firebaseService = FirebaseService();

  Future<List<Nota>> getNotas() async {
    var notasData = await _firebaseService.getNotas();
    return notasData.map((data) => Nota.fromMap(data)).toList();
  }

  Future<void> agregarNota(Nota nota) async {
    await _firebaseService.agregarNota({
      'titulo': nota.titulo,
      'descripcion': nota.descripcion,
    });
  }

  Future<void> eliminarNota(String notaId) async {
    await _firebaseService.eliminarNota(notaId);
  }
}
