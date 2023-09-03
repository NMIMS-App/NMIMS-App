import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AssignmentItem extends StatelessWidget {
  const AssignmentItem({
    super.key,
    required this.assignmentName,
    required this.assignmentDueDate,
    required this.assignmentSubmitted,
    required this.assignmentCourse,
  });

  final String? assignmentName;
  final DateTime? assignmentDueDate;
  final bool? assignmentSubmitted;
  final String? assignmentCourse;

  @override
  Widget build(BuildContext context) {
    //
    final formattedDueTime = DateFormat("h:mm a").format(assignmentDueDate!);
    final formattedAssignmentDate = DateFormat("E, d MMM").format(
      assignmentDueDate!,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            formattedAssignmentDate,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 248, 248, 248),
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 16,
              ),
              const CircleAvatar(
                radius: 32,
                backgroundColor:
                    Colors.blue, // Customize avatar background color
                child: Icon(
                  Icons.assignment,
                  color: Colors.white,
                  size: 32,
                ), // Customize avatar icon
              ),
              const SizedBox(width: 48),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      assignmentCourse!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      assignmentName!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Due at $formattedDueTime',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          assignmentSubmitted! ? 'Submitted' : 'Not Submitted',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: assignmentSubmitted!
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
