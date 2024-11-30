import 'package:flutter/material.dart';

class MyInfoScreen extends StatelessWidget {

  const MyInfoScreen({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Calculadora Imc")),
        backgroundColor: Colors.blue
      ),
    );
  }




}