import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      home: const AccueilPage(), // Définit comme page d'accueil
    );
  }
}

class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          Align( // Logo
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: SizedBox(
                height: 80,
                child: Image.asset('assets/logo.png'),
              ),
            ),
          ),
          Align( // logo
            alignment: Alignment.center,
            child: Positioned(
              child: Opacity(
                opacity: 0.2,
                child: SizedBox(
                  height: 400,
                  child: Image.asset('assets/logocourt.png'),
                )
              ),
            ), 
          ),
          const Align( // Texte de présentation
            child: Padding(
              padding: EdgeInsets.only(bottom: 360),
              child: Text(
                'Tymos, l’application ynnovante qui\nchange',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30, 
                  color: Colors.black, 
                  fontWeight: FontWeight.bold, 
                ),
              ),
            )
          ),
          Align( // Bouton de connexion
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: GestureDetector(
                onTap: () {
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF84CFEE), 
                        Color(0xFF9BCB8E), 
                        Color(0xFFFAEA78),
                      ], // Dégradé de couleur
                    ),
                    borderRadius: BorderRadius.circular(30), 
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 10), 
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 15, 
                      color: Colors.white, 
                    ),
                  ),
                )
              )
            )
          ),
          Align( // Texte de connexion
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ConnexionPage()),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    text: 'Déjà un compte ? ',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black, 
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Connectez-vous', 
                        style: TextStyle(
                          color: Color(0xFF84CFEE),
                          fontWeight: FontWeight.bold, 
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}



class ConnexionPage extends StatelessWidget {
  const ConnexionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          Align( // Logo
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: SizedBox(
                height: 50,
                child: Image.asset('assets/logo.png'),
              ),
            ),
          ),
          Align(
            child: Padding(
            padding: EdgeInsets.only(bottom: 480),
              child: Text(
                'qui rend vos désirs réalités !',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18, 
                  color: Colors.black, 
                  fontWeight: FontWeight.normal, 
                ),
              ),
            )
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 600),
              child: GestureDetector(
                onTap: () {
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
                  padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 10), 
                  child: const Text(
                    'Continuer',
                    style: TextStyle(
                      fontSize: 15, 
                      color: Colors.white, 
                    ),
                  ),
                )
              )
            )
          ),
            Align( // Texte de connexion
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const InscriptionPage()),
                  );
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
              )
            ),
          ),
        ],
      ),
    );
  }
}




class InscriptionPage extends StatelessWidget {
  const InscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
      )
    );
  }
}




