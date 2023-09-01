import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nmims_app/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
  );
}