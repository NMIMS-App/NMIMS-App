import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:nmims_app/screens/login/login_screen.dart'; // Import the LoginScreen

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  Future<void> logout(BuildContext context) async {
    final confirmed = await showCupertinoDialog<bool>(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('No'),
            ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      try {
        await FirebaseAuth.instance.signOut();
        // Navigate to the LoginScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      } catch (e) {
        print("Error during logout: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
