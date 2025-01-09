import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:provider/provider.dart';
import '../view_models/auth_view_models.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Background Logo
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
          // Blur Effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Container(
              color: Colors.black.withOpacity(0),
            ),
          ),
          // Top Logo
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
          // Tagline Text
          const Align(
            alignment: Alignment(0, -0.6),
            child: Text(
              'qui rend vos désirs réalités !',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          // Google Sign-In Button
          Positioned(
            top: 300,
            child: _buildSignInButton(
              context,
              'Se connecter avec Google',
              'assets/chercher.png',
            ),
          ),
          // Apple Sign-In Button
          Positioned(
            top: 360,
            child: _buildSignInButton(
              context,
              'Se connecter avec Apple',
              'assets/logo-apple.png',
            ),
          ),
          // Divider with 'or'
          Positioned(
            top: 420,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 120, height: 1, color: Colors.grey),
                const SizedBox(width: 10),
                const Text(
                  'or',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(width: 10),
                Container(width: 120, height: 1, color: Colors.grey),
              ],
            ),
          ),
          // Form Section
          Positioned(
            top: 450,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Email Input Field
                  _buildInputField(
                    _emailController,
                    'arthurobraqueto@gmail.com',
                  ),
                  const SizedBox(height: 20),
                  // Password Input Field
                  _buildInputField(
                    _passwordController,
                    'Mot de passe',
                    isPassword: true,
                  ),
                ],
              ),
            ),
          ),
          // Continue Button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 120),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () async {
                      // Form Validation
                      if (_formKey.currentState?.validate() ?? false) {
                        try {
                          final success = await authViewModel.login(
                            _emailController.text,
                            _passwordController.text,
                          );
                          if (success) {
                            Navigator.pushReplacementNamed(context, '/home');
                          } else {
                            _showErrorSnackbar(
                              context,
                              authViewModel.errorMessage ?? 'Login failed',
                            );
                          }
                        } catch (e) {
                          _showErrorSnackbar(
                            context,
                            'Une erreur est survenue : $e',
                          );
                        }
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF84CFEE),
                            Color(0xFF9BCB8E),
                            Color(0xFFFAEA78),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120, vertical: 10),
                      child: const Text(
                        'Continuer',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  if (authViewModel.errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        authViewModel.errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
            ),
          ),
          // Registration Text
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/inscription');
                },
                child: RichText(
                  text: const TextSpan(
                    text: "Vous n'avez pas de compte ? ",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "S'inscrire",
                        style: TextStyle(
                          color: Color(0xFF84CFEE),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build Sign-In Buttons
  Widget _buildSignInButton(BuildContext context, String text, String iconPath) {
    return Container(
      width: 300,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey, width: 1),
      ),
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
    );
  }

  // Helper method to build Input Fields
  Widget _buildInputField(TextEditingController controller, String hintText,
      {bool isPassword = false}) {
    return Container(
      width: 300,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          style: const TextStyle(fontSize: 13, color: Colors.black),
        ),
      ),
    );
  }
  // Helper method to show error snackbar
  void _showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
