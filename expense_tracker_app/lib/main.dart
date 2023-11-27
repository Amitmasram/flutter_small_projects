import 'package:expense_tracker_app/screens/expenseTracker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 🚀 Welcome to Flutter SmallProjects!
// 🌐 Connect with us on social media:
//    - Twitter: https://twitter.com/AmitMasram10
//    - Instagram: https://www.instagram.com/skytech_28/
//    - LinkedIn: https://www.linkedin.com/feed/
//    - YouTube: https://www.youtube.com/channel/UC95U3IDgISWVeyqo4CGBywQ
// 💻 Explore the code and have fun building beautiful SmallProjects with Flutter!
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
          accentColor: Colors.amber,
        ),
        fontFamily: 'Quicksand',
      ),
      home: const ExpenseTracker(),
    );
  }
}
