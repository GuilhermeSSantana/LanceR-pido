import 'package:flutter/material.dart';
import 'package:leilao/pages/login/login.dart';
import 'package:leilao/pages/login/registro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gerenciamento de Leilões',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/register': (context) =>
            const Register(), // Adicione sua tela de registro
      },
    );
  }
}
