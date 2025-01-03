import 'package:flutter/material.dart';



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
          const Align(
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
              )
            ),
          ),
        ],
      ),
    );
  }
}