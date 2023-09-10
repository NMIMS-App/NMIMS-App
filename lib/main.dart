import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nmims_app/screens/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nmims_app/screens/home/home_screen.dart';

// abc@abc.com
// test@123

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
          ),
          //change back to Login
          home: const HomeScreen(),
        ),
      );
    },
  );
}
