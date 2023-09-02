import 'package:flutter/material.dart';
import 'package:nmims_app/screens/assignments_screen.dart';
import 'package:nmims_app/screens/timetable.dart';

class Category {
  Category({
    required this.categoryIcon,
    required this.categoryName,
    required this.categoryScreen,
  });

  String categoryName;
  IconData categoryIcon;
  StatefulWidget categoryScreen;
}

final categories = [
  Category(
    categoryScreen: const TimeTable(),
    categoryName: 'Attendance',
    categoryIcon: Icons.touch_app,
  ),
  Category(
    categoryScreen: const AssignmentsScreen(),
    categoryName: 'Assignments',
    categoryIcon: Icons.assignment,
  ),
  Category(
    categoryScreen: const TimeTable(),
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
    categoryScreen: const TimeTable(),
    categoryName: 'Results',
    categoryIcon: Icons.assessment,
  ),
  Category(
    categoryScreen: const TimeTable(),
    categoryName: 'Library',
    categoryIcon: Icons.library_books,
  ),
  Category(
    categoryScreen: const TimeTable(),
    categoryName: 'Support',
    categoryIcon: Icons.settings_applications,
  ),
  Category(
    categoryScreen: const TimeTable(),
    categoryName: 'Profile',
    categoryIcon: Icons.person,
  ),
];
