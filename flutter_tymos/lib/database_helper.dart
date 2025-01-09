import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';

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
    try {
      final querySnapshot = await _firestore.collection('users').get();
      return querySnapshot.docs.map((doc) {
        return User.fromMap(doc.data(), doc.id);
      }).toList();
    } catch (e) {
      throw Exception('Erreur lors de la récupération des utilisateurs : $e');
    }
  }

  // Trouver un utilisateur par email
  Future<User?> findUserByEmail(String email) async {
    try {
      final querySnapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final doc = querySnapshot.docs.first;
        return User.fromMap(doc.data(), doc.id);
      }
      return null; // Aucun utilisateur trouvé
    } catch (e) {
      throw Exception('Erreur lors de la recherche de l’utilisateur : $e');
    }
  }

  // Mettre à jour le mot de passe d'un utilisateur
  Future<void> updatePassword(String userId, String newPassword) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'password': newPassword,
        'updated_at': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('Erreur lors de la mise à jour du mot de passe : $e');
    }
  }
}
