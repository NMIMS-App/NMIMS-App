import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nmims_app/models/courses_model.dart';
import 'package:nmims_app/screens/courses/courses_details_screen.dart';
import 'package:nmims_app/widgets/app_bar.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final List<Course> courses = [
    const Course(
      courseName: 'Operating Systems',
      courseId: 'OS111',
    ),
    const Course(
      courseName: 'Data Structures',
      courseId: 'DS111',
    ),
    const Course(
      courseName: 'Computer Networks',
      courseId: 'CN111',
    ),
    const Course(
      courseName: 'Database Management Systems',
      courseId: 'DBMS111',
    ),
    const Course(
      courseName: 'Software Engineering',
      courseId: 'SE111',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Courses',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red[400],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (ctx, index) {
            final course = courses[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) {
                      return CoursesDetailsScreen(
                        course: course,
                      );
                    },
                  ),
                );
              },
              child: Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                      color: Colors.grey[200]!), // Adding a subtle border
                ),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      Icons.book,
                      color: Colors.red[600],
                    ),
                  ),
                  title: Text(
                    course.courseName,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      height: 1.1,
                    ),
                  ),
                  subtitle: Text(
                    course.courseId,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.red[400],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
