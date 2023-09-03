import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TabBar(
              dividerColor: Colors.transparent,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              labelStyle: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              overlayColor: MaterialStateProperty.all(
                Color.fromARGB(70, 0, 0, 0),
              ),
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(
                    icon: Icon(
                      Icons.assignment,
                      size: 28,
                    ),
                    text: 'Pending'),
                Tab(
                    icon: Icon(
                      Icons.check_circle_outline,
                      size: 28,
                    ),
                    text: 'Completed'),
                Tab(
                    icon: Icon(
                      Icons.warning,
                      size: 28,
                    ),
                    text: 'Late'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildTab(assignments
                      .where((a) => !a.assignmentSubmitted && !isLate(a))
                      .toList()),
                  _buildTab(
                      assignments.where((a) => a.assignmentSubmitted).toList()),
                  _buildTab(assignments
                      .where((a) => !a.assignmentSubmitted && isLate(a))
                      .toList()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isLate(Assignment assignment) {
    final today = DateTime.now();
    return today.isAfter(assignment.assignmentDueDate);
  }

  Widget _buildTab(List<Assignment> assignments) {
    return ListView.builder(
      itemCount: assignments.length,
      itemBuilder: (context, index) {
        final assignment = assignments[index];
        return AssignmentItem(
          assignmentName: assignment.assignmentName,
          assignmentDueDate: assignment.assignmentDueDate,
          assignmentSubmitted: assignment.assignmentSubmitted,
          assignmentCourse: assignment.assignmentCourse,
        );
      },
    );
  }
}
