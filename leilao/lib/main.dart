import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:leilao/pages/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Sempre antes de inicializações

  if (kIsWeb) {
    const firebaseConfig = FirebaseOptions(
      apiKey: "AIzaSyDPOVs8jPIGiT7BZBnXG1t6S3z6vRe7cBo",
      authDomain: "mercadinho-5d656.firebaseapp.com",
      projectId: "mercadinho-5d656",
      storageBucket: "mercadinho-5d656.firebasestorage.app",
      messagingSenderId: "576728877247",
      appId: "1:576728877247:web:4b0650dec50c6706ab9e0a",
      measurementId: "G-BHZGM4W5CE",
    );
    await Firebase.initializeApp(options: firebaseConfig);
  } else {
    await Firebase
        .initializeApp(); // iOS/Android usa o google-services.json/plist
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gerenciamento de Leilões',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}
