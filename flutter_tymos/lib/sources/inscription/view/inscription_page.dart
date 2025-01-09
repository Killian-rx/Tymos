import 'package:flutter/material.dart';
import 'dart:ui'; // Pour ImageFilter
import 'password_field.dart'; // Import du PasswordField
import '../../../database_helper.dart';
import '../view_models/inscription_view_model.dart';
import "../../../models/user.dart";
import '../../test/view/test.dart';

class InscriptionPage extends StatefulWidget {
  const InscriptionPage({super.key});

  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  final InscriptionViewModel _viewModel = InscriptionViewModel();

  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(email);
  }

  void _registerUser() async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();
    

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs.')),
      );
      return;
    }

    if (!_isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez entrer une adresse email valide.')),
      );
      return;
    }

    try {
      await _databaseHelper.addUser(email, password); // Appel à DatabaseHelper
      User? userToken= await _databaseHelper.findUserByEmail(email);
      // Naviguez vers la page suivante en passant le token
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TestPage(id: userToken?.id), // Transmettez le token
          ),
      );
      _emailController.clear();
      _passwordController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de l\'inscription : $e')),
      );
    }
  }
  void _handleGoogleSignIn() {
      _viewModel.registerWithGoogle(context);
    }

  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Opacity(
              opacity: 0.2,
              child: Transform.scale(
                scale: 1.5,
                child: Image.asset(
                  'assets/logocourt.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Container(color: Colors.black.withOpacity(0)),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: SizedBox(
                height: 50,
                child: Image.asset('assets/logo.png'),
              ),
            ),
          ),
          const Align(
            child: Padding(
              padding: EdgeInsets.only(bottom: 480),
              child: Text(
                'Revisitez chez vous !',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Votre adresse mail*',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.75,  // Largeur à 75% de la largeur de l'écran
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: MediaQuery.of(context).size.height * 0.048, // Hauteur relative à la hauteur de l'écran
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Adresse email', // Hint texte pour l'email
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: const TextStyle(fontSize: 13, color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Tapez votre mot de passe*',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              PasswordField(passwordController: _passwordController),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => _registerUser(),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF84CFEE), Color(0xFF9BCB8E), Color(0xFFFAEA78)],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 10),
                  child: const Text(
                    'Continuer',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 120, height: 1, color: Colors.grey),
                  const SizedBox(width: 10),
                  const Text('or', style: TextStyle(fontSize: 13, color: Colors.grey)),
                  const SizedBox(width: 10),
                  Container(width: 120, height: 1, color: Colors.grey),
                ],
              ),
              const SizedBox(height: 20),
              _buildSocialLoginButton('Se connecter avec Google', 'assets/chercher.png'),
              const SizedBox(height: 10),
              _buildSocialLoginButton('Se connecter avec Apple', 'assets/logo-apple.png'),
              const SizedBox(height: 10),
              _buildSocialLoginButton("Se connecter avec l'Email", 'assets/email.png'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLoginButton(String text, String iconPath) {
    return Container(
      width: 300,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 15, height: 15),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(fontSize: 13, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
