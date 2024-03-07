// lib/business_logic/notas_manager.dart

import 'package:gestion_notas_capas/data/models/nota.dart';
import 'package:gestion_notas_capas/data/repositories/notas_repository.dart';

class NotasManager {
  final NotasRepository _notasRepository = NotasRepository();
  List<Nota> _notas = [];
  Nota? _notaSeleccionada;

  List<Nota> get notas => _notas;
  Nota? get notaSeleccionada => _notaSeleccionada;

  Future<void> cargarNotas() async {
    _notas = await _notasRepository.getNotas();
  }

  Future<void> agregarNota(String titulo, String descripcion) async {
    var nuevaNota = Nota('', titulo, descripcion);
    await _notasRepository.agregarNota(nuevaNota);
    await cargarNotas();
  }

  Future<void> eliminarNota(String notaId) async {
    await _notasRepository.eliminarNota(notaId);
    await cargarNotas();
  }

  void seleccionarNota(Nota nota) {
    _notaSeleccionada = nota;
  }
}
