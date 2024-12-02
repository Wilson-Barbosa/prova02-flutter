// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wilson_diego_barbosa_p2/database/database.dart';
import 'package:wilson_diego_barbosa_p2/model/user_model.dart';
import 'package:wilson_diego_barbosa_p2/screen/register_screen.dart';
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
          title: Text("Tela de Login", style: TextStyle(color: Colors.white)),
          backgroundColor: Color.fromARGB(255, 32, 50, 216)
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
          Text("Seja bem-vindo(a)", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 24),
          Text("Email", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8), 
          TextField(controller: email, decoration: InputDecoration(border: OutlineInputBorder())),
          SizedBox(height: 24), 
          Text("Senha", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8), 
          TextField(controller: password, obscureText: true, decoration: InputDecoration( border: OutlineInputBorder())),
          SizedBox(height: 24),
          Row(
            children: [
              ElevatedButton(onPressed: validateLogin, child: Text("Logar")),
              SizedBox(width: 4),
              ElevatedButton(onPressed: clearForm, child: Text("Cancelar")),
              SizedBox(width: 4),
              ElevatedButton(onPressed: printAllUsersOnTerminal, child: Text("Printar usuários")),
            ],
          ),

          SizedBox(height: 8),
          Divider(color: const Color.fromARGB(255, 10, 10, 10), thickness: 1, indent: 16, endIndent: 16),
          SizedBox(height: 8),
          
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
            onTap: changeToRegister,
            child: Text("Registre-se aqui", style: TextStyle(fontSize: 12, decoration: TextDecoration.underline)))
          )
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
      changeToWelcome();
    }
  }

  // Método que muda de tela, só será chamado em caso de login bem sucedido
  void changeToWelcome() {
    Navigator.push( context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
  }

  void changeToRegister(){
    Navigator.push( context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
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


  void printAllUsersOnTerminal() async {
    List<UserModel> users = await DatabaseHelper.instance.getAllUsersFromDatabase();
    for (var user in users) {
      print('Name: ${user.name}, Email: ${user.email}, Password: ${user.password}');
    }
  }

}