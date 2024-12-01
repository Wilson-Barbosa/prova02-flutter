// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wilson_diego_barbosa_p2/screen/welcome_screen.dart';

class LoginScreen extends StatefulWidget {
    
    // constructor que será chamado dentro do do atribbuto home da classe main.dart
    const LoginScreen({super.key}); 

  @override
  LoginState createState() => LoginState();
}

// Classe que controla o estado do form
class LoginState extends State<LoginScreen> {

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  // Mensagens de errro que podem ser mostradas
  String? passwordErrorMessage;
  String? emailErrorMessage;

  // Atributos que controlam a validade ou invaliadade do formulário
  bool isEmailValid = false;
  bool isPassValid = false;

  // Cria a o formulário de login
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text("Tela de Login")),
          backgroundColor: Colors.blue
          ),
      body: 
        Container(
        margin: EdgeInsets.all(32),
        padding: EdgeInsets.all(32),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Seja bem-vindo(a)", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 24),
          Text("Email", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8), 
          TextField(controller: email, decoration: InputDecoration(border: OutlineInputBorder())),
          SizedBox(height: 24), 
          Text("Senha", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8), 
          TextField(controller: password, decoration: InputDecoration( border: OutlineInputBorder())),
          SizedBox(height: 24),
          Row(
            children: [
              ElevatedButton(onPressed: validateLogin, child: Text("Logar")),
              ElevatedButton(onPressed: clearForm, child: Text("Cancelar")),
            ],
          ),
        ],
        ),
      )
    );
  }

  // Método que valida o login e o transfere para outra página
  void validateLogin() {
    
    // Validação do nome
    if (email.text.isEmpty) {
      setState(() {
        emailErrorMessage = "email não pode ser vazio";
      });
    } else if (email.text.length < 3 || email.text.length > 15) {
      setState(() {
        emailErrorMessage = "email deve conter entre 3 e 15 caracteres";
      });
    } else {
      isEmailValid = true;
    }

    // Validação da senha
    if (password.text.isEmpty) {
      setState(() {
        passwordErrorMessage = "Senha não pode ser vazia";
      });
    } else if (password.text.length < 3) {
      setState(() {
        passwordErrorMessage = "Senha deve ter no minimo 3 caracteres";
      });
    } else {
      isPassValid = true;
    }

    // Finalmente, se todos forem válidos mudar de pagina
    if (isEmailValid && isPassValid) {
      changePage();
    }
  }

  // Método que muda de tela, só será chamado em caso de login bem sucedido
  void changePage() {
    Navigator.push( context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
  }

  // Reseta o estado do formulário
  void clearForm() {
    setState(() {
      email.clear();
      password.clear();

      isEmailValid = false;
      isPassValid = false;

      emailErrorMessage = null;
      passwordErrorMessage = null;
    });
  }
}