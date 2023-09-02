import 'package:flutter/material.dart';
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
// TODO: Figure out how we can pass only the constructor.
//       Constructing the object before it is required will take more RAM.
final categories = [
  Category(
    categoryScreen: const TimeTable(),
    categoryName: 'Attendance',
    categoryIcon: Icons.touch_app,
  ),
  Category(
    categoryScreen: const TimeTable(),
    categoryName: 'Assignments',
    categoryIcon: Icons.assignment,
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
    categoryName: 'Syllabus',
    categoryIcon: Icons.book,
  ),
  Category(
    categoryScreen: const TimeTable(),
    categoryName: 'Results',
    categoryIcon: Icons.assessment,
  ),
];
