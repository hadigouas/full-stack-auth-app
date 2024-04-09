import 'package:auth_app/view/widgets/mytext.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Mytext(text: "home Screen"),
      ),
    );
  }
}
