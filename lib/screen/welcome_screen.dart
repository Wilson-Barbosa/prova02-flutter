// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:wilson_diego_barbosa_p2/screen/imc_screen.dart';
import 'package:wilson_diego_barbosa_p2/screen/my_info_screen.dart';

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
          // Image.asset("assets/images/cat-01.png", fit: BoxFit.fill),
          Column(
            children: [
              SizedBox(height: 36),
              Text("Escolha uma das opções a baixo", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 36),
              Text("Clique aqui para acessar a calculadora:"),
              SizedBox(height: 16),
              ElevatedButton(onPressed: () => changeToImc(context), child: Text("Calculadora IMC")),
              SizedBox(height: 36),
              Text("Clique no botão abaixo para acessar a calculadora"),
              SizedBox(height: 16),
              ElevatedButton(onPressed: () => changeToInfo(context), child: Text("Meus dados")),
            ],
          )  
        ],
      ),
    );
  }

  changeToInfo(BuildContext context) {
    Navigator.push( context, MaterialPageRoute(builder: (context) => const MyInfoScreen()));
  }

  changeToImc(BuildContext context){
    Navigator.push( context, MaterialPageRoute(builder: (context) => const ImcScreen()));
  }

  
}