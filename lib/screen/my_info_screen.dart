// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyInfoScreen extends StatelessWidget {

  const MyInfoScreen({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha informações", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 2, 139, 9)
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/anime-cat.png", fit: BoxFit.fill),
          Container(
            margin: EdgeInsets.all(96),
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 241, 241, 241),
            ),
            child: Column(
              children: [
                Text("Olá, meu nome é Wilson Barbosa\n\n"),
                Text(
                  "Sou aluno do 5° semestre de ADS na Fatec-Itu." +
                  "E este projeto foi desenvolvido para a disciplina de " +
                  "Tópicos Especiais de Informática, ministrada pelo professor Sérgio Salgado!"
                ) 
              ],
            ),
          ),
        ],
      ),
    );
  }




}