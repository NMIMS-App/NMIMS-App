import 'package:flutter/material.dart';
import 'package:nmims_app/screens/assignments_screen.dart';
import 'package:nmims_app/screens/timetable.dart';

class Category {
  Category({
    required this.categoryIcon,
    required this.categoryName,
    required this.categoryLink,
  });

  String categoryName;
  IconData categoryIcon;
  StatefulWidget categoryLink;
}

final categories = [
  Category(
    categoryLink: const TimeTable(),
    categoryName: 'Attendance',
    categoryIcon: Icons.touch_app,
  ),
  Category(
    categoryLink: const AssignmentsScreen(),
    categoryName: 'Assignments',
    categoryIcon: Icons.assignment,
  ),
  Category(
    categoryLink: const TimeTable(),
    categoryName: 'Courses',
    categoryIcon: Icons.class_,
  ),
  Category(
    categoryLink: const TimeTable(),
    categoryName: 'Announcements',
    categoryIcon: Icons.notifications,
  ),
  Category(
    categoryLink: const TimeTable(),
    categoryName: 'Time Table',
    categoryIcon: Icons.table_chart,
  ),
  Category(
    categoryLink: const TimeTable(),
    categoryName: 'Results',
    categoryIcon: Icons.assessment,
  ),
  Category(
    categoryLink: const TimeTable(),
    categoryName: 'Library',
    categoryIcon: Icons.library_books,
  ),
  Category(
    categoryLink: const TimeTable(),
    categoryName: 'Support',
    categoryIcon: Icons.settings_applications,
  ),
  Category(
    categoryLink: const TimeTable(),
    categoryName: 'Profile',
    categoryIcon: Icons.person,
  ),
];
