import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/connexion_page.dart';
import 'pages/inscription_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Page d'accueil",
      initialRoute: '/',
      routes: {
        '/': (context) => const AccueilPage(),
        '/connexion': (context) => const ConnexionPage(),
        '/inscription': (context) => const InscriptionPage(),
      }
    );
  }
}





