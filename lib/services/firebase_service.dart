// lib/services/firebase_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getNotas() async {
    var notasSnapshot = await _firestore.collection('notas').get();
    return notasSnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  Future<void> agregarNota(Map<String, dynamic> data) async {
    await _firestore.collection('notas').add(data);
  }

  Future<void> eliminarNota(String notaId) async {
    await _firestore.collection('notas').doc(notaId).delete();
  }
}
