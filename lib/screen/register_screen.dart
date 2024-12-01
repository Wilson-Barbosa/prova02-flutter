// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wilson_diego_barbosa_p2/screen/login_screen.dart';
import 'package:wilson_diego_barbosa_p2/screen/welcome_screen.dart';

class RegisterScreen extends StatefulWidget {
    
    // constructor que será chamado dentro do do atribbuto home da classe main.dart
    const RegisterScreen({super.key}); 

  @override
  LoginState createState() => LoginState();
}

// Classe que controla o estado do form
class LoginState extends State<RegisterScreen> {

  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  // Mensagens de errro que podem ser mostradas
  String? passwordErrorMessage;
  String? nameErrorMessage;

  // Atributos que controlam a validade ou invaliadade do formulário
  bool isNameValid = false;
  bool isPassValid = false;
  bool isEmailValid = false;

  // Cria a o formulário de login
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text("Cadastro")),
          backgroundColor: Colors.blue
          ),
      body: 
        Container(
        margin: EdgeInsets.all(32),
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          
        ),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text("Faça seu cadastro aqui", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 24),
          
          Text("Nome", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8), 
          TextField(controller: username, decoration: InputDecoration(border: OutlineInputBorder())),
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
              ElevatedButton(onPressed: validateLogin, child: Text("Cadastrar")),
              SizedBox(width: 16),
              ElevatedButton(onPressed: clearForm, child: Text("Limpar campos")),
            ],
          ),

          SizedBox(height: 8),
          Divider(color: const Color.fromARGB(255, 10, 10, 10), thickness: 1, indent: 16, endIndent: 16),
          SizedBox(height: 8),
          GestureDetector(
            onTap: changeToLogin,
            child: Text("Faça o login aqui", style: TextStyle(fontSize: 12, decoration: TextDecoration.underline))
          )
        ],
        ),
      )
    );
  }

  // Método que valida o login e o transfere para outra página
  void validateLogin() {
    
    // Validação do nome
    if (username.text.isEmpty) {
      setState(() {
        nameErrorMessage = "Nome não pode ser vazio";
      });
    } else if (username.text.length < 3 || username.text.length > 15) {
      setState(() {
        nameErrorMessage = "Nome deve conter entre 3 e 15 caracteres";
      });
    } else {
      isNameValid = true;
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
    if (isNameValid && isPassValid) {
      changeToWelcome();
    }
  }

  // Método que muda de tela, só será chamado em caso de login bem sucedido
  void changeToWelcome() {
    Navigator.push( context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
  }

  void changeToLogin(){
    Navigator.push( context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  // Reseta o estado do formulário
  void clearForm() {
    setState(() {
      username.clear();
      email.clear();
      password.clear();

      isNameValid = false;
      isPassValid = false;

      nameErrorMessage = null;
      passwordErrorMessage = null;
    });
  }
}