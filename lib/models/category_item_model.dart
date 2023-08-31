import 'package:flutter/material.dart';

class Category {
  Category({
    required this.categoryIcon,
    required this.categoryName,
  });

  String categoryName;
  IconData categoryIcon;
}

final categories = [
  Category(
    categoryName: 'Attendance',
    categoryIcon: Icons.touch_app,
  ),
  Category(
    categoryName: 'Assignments',
    categoryIcon: Icons.assignment,
  ),
  Category(
    categoryName: 'Announcements',
    categoryIcon: Icons.notifications,
  ),
  Category(
    categoryName: 'Time Table',
    categoryIcon: Icons.table_chart,
  ),
  Category(
    categoryName: 'Syllabus',
    categoryIcon: Icons.book,
  ),
  Category(
    categoryName: 'Results',
    categoryIcon: Icons.assessment,
  ),
];
