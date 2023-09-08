import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nmims_app/models/course_activity_files_model.dart';
import 'package:nmims_app/widgets/course_activity_file_card.dart';

class CourseActivityItem extends StatelessWidget {
  const CourseActivityItem({
    Key? key,
    required this.courseActivityTitle,
    required this.courseActivityFileName,
  }) : super(key: key);

  final String courseActivityTitle;
  final String courseActivityFileName;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black,
            width: 0.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'July 13, 2023',
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                courseActivityTitle,
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: files.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: CourseActivityFileCard(
                      courseActivityFileName: courseActivityFileName,
                      courseActivityTitle: courseActivityTitle,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
