import 'package:flutter/material.dart';
import 'package:nmims_app/models/courses_model.dart';
import 'package:nmims_app/screens/courses/courses_details_screen.dart';

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
      courseName: 'Artificial Intelligence',
      courseId: 'AI112',
    ),
    const Course(
      courseName: 'Image and Video Processing',
      courseId: 'IVP113',
    ),
    const Course(
      courseName: 'Computer Networks',
      courseId: 'CN114',
    ),
    const Course(
      courseName: 'Software Engineering',
      courseId: 'SE115',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (ctx, index) {
          final course = courses[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (builder) {
                    return CoursesDetailsScreen(
                      course: courses,
                    );
                  },
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // gradient: const LinearGradient(
                //   colors: [
                //     Color.fromARGB(255, 0, 136, 255),
                //     Color.fromARGB(255, 0, 170, 255),
                //   ],
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                // ),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(99, 0, 0, 0),
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.courseName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    course.courseId,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
