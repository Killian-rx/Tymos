import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/user.dart';

class DatabaseHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Ajouter un utilisateur dans Firestore
  Future<void> addUser(String email, String password) async {
    await _firestore.collection('users').add({
      'email': email,
      'password': password,
      'created_at': DateTime.now().toIso8601String(),
    });
  }

  // Récupérer la liste des utilisateurs depuis Firestore
  Future<List<User>> getUsers() async {
    final querySnapshot = await _firestore.collection('users').get();
    return querySnapshot.docs.map((doc) {
      return User.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }
}
