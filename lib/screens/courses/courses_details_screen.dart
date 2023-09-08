import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nmims_app/models/course_activity_files_model.dart';
import 'package:nmims_app/models/courses_model.dart';
import 'package:nmims_app/widgets/course_acitivity_item.dart';

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
          title: const Text('Course Details'),
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
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
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
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Image.asset(
                        'lib/assets/background_image.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        widget.course.courseName,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.course.courseId,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 24,
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
                'Activity',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: CourseActivityItem(
                  courseActivityTitle: 'Java Stack Program',
                  courseActivityFileName: 'Java Stack',
                ),
              ),
            ],
          ),
        );
      },
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

    return ListView.separated(
      itemCount: files.length,
      separatorBuilder: (context, index) =>
          const Divider(), // Add a separating line
      itemBuilder: (context, index) {
        CourseActivityFiles file = files[index];
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
            onTap: () {
              // You can add functionality to open or download the file here
              // For example, you can launch a PDF viewer or open a web URL.
            },
          ),
        );
      },
    );
  }
}
