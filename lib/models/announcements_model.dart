import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

// Model representing an announcement
class Announcement {
  final String title;
  final String description;
  final DateTime date;

  Announcement({
    required this.title,
    required this.description,
    required this.date,
  });
}

// Sample data for announcements
List<Announcement> announcements = [
  Announcement(
    title: 'Important Update',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    date: DateTime.now(),
  ),
  Announcement(
    title: 'Meeting Rescheduled',
    description: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    date: DateTime.now().subtract(Duration(days: 1)),
  ),
  Announcement(
    title: 'New Feature Added',
    description: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    date: DateTime.now().subtract(Duration(days: 2)),
  ),
  Announcement(
    title: 'Holiday Notice',
    description: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
    date: DateTime.now().subtract(Duration(days: 3)),
  ),
];