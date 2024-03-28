import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';

class AssignmentDetailsScreen extends StatefulWidget {
  final String assignmentName;
  final DateTime assignmentDueDate;
  final bool assignmentSubmitted;
  final String assignmentCourse;
  final String assignmentInstructions;

  const AssignmentDetailsScreen({
    Key? key,
    required this.assignmentName,
    required this.assignmentDueDate,
    required this.assignmentSubmitted,
    required this.assignmentCourse,
    required this.assignmentInstructions,
  }) : super(key: key);

  @override
  _AssignmentDetailsScreenState createState() =>
      _AssignmentDetailsScreenState();
}

class _AssignmentDetailsScreenState extends State<AssignmentDetailsScreen> {
  String? _attachmentPath;
  IconData? _attachmentIcon;
  String? _attachmentFileName;

  Future<void> _pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      var file = result.files.single;
      setState(() {
        _attachmentPath = file.path!;
        _attachmentIcon = _getAttachmentIcon(file.extension);
        _attachmentFileName = file.name;
      });
    }
  }

  IconData _getAttachmentIcon(String? extension) {
    switch (extension) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      default:
        return Icons.image;
    }
  }

  Widget _buildAttachmentIndicator() {
    if (_attachmentPath != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                _attachmentIcon!,
                size: 24,
                color: Colors.blue,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                _attachmentFileName!,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: _pickDocument,
                icon: const Icon(
                  Icons.attach_file,
                ),
              ),
              TextButton(
                onPressed: _pickDocument,
                child: Text(
                  'Attach',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: _pickDocument,
            icon: const Icon(
              Icons.attach_file,
            ),
          ),
          TextButton(
            onPressed: _pickDocument,
            child: Text(
              'Attach File',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      );
    }
  }

  void _submitAssignment() {
    // Handle submission logic here
    print('Assignment submitted');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.assignmentCourse,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text(
              widget.assignmentName,
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Due ${DateFormat("d MMM y, h:mm a").format(widget.assignmentDueDate)}',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              'Instructions:',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.assignmentInstructions,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'My Work',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            _buildAttachmentIndicator(),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: _submitAssignment,
              child: Text(
                'Submit',
                style: GoogleFonts.inter(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
