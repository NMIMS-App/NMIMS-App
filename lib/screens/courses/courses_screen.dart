import 'package:flutter/material.dart';
import 'package:nmims_app/models/courses_model.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final List<Course> courses = [
    const Course(
      courseId: '1',
      courseName: 'Operating Systems',
    ),
    const Course(
      courseName: '2',
      courseId: 'Artificial Intelligence',
    ),
    const Course(
      courseName: '3',
      courseId: 'Image and Video Processing',
    )
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
          return ListTile(
            leading: const Icon(Icons.book),
            title: Text(courses[index].courseName),
          );
        },
      ),
    );
  }
}
