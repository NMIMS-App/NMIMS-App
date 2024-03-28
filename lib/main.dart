import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nmims_app/screens/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nmims_app/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nmims_app/screens/preloader/preloader_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) async {
      runApp(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: const PreloaderScreen(),
        ),
      );

      final initialScreen = await determineInitialScreen();

      runApp(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: initialScreen,
        ),
      );
    },
  );
}

Future<Widget> determineInitialScreen() async {
  final prefs = await SharedPreferences.getInstance();
  final rememberMe = prefs.getBool('rememberMe') ?? false;

  await Future.delayed(const Duration(seconds: 2));

  // if (FirebaseAuth.instance.currentUser != null && rememberMe) {
  //   return const HomeScreen();
  // } else {
  //   return const LoginScreen();
  // }
  return HomeScreen();
}
