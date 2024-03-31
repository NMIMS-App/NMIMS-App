import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:nmims_app/models/course_activity_files_model.dart';
import 'package:nmims_app/models/courses_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;


class FilesTab extends StatefulWidget {
  const FilesTab({Key? key, required this.course, required ScrollController scrollController}) : super(key: key);
  final Course course;

  @override
  _FilesTabState createState() => _FilesTabState();
}

class _FilesTabState extends State<FilesTab> {
  @override
  void initState() {
    super.initState();
    _sortFiles();
  }

  String _selectedSortOption = 'Newest';
  List<CourseActivityFiles> sortedFiles = [];

  void _sortFiles() {
    sortedFiles = List.from(
        files.where((file) => file.courseId == widget.course.courseId));
    if (sortedFiles.isEmpty) return;
    switch (_selectedSortOption) {
      case 'Oldest':
        sortedFiles.sort((a, b) => a.dateAdded.compareTo(b.dateAdded));
        break;
      case 'Newest':
        sortedFiles.sort((a, b) => b.dateAdded.compareTo(a.dateAdded));
        break;
      case 'A to Z':
        sortedFiles.sort((a, b) =>
            a.courseActivityFileName.compareTo(b.courseActivityFileName));
        break;
      case 'Z to A':
        sortedFiles.sort((a, b) =>
            b.courseActivityFileName.compareTo(a.courseActivityFileName));
        break;
    }
    setState(() {});
  }

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Sort by: '),
              CupertinoButton(
                child: Text(_selectedSortOption),
                onPressed: () => showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) => CupertinoActionSheet(
                    title: const Text('Sort by'),
                    actions: <Widget>[
                      CupertinoActionSheetAction(
                        child: const Text('Oldest'),
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            _selectedSortOption = 'Oldest';
                            _sortFiles();
                          });
                        },
                      ),
                      CupertinoActionSheetAction(
                        child: const Text('Newest'),
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            _selectedSortOption = 'Newest';
                            _sortFiles();
                          });
                        },
                      ),
                      CupertinoActionSheetAction(
                        child: const Text('A to Z'),
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            _selectedSortOption = 'A to Z';
                            _sortFiles();
                          });
                        },
                      ),
                      CupertinoActionSheetAction(
                        child: const Text('Z to A'),
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            _selectedSortOption = 'Z to A';
                            _sortFiles();
                          });
                        },
                      ),
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      isDefaultAction: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: sortedFiles.isNotEmpty
              ? ListView.builder(
                  itemCount: sortedFiles.length,
                  itemBuilder: (context, index) {
                    CourseActivityFiles file = sortedFiles[index];
                    final fileIcon = getFileIcon(file.courseActivityFileName);
                    return Card(
                      color: Colors.white,
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: ListTile(
                        leading:
                            fileIcon ?? const Icon(Icons.insert_drive_file),
                        title: Text(
                          file.courseActivityFileName,
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date Added: ${file.dateAdded.toIso8601String().split('T')[0]}',
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
                          launchFile(context, file.courseActivityFileName, file.fileUrl);
                        },
                      ),
                    );
                  },
                )
              : sortedFiles.isEmpty
                  ? const Center(child: Text('No files available'))
                  : const Center(child: Text('Loading files...')),
        ),
      ],
    );
  }

  Future<void> launchFile(BuildContext context, String fileName, String fileUrl) async {
    final filePath = await downloadAndSavePDF(fileUrl, fileName);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFViewerScreen(
          fileName: fileName,
          filePath: filePath,
        ),
      ),
    );
  }

  Future<String> downloadAndSavePDF(String url, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');
    if (!await file.exists()) {
      final response = await http.get(Uri.parse(url));
      await file.writeAsBytes(response.bodyBytes);
    }
    return file.path;
  }
}

class PDFViewerScreen extends StatelessWidget {
  const PDFViewerScreen({Key? key, required this.fileName, required this.filePath}) : super(key: key);

  final String fileName;
  final String filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fileName),
      ),
      body: PDFView(
        filePath: filePath,
        autoSpacing: false,
        onError: (error) {
          print(error);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Error'),
              content: Text('Failed to open PDF: $error'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        },
        onRender: (_pages) {
          print("PDF rendered: $_pages");
        },
        onViewCreated: (PDFViewController vc) {
          print("PDFViewController created");
        },
      ),
    );
  }
}