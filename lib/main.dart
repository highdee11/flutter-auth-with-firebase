import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ourpass_auth/core/providers/user-provider.dart';
import 'package:ourpass_auth/views/auth/auth-token.dart';
import 'package:ourpass_auth/views/auth/signup.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: UserProvider())
        ],
        child: const CreateAccountScreen(),
      ),
    );
  }
}
