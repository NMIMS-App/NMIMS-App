import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AssignmentItem extends StatelessWidget {
  const AssignmentItem({
    Key? key,
    required this.assignmentName,
    required this.assignmentDueDate,
    required this.assignmentSubmitted,
    required this.assignmentCourse,
  }) : super(key: key);

  final String? assignmentName;
  final DateTime? assignmentDueDate;
  final bool? assignmentSubmitted;
  final String? assignmentCourse;

  String getFormattedDayOfMonth(DateTime date) {
    if (date.day >= 11 && date.day <= 13) {
      return '${date.day}th';
    }
    switch (date.day % 10) {
      case 1:
        return '${date.day}st';
      case 2:
        return '${date.day}nd';
      case 3:
        return '${date.day}rd';
      default:
        return '${date.day}th';
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDueTime = DateFormat("h:mm a").format(assignmentDueDate!);

    final formattedAssignmentDate =
        DateFormat("E, ").format(assignmentDueDate!) +
            getFormattedDayOfMonth(assignmentDueDate!) +
            DateFormat(" MMM").format(assignmentDueDate!);

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
              const SizedBox(width: 32),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      assignmentCourse!,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      assignmentName!,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Due at $formattedDueTime',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          assignmentSubmitted! ? 'Submitted' : 'Not Submitted',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: assignmentSubmitted!
                                ? Colors.green
                                : Colors.red,
                          ),
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
