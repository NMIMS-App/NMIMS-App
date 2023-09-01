import 'package:flutter/material.dart';
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
// TODO: Figure out how we can pass only the constructor.
//       Constructing the object before it is required will take more RAM.
final categories = [
  Category(
    categoryLink: const TimeTable(),
    categoryName: 'Attendance',
    categoryIcon: Icons.touch_app,
  ),
  Category(
    categoryLink: const TimeTable(),
    categoryName: 'Assignments',
    categoryIcon: Icons.assignment,
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
    categoryName: 'Syllabus',
    categoryIcon: Icons.book,
  ),
  Category(
    categoryLink: const TimeTable(),
    categoryName: 'Results',
    categoryIcon: Icons.assessment,
  ),
];
