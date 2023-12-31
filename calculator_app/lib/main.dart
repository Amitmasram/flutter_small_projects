import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

// 🚀 Welcome to Flutter UIs!
// 🌐 Connect with us on social media:
//    - Twitter: https://twitter.com/AmitMasram10
//    - Instagram: https://www.instagram.com/skytech_28/
//    - LinkedIn: https://www.linkedin.com/feed/
//    - YouTube: https://www.youtube.com/channel/UC95U3IDgISWVeyqo4CGBywQ
// 💻 Explore the code and have fun building beautiful UIs with Flutter!
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
