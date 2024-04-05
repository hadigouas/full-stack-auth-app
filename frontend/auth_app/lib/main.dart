import 'package:flutter/material.dart';

import 'view/screens/welcom_screen.dart';

void main() {
  runApp(const Authapp());
}

class Authapp extends StatelessWidget {
  const Authapp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Welcome_Screen(),
    );
  }
}
