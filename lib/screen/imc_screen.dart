// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wilson_diego_barbosa_p2/model/imc_calculator.dart';

class ImcScreen extends StatefulWidget {
  const ImcScreen({super.key});

  @override
  ImcState createState() => ImcState();
}

class ImcState extends State<ImcScreen> {

  final TextEditingController weight = TextEditingController();
  final TextEditingController height = TextEditingController();

  double? imc;
  String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela da Calculadora IMC", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue
      ),
      body:
        Container(
        margin: EdgeInsets.all(32),
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 241, 241, 241),
          border: Border.all(color: const Color.fromARGB(255, 110, 110, 110), width: 2),
          borderRadius: BorderRadius.circular(8), 
        ),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Digite o seu peso em Kg", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8), 
          TextField(controller: weight, decoration: InputDecoration(border: OutlineInputBorder())),
          SizedBox(height: 24), 
          Text("Digite a sua altura em metros", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8), 
          TextField(controller: height, decoration: InputDecoration( border: OutlineInputBorder())),
          SizedBox(height: 24),
          ElevatedButton(onPressed:calculateImcAndReturnMessage, child: Text("Calcular")),
          SizedBox(height: 36),
          if (imc != null && message != null) ...[
            Text("O valor do seu Imc: ${imc!.toStringAsFixed(2)}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Portanto a sua situaçõa é: $message", style: TextStyle(fontSize: 16)),
          ]
        ],
      ),
      )
    );
  }


  void calculateImcAndReturnMessage() {
    setState(() {
      ImcCalculator imcCalculator = ImcCalculator(weight: double.parse(weight.text), height: double.parse(height.text));

      imc = imcCalculator.calculateImc();
      message = imcCalculator.returnMessage();
    });

  }
  
}