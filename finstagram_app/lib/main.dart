import 'package:finstagram_app/pages/home_page.dart';
import 'package:finstagram_app/pages/login_page.dart';
import 'package:finstagram_app/pages/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finstagram App',
      theme: ThemeData(primarySwatch: Colors.red
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //useMaterial3: true,
          ),
      // home: const Scaffold(),
      initialRoute: 'home',
      routes: {
        'register': (context) => const RegisterPage(),
        'login': (context) => const LoginPage(),
        'home': (context) => const HomePage()
      },
    );
  }
}
