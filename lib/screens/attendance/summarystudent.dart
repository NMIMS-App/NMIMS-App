import 'package:flutter/material.dart';
import 'package:nmims_app/models/summary_attendance_item_model.dart'; // Ensure this path is correct

class SummaryAttendanceScreen extends StatelessWidget {
  const SummaryAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Summary Attendance',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor:
            Colors.red,
      ),
      body: ListView.builder(
        itemCount: attendance.length,
        itemBuilder: (context, index) {
          final item = attendance[index];
          final attendancePercent = item.presentlecs / item.totallecs * 100;
          return Card(
            elevation: 4,
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: attendancePercent >= 75
                    ? Colors.green
                    : Colors.red,
                child: Icon(
                  attendancePercent >= 75 ? Icons.check : Icons.close,
                  color: Colors.white,
                ),
              ),
              title: Text(
                item.subject,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                'Attended ${item.presentlecs} out of ${item.totallecs} lectures',
                style: const TextStyle(
                  color:
                      Color(0xFF9E9E9E),
                ),
              ),
              trailing: Text(
                '${attendancePercent.toStringAsFixed(1)}%',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: attendancePercent >= 75
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
