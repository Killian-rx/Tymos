import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'sources/home/view/home_page.dart';
import 'sources/connexion/view_models/auth_view_models.dart';
import 'sources/connexion/view/connexion_page.dart';
import 'sources/inscription/view/inscription_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Initialisation des widgets
  await Firebase.initializeApp(); // Initialisation de Firebase
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Page d'accueil",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/connexion': (context) => const ConnexionPage(),
        '/inscription': (context) => const InscriptionPage(),
      },
    );
  }
}
