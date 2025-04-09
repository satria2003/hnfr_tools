import 'package:flutter/material.dart';
import 'package:hnfr_tools/halaman/login.dart';// Import MainPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // Gunakan MainPage sebagai root
    );
  }
}
