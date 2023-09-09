import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nmims_app/models/course_activity_files_model.dart';
import 'package:nmims_app/models/courses_model.dart';
import 'package:nmims_app/widgets/course_activity_item.dart';

class CoursesDetailsScreen extends StatefulWidget {
  const CoursesDetailsScreen({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  State<CoursesDetailsScreen> createState() => _CoursesDetailsScreenState();
}

class _CoursesDetailsScreenState extends State<CoursesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Course Details',
            textAlign: TextAlign.left,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Posts', icon: Icon(Icons.assignment)),
              Tab(text: 'Files', icon: Icon(Icons.folder)),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: TabBarView(
            children: [
              _buildActivityTab(),
              _buildFilesTab(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActivityTab() {
    // Filter the files for the current course.
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

  Widget _buildFilesTab() {
    Icon? getFileIcon(String fileName) {
      final extension = fileName.split('.').last.toLowerCase();
      switch (extension) {
        case 'pdf':
          return const Icon(Icons.picture_as_pdf, color: Colors.red);
        case 'ppt':
        case 'pptx':
          return const Icon(Icons.slideshow, color: Colors.orange);
        case 'doc':
        case 'docx':
          return const Icon(Icons.description, color: Colors.blue);
        default:
          return null;
      }
    }

    final courseFiles =
        files.where((file) => file.courseId == widget.course.courseId).toList();

    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          "Files",
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
            itemCount: courseFiles.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              CourseActivityFiles file = courseFiles[index];
              final fileIcon = getFileIcon(file.courseActivityFileName);

              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: fileIcon ?? const Icon(Icons.insert_drive_file),
                  title: Text(
                    file.courseActivityFileName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date Added: ${file.dateAdded}',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'File Size: ${file.fileSize}',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
