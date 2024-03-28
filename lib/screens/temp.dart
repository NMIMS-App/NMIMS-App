import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final String? studentFullName;
  final String? studentSemester;
  final String? studentCourse;

  CustomAppBar2({
    Key? key,
    this.studentFullName,
    this.studentSemester,
    this.studentCourse,
  }) : super(key: key);

  Future<Map<String, dynamic>?> fetchStudentData(String documentID) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('students')
          .doc(documentID)
          .get();

      if (snapshot.exists) {
        // Check if the document exists
        Map<String, dynamic> studentData = snapshot.data() as Map<String, dynamic>;
        return studentData;
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching document: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: fetchStudentData('test2'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return AppBar(
            title: CircularProgressIndicator(),
            // Other AppBar properties here
          );
        } else if (snapshot.hasError) {
          return AppBar(
            title: Text('Error: ${snapshot.error}'),
            // Other AppBar properties here
          );
        } else if (snapshot.hasData) {
          Map<String, dynamic>? studentData = snapshot.data;
          if (studentData != null) {
            String? studentName = studentData['studentName'];
            String? studentSemester = studentData['studentSemester'];
            String? studentCourse = studentData['studentCourse'];

            return AppBar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: $studentName'),
                  Text('Semester: $studentSemester'),
                  Text('Course: $studentCourse'),
                ],
              ),
              // Other AppBar properties here
            );
          } else {
            return AppBar(
              title: Text('Student document not found or an error occurred.'),
              // Other AppBar properties here
            );
          }
        } else {
          return AppBar(
            title: Text('No data available.'),
            // Other AppBar properties here
          );
        }
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}