// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Tela de opções")),
        backgroundColor: const Color.fromARGB(255, 2, 139, 9)
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/anime-cat.png", fit: BoxFit.fill),
          Column( children: [Text("Hello from ")], )
        ],
      ),
    );
  }
  
}