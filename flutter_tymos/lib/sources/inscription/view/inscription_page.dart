import 'package:flutter/material.dart';
import 'dart:ui'; 

class InscriptionPage extends StatelessWidget {
  const InscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align( // logo
            alignment: Alignment.center,
            child: Positioned(
              child: Opacity(
                opacity: 0.2,
                child: Transform.scale(
                  scale: 1.5, // Zoomer l'image (1 = taille normale, >1 = zoom)
                  child: Image.asset(
                    'assets/logocourt.png',
                    fit: BoxFit.cover,  // Maintient la couverture même après zoom
                  ),
                ),
              ),
            ), 
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Container(
              color: Colors.black.withOpacity(0), // Couleur transparente pour conserver le flou
            ),
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
          const Align(
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
            alignment: Alignment.centerLeft, // Aligne le texte à gauche
            padding: const EdgeInsets.only(left: 60), // Ajoute un espace de 20 pixels à gauche
            child: const Padding(
              padding: EdgeInsets.only(bottom: 320),
              child: Text(
                'Votre adresse mail*',
                style: TextStyle(
                  fontSize: 15, 
                  color: Colors.black, 
                ),
              ),
            )
          ),
          Container(
            width: 300, 
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 250),
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
                    decoration: InputDecoration(
                        hintText: 'arthurobraqueto@gmail.com', // Texte indicatif
                        border: InputBorder.none,
                        isDense: true, // Réduit légèrement l'espace interne
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 0), // Espace interne
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
            alignment: Alignment.centerLeft, // Aligne le texte à gauche
            padding: const EdgeInsets.only(left: 60), // Ajoute un espace de 20 pixels à gauche
            child: const Padding(
              padding: EdgeInsets.only(bottom: 130),
              child: Text(
                'Choisissez votre mot de passe*',
                style: TextStyle(
                  fontSize: 15, 
                  color: Colors.black, 
                ),
              ),
            )
          ),
          Container(
            width: 300,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60),
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
                    decoration: InputDecoration(
                        hintText: 'Mot de passe', // Texte indicatif
                        border: InputBorder.none,
                        isDense: true, // Réduit légèrement l'espace interne
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 0), // Espace interne
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
            padding: const EdgeInsets.only(top: 250), // Décalage vers le bas
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Centre les éléments horizontalement
              children: [
                Container(
                  width: 120,   // Largeur de la première barre
                  height: 1,    // Hauteur de la barre
                  color: Colors.grey,  // Couleur grise
                ),
                const SizedBox(width: 10), // Espace entre la première barre et le texte
                const Text(
                  'or',
                  style: TextStyle(fontSize: 13, color: Colors.grey), // Style du texte "or"
                ),
                const SizedBox(width: 10), // Espace entre le texte et la deuxième barre
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
                  child : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/chercher.png', width: 15, height: 15),
                      const SizedBox(width: 10),
                      const Text(
                        'Se connecter avec Google',
                        style: TextStyle(
                          fontSize: 13, 
                          color: Colors.black, 
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 300,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 550),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/logo-apple.png', width: 15, height: 15),
                      const SizedBox(width: 10),
                      const Text(
                        'Se connecter avec Apple',
                        style: TextStyle(
                          fontSize: 13, 
                          color: Colors.black, 
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 300,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 700),
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
                  child : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/email.png', width: 15, height: 15),
                      const SizedBox(width: 10),
                      const Text(
                        "Se connecter avec l'Email",
                        style: TextStyle(
                          fontSize: 13, 
                          color: Colors.black, 
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}