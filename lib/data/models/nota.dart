// lib/data/models/nota.dart
class Nota {
  final String id;
  final String titulo;
  final String descripcion;

  Nota(this.id, this.titulo, this.descripcion);

  factory Nota.fromMap(Map<String, dynamic> map) {
    return Nota(
      map['id'] as String,
      map['titulo'] as String,
      map['descripcion'] as String,
    );
  }
}
