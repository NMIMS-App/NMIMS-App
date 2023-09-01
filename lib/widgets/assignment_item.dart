import 'package:flutter/material.dart';

class AssignmentItem extends StatelessWidget {
  const AssignmentItem({
    super.key,
    required this.assignmentName,
    required this.assignmentDueDate,
    required this.assignmentSubmitted,
  });

  final String assignmentName;
  final String assignmentDueDate;
  final bool assignmentSubmitted;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.assignment),
        title: Text(assignmentName),
        subtitle: Text(assignmentDueDate),
        trailing: assignmentSubmitted
            ? const Icon(Icons.check)
            : const Icon(Icons.close),
      ),
    );
  }
}
