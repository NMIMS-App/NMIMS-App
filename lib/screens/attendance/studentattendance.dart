import 'package:flutter/material.dart';
import 'summarystudent.dart';
import 'tabularstudent.dart';
import 'dart:convert';

class StudentAttendance extends StatefulWidget {
  const StudentAttendance({super.key});

  @override
  State<StatefulWidget> createState() => StudentAState();
}

class StudentAState extends State<StudentAttendance> {
  Color _primaryColor = Colors.red;
  Color _primaryTextColor = Colors.white;
  Color _secondaryColor = Colors.grey;

  void setPrimaryColor(Color color) {
    setState(() {
      _primaryColor = color;
    });
  }

  void setPrimaryTextColor(Color color) {
    setState(() {
      _primaryTextColor = color;
    });
  }

  void setSecondaryColor(Color color) {
    setState(() {
      _secondaryColor = color;
    });
  }

  void navigateToSummary(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return const SummaryAttendanceScreen();
    }));
  }

  void navigateToTabular(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return const Tabularstudent();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _primaryColor,
        title: Text(
          "Attendance",
          style: TextStyle(
            color: _primaryTextColor,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              // Placeholder for info action
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNavigationButton(
              context: context,
              buttonText: "Summary Data",
              onPressed: () => navigateToSummary(context),
            ),
            const SizedBox(height: 20), // Add spacing between buttons
            _buildNavigationButton(
              context: context,
              buttonText: "Tabular Data",
              onPressed: () => navigateToTabular(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton({
    required BuildContext context,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: _primaryTextColor,
        backgroundColor: _primaryColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      ),
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

