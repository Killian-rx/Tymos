import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InscriptionViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerUser(String email, String password, BuildContext context) async {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez remplir tous les champs.'),
        ),
      );
      return;
    }

    try {
      // Add user to Firestore
      await _firestore.collection('users').add({
        'email': email,
        'password': password,
        'created_at': DateTime.now().toIso8601String(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Inscription réussie !'),
        ),
      );

      // Optionally navigate to another page or clear the form
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur lors de l\'inscription : $e'),
        ),
      );
    }
  }
}
