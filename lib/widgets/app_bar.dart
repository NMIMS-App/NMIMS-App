import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/profile/profile_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? studentFullName;
  final String? studentSemester;
  final String? studentCourse;
  
  const CustomAppBar({
    Key? key,
    this.studentFullName,
    this.studentSemester,
    this.studentCourse,
  }) : super(key: key);

  Future<Map<String, dynamic>?> fetchStudentData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String uid = user.uid;
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('students')
          .doc(uid)
          .get();

      if (snapshot.exists) {
        // Check if the document exists
        Map<String, dynamic> studentData =
            snapshot.data() as Map<String, dynamic>;
        return studentData;
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching document: $e');
      return null;
    }
  }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      // ToDo: Replace the documentID with the Current active user's UID
        future: fetchStudentData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return AppBar(
              title: const CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return AppBar(
              title: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            Map<String, dynamic>? studentData = snapshot.data;
            if (studentData != null) {
              String? studentName = studentData['studentName'];
              String? studentSemester = studentData['studentSemester'];
              String? studentCourse = studentData['studentCourse'];
              return AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                title: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ProfileScreen()),
                        );
                      },
                    ),
                    const SizedBox(width: 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$studentName",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: "$studentCourse",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: "$studentSemester",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.assignment,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        // Add your attendance icon tap logic here
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.touch_app,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        // Add your attendance icon tap logic here
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        // Add your announcements icon tap logic here
                      },
                    ),
                  ],
                ),
              );
            } else {
              return AppBar(
                title: const Text('Student document not found or an error occurred.'),
                // Other AppBar properties here
              );
            }
          } else {
            return AppBar(
              title: const Text('User has not Authenticated.'),
              // Other AppBar properties here
            );
          }
        });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
