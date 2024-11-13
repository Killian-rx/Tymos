import 'package:flutter/material.dart';

class InscriptionPage extends StatelessWidget {
  const InscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
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
                'revisitez chez vous !',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18, 
                  color: Colors.black, 
                  fontWeight: FontWeight.normal, 
                ),
              ),
            )
          ),
          Container(
            width: 300,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 200),
              child: Container(
                height: 40, // Fixe la hauteur pour contrôler l'espace vertical
                decoration: BoxDecoration(
                  color: Colors.white, // Fond blanc
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.grey, // Bordure noire
                    width: 1,
                  ),
                ),
                child: const Center(
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: 'thibaud@gmail.com', // Texte indicatif
                        border: InputBorder.none,
                        isDense: true, // Réduit légèrement l'espace interne
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0), // Espace interne
                        hintStyle: TextStyle(
                            color: Colors.grey) // Pas de bordure interne
                        ),
                    style: TextStyle(
                        fontSize: 13, color: Colors.black), // Texte noir
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 300,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Container(
                height: 40, // Fixe la hauteur pour contrôler l'espace vertical
                decoration: BoxDecoration(
                  color: Colors.white, // Fond blanc
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.grey, // Bordure noire
                    width: 1,
                  ),
                ),
                child: const Center(
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: 'patrick@gmail.com', // Texte indicatif
                        border: InputBorder.none,
                        isDense: true, // Réduit légèrement l'espace interne
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0), // Espace interne
                        hintStyle: TextStyle(
                            color: Colors.grey) // Pas de bordure interne
                        ),
                    style: TextStyle(
                        fontSize: 13, color: Colors.black), // Texte noir
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
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
          Padding(
            padding: EdgeInsets.only(top: 250), // Décalage vers le bas
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Centre les éléments horizontalement
              children: [
                Container(
                  width: 120,   // Largeur de la première barre
                  height: 1,    // Hauteur de la barre
                  color: Colors.grey,  // Couleur grise
                ),
                SizedBox(width: 10), // Espace entre la première barre et le texte
                Text(
                  'or',
                  style: TextStyle(fontSize: 13, color: Colors.grey), // Style du texte "or"
                ),
                SizedBox(width: 10), // Espace entre le texte et la deuxième barre
                Container(
                  width: 120,   // Largeur de la deuxième barre
                  height: 1,    // Hauteur de la barre
                  color: Colors.grey,  // Couleur grise
                ),
              ],
            ),
          ),
          Container(
            width: 300,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 400),
              child: Container(
                height: 40, // Fixe la hauteur pour contrôler l'espace vertical
                decoration: BoxDecoration(
                  color: Colors.white, // Fond blanc
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.grey, // Bordure noire
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Se connecter avec Google',
                    style: TextStyle(
                      fontSize: 13, 
                      color: Colors.black, 
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 550),
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
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 700),
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
        ],
      ),
    );
  }
}
