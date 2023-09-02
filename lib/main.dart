import 'package:flutter/material.dart';
import 'package:nmims_app/screens/login_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    ),
  );
}
