import 'package:flutter/material.dart';
import 'sources/home/view/home_page.dart';
import 'sources/connexion/view/connexion_page.dart';
import 'sources/inscription/view/inscription_page.dart';

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





