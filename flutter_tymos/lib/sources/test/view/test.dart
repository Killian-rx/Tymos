import 'package:flutter/material.dart';


class TestPage extends StatelessWidget {
  
  final String? id;

  const TestPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Bienvenue, utilisateur avec l\'ID : $id'),
      ),
    );
  }
}