import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nmims_app/models/course_activity_files_model.dart';
import 'package:nmims_app/models/courses_model.dart';

class FilesTab extends StatefulWidget {
  const FilesTab({super.key, required this.course});

  final Course course;

  @override
  State<FilesTab> createState() => _FilesTabState();
}

class _FilesTabState extends State<FilesTab> {
  @override
  Widget build(BuildContext context) {
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
                color: Colors.white,
                elevation: 2,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: fileIcon ?? const Icon(Icons.insert_drive_file),
                  title: Text(
                    file.courseActivityFileName,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
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
