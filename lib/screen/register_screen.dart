// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wilson_diego_barbosa_p2/database/database.dart';
import 'package:wilson_diego_barbosa_p2/model/user_model.dart';
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
  String? usernameErrorMessage;
  String? emailErrorMessage;

  // Atributos que controlam a validade ou invaliadade do formulário
  bool isUsernameValid = false;
  bool isPassValid = false;
  bool isEmailValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Tela de Cadastro", style: TextStyle(color: Colors.white)),
          backgroundColor: Color.fromARGB(255, 32, 50, 216)
          ),
      body: SingleChildScrollView(
        child: Container(
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

          Text("Faça seu cadastro aqui", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 24),
          
          Text("Nome", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8), 
          TextField(controller: username, decoration: InputDecoration(border: OutlineInputBorder(), errorText: usernameErrorMessage)),
          SizedBox(height: 24),

          Text("Email", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8), 
          TextField(controller: email, decoration: InputDecoration(border: OutlineInputBorder(), errorText: emailErrorMessage)),
          SizedBox(height: 24),

          Text("Senha", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8), 
          TextField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(border: OutlineInputBorder(), errorText: passwordErrorMessage)),
          SizedBox(height: 24),

          Row(
            children: [
              ElevatedButton(onPressed: validateInformation, child: Text("Cadastrar")),
              SizedBox(width: 16),
              ElevatedButton(onPressed: clearForm, child: Text("Limpar campos")),
            ],
          ),

          SizedBox(height: 8),
          Divider(color: const Color.fromARGB(255, 10, 10, 10), thickness: 1, indent: 16, endIndent: 16),
          SizedBox(height: 8),

          Align(
            alignment: Alignment.center,
            child: GestureDetector(
            onTap: changeToLogin,
            child: Text("Faça o login aqui", style: TextStyle(fontSize: 12, decoration: TextDecoration.underline)))
          )
        ],
        ),
      )
    ));
  }

  Future<void> validateInformation() async {

    setState(() {
      usernameErrorMessage = null;
      emailErrorMessage = null;
      passwordErrorMessage = null;
    });

    if (username.text.isEmpty) {
      setState(() {
        usernameErrorMessage = "Nome não pode ser vazio";
      });
    } else {
      isUsernameValid = true;
    }

    if (email.text.isEmpty) {
      setState(() {
        emailErrorMessage = "Email não pode ser vazio";
      });
    } else {
      isEmailValid = true;
    }

    if (password.text.isEmpty) {
      setState(() {
        passwordErrorMessage = "Senha não pode ser vazia";
      });
    } else if (password.text.length < 3) {
      setState(() {
        passwordErrorMessage = "Senha deve ter no mínimo 3 caracteres";
      });
    } else {
      isPassValid = true;
    }


    if (isUsernameValid && isPassValid && isEmailValid) {
      UserModel? user = await DatabaseHelper.instance.getUserByEmail(email.text);

      if (user != null) {
        setState(() {
          emailErrorMessage = "Email já cadastrado";
        });
      } else {
        saveUserInDatabase();
        changeToWelcome();
      }
    }
  }



  void changeToWelcome() {
    Navigator.push( context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
  }

  void changeToLogin(){
    Navigator.push( context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }


  void clearForm() {
    setState(() {
      username.clear();
      email.clear();
      password.clear();

      isUsernameValid = false;
      isPassValid = false;
      isEmailValid = false;

      usernameErrorMessage = null;
      passwordErrorMessage = null;
      emailErrorMessage = null;
    });
  }



  void saveUserInDatabase() async{
    UserModel newUser = UserModel(
      name: username.text, 
      email: email.text, 
      password: password.text
    );

    await DatabaseHelper.instance.insertNewUser(newUser);
  }
  
}