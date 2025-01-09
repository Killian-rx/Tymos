import 'package:flutter/material.dart';


class TestPage extends StatelessWidget {
  
  final String? id;

  const TestPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Bienvenue, utilisateur avec l\'ID : $id'),
      ),
    );
  }
}