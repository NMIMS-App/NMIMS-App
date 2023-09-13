import 'package:flutter/material.dart';
import 'package:nmims_app/screens/assignments/assignments_screen.dart';
import 'package:nmims_app/screens/courses/courses_screen.dart';
import 'package:nmims_app/screens/profile/profile_screen.dart';
import 'package:nmims_app/screens/results/results_screen.dart';
import 'package:nmims_app/screens/support/support_screen.dart';
import 'package:nmims_app/screens/timetable/timetable.dart';
import 'package:nmims_app/screens/attendance/studentattendance.dart';

class Category {
  Category({
    required this.categoryIcon,
    required this.categoryName,
    required this.categoryScreen,
  });

  String categoryName;
  IconData categoryIcon;
  Widget categoryScreen;
}

final categories = [
  Category(
    categoryScreen: const StudentAttendance(),
    categoryName: 'Attendance',
    categoryIcon: Icons.touch_app,
  ),
  Category(
    categoryScreen: const AssignmentsScreen(),
    categoryName: 'Assignments',
    categoryIcon: Icons.assignment,
  ),
  Category(
    categoryScreen: const CoursesScreen(),
    categoryName: 'Courses',
    categoryIcon: Icons.class_,
  ),
  Category(
    categoryScreen: const TimeTable(),
    categoryName: 'Announcements',
    categoryIcon: Icons.notifications,
  ),
  Category(
    categoryScreen: const TimeTable(),
    categoryName: 'Time Table',
    categoryIcon: Icons.table_chart,
  ),
  Category(
    categoryScreen: const ResultsScreen(),
    categoryName: 'Results',
    categoryIcon: Icons.assessment,
  ),
  Category(
    categoryScreen: const TimeTable(),
    categoryName: 'Library',
    categoryIcon: Icons.library_books,
  ),
  Category(
    categoryScreen: const SupportScreen(),
    categoryName: 'Support',
    categoryIcon: Icons.settings_applications,
  ),
  Category(
    categoryScreen: const ProfileScreen(),
    categoryName: 'Profile',
    categoryIcon: Icons.person,
  ),
];
