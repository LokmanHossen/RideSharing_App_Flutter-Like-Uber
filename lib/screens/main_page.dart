import 'package:flutter/material.dart';
import '../screens/register_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterScreen(),
    );
  }
}
