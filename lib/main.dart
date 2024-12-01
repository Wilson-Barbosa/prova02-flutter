import 'package:flutter/material.dart';
import 'package:wilson_diego_barbosa_p2/screen/imc_screen.dart';
import 'package:wilson_diego_barbosa_p2/screen/login_screen.dart';
import 'package:wilson_diego_barbosa_p2/screen/register_screen.dart';
import 'package:wilson_diego_barbosa_p2/screen/welcome_screen.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp( home: RegisterScreen());
  }
}
