import 'package:flutter/material.dart';
import 'package:nmims_app/widgets/app_bar.dart';
import 'package:nmims_app/widgets/assignment_item.dart';
import 'package:nmims_app/models/assignment_item_model.dart';

class AssignmentsScreen extends StatefulWidget {
  const AssignmentsScreen({super.key});

  @override
  State<AssignmentsScreen> createState() => _AssignmentsScreenState();
}

class _AssignmentsScreenState extends State<AssignmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView.builder(
        itemCount: assignments.length,
        itemBuilder: (context, index) {
          return AssignmentItem(
            assignmentName: assignments[index].assignmentName,
            assignmentDueDate: assignments[index].assignmentDueDate,
            assignmentSubmitted: assignments[index].assignmentSubmitted,
          );
        },
      ),
    );
  }
}
