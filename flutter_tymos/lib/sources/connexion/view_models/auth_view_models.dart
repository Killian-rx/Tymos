import 'package:flutter/material.dart';
import '../../../database_helper.dart';
import '../../../models/user.dart';


class AuthViewModel extends ChangeNotifier {
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<bool> login(String email, String password) async {
    try {
      // Récupérer tous les utilisateurs depuis la base de données
      final List<User> users = await _databaseHelper.getUsers();

      // Rechercher l'utilisateur correspondant
      final User? user = users.firstWhere(
        (u) => u.email == email && u.password == password,
        orElse: () => User(id: '', email: '', password: ''), // Utilisateur par défaut
      );

      if (user?.email != '') {
        // Connexion réussie
        _errorMessage = null;
        notifyListeners();
        return true;
      } else {
        // Échec de la connexion
        _errorMessage = "Email ou mot de passe incorrect";
        notifyListeners();
        return false;
      }
    } catch (e) {
      // Gestion des erreurs
      _errorMessage = "Une erreur est survenue. Réessayez.";
      notifyListeners();
      return false;
    }
  }

}
