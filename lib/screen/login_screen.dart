// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
    
    // constructor que será chamado dentro do do atribbuto home da classe main.dart
    const LoginScreen({super.key}); 

  @override
  LoginState createState() => LoginState();
}

// Classe que controla o estado do form
class LoginState extends State<LoginScreen> {

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  // Mensagens de errro que podem ser mostradas
  String? passwordErrorMessage;
  String? nameErrorMessage;

  // Atributos que controlam a validade ou invaliadade do formulário
  bool isNameValid = false;
  bool isPassValid = false;

  // Cria a o formulário de login
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text("Prova 01 - Flutter")),
          backgroundColor: Colors.blue
          ),
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          children: [
            Text("Faça seu login aqui", textAlign: TextAlign.left, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Text("Nome de usuário"),
            TextField(
              controller: username,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "I hate flutter",
                  errorText: nameErrorMessage),
            ),
            SizedBox(height: 40),
            Text("Senha do usuário", textAlign: TextAlign.left),
            TextField(
              controller: password,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  errorText: passwordErrorMessage),
              // decoration: ,
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: validateLogin, child: Text("Confirmar", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                ElevatedButton(
                  onPressed: clearForm,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 201, 201, 201)),),
                    child: Text("Cancelar", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
      changePage();
    }
  }

  // Método que muda de tela, só será chamado em caso de login bem sucedido
  void changePage() {
    // Navigator.push( context, MaterialPageRoute(builder: (context) => const CustomPage()));
  }

  // Reseta o estado do formulário
  void clearForm() {
    setState(() {
      username.clear();
      password.clear();

      isNameValid = false;
      isPassValid = false;

      nameErrorMessage = null;
      passwordErrorMessage = null;
    });
  }
}