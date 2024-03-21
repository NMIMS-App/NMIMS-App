import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nmims_app/models/course_activity_files_model.dart';
import 'package:nmims_app/models/courses_model.dart';
import 'package:nmims_app/widgets/course_activity_item.dart';

class ActivityTab extends StatefulWidget {
  const ActivityTab({super.key, required this.course, required ScrollController scrollController});

  final Course course;

  @override
  State<ActivityTab> createState() => _ActivityTabState();
}

class _ActivityTabState extends State<ActivityTab> {
  @override
  Widget build(BuildContext context) {
    final courseActivities =
        files.where((file) => file.courseId == widget.course.courseId).toList();

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.course.courseName,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.course.courseId,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Activity',
            style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: courseActivities.length,
              itemBuilder: (BuildContext context, int index) {
                final activityFile = courseActivities[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: CourseActivityItem(
                    courseActivityTitle: activityFile.courseActivityTitle,
                    courseActivityFileName: activityFile.courseActivityFileName,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
