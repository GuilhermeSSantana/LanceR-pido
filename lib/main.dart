import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Importa o pacote dotenv
import 'package:leilao/pages/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Sempre antes de inicializações

  // Carrega o arquivo .env
  await dotenv.load(fileName: ".env");

  if (kIsWeb) {
    // Carrega as configurações do Firebase a partir do .env
    final firebaseConfig = FirebaseOptions(
      apiKey: dotenv.env['API_KEY']!,
      authDomain: dotenv.env['AUTH_DOMAIN']!,
      projectId: dotenv.env['PROJECT_ID']!,
      storageBucket: dotenv.env['STORAGE_BUCKET']!,
      messagingSenderId: dotenv.env['MESSAGING_SENDER_ID']!,
      appId: dotenv.env['APP_ID']!,
      measurementId: dotenv.env['MEASUREMENT_ID']!,
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
