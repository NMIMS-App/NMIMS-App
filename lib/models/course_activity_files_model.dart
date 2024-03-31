import 'package:flutter/foundation.dart';

class CourseActivityFiles {
  const CourseActivityFiles({
    required this.courseName,
    required this.courseId,
    required this.courseActivityFileName,
    required this.courseActivityTitle,
    required this.dateAdded,
    required this.fileSize,
    required this.fileUrl,
  });

  final String courseName;
  final String courseId;
  final String courseActivityFileName;
  final String courseActivityTitle;
  final DateTime dateAdded;
  final String fileSize;
  final String fileUrl;
}

final files = [
  CourseActivityFiles(
    courseName: 'Operating Systems',
    courseId: 'OS111',
    courseActivityFileName: 'OSProgram.docx',
    courseActivityTitle: 'OS',
    dateAdded: DateTime(2023, 1, 1),
    fileSize: '2 MB',
    fileUrl: 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
  ),
  CourseActivityFiles(
    courseName: 'Operating Systems',
    courseId: 'OS111',
    courseActivityFileName: 'OS_Progam_2.docx',
    courseActivityTitle: 'OS2',
    dateAdded: DateTime(2023, 2, 1),
    fileSize: '2 MB',
    fileUrl: 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
  ),
  CourseActivityFiles(
    courseName: 'Data Structures',
    courseId: 'DS111',
    courseActivityFileName: 'Java Queue Program.pptx',
    courseActivityTitle: 'JavaQueue',
    dateAdded: DateTime(2023, 3, 1),
    fileSize: '3 MB',
    fileUrl: 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
  ),
  CourseActivityFiles(
    courseName: 'Computer Networks',
    courseId: 'CN111',
    courseActivityFileName: 'CNProgram.pdf',
    courseActivityTitle: 'CN',
    dateAdded: DateTime(2023, 4, 1),
    fileSize: '4 MB',
    fileUrl: 'https://example.com/CNProgram.pdf',
  ),
  CourseActivityFiles(
    courseName: 'Computer Networks',
    courseId: 'CN111',
    courseActivityFileName: 'CNProgram2.pdf',
    courseActivityTitle: 'CN2',
    dateAdded: DateTime(2023, 5, 1),
    fileSize: '4 MB',
    fileUrl: '../assets/files/OSProgram.pdf',
  ),
  CourseActivityFiles(
    courseName: 'Mathematics',
    courseId: 'MTH111',
    courseActivityFileName: 'MathEquations.pdf',
    courseActivityTitle: 'Math Equations',
    dateAdded: DateTime(2023, 6, 1),
    fileSize: '3 MB',
    fileUrl: 'https://example.com/MathEquations.pdf',
  ),
  CourseActivityFiles(
    courseName: 'Mathematics',
    courseId: 'MTH111',
    courseActivityFileName: 'AdvancedAlgebra.pdf',
    courseActivityTitle: 'Advanced Algebra',
    dateAdded: DateTime(2023, 7, 1),
    fileSize: '5 MB',
    fileUrl: 'https://example.com/AdvancedAlgebra.pdf',
  ),
  CourseActivityFiles(
    courseName: 'Physics',
    courseId: 'PHY111',
    courseActivityFileName: 'Mechanics.pdf',
    courseActivityTitle: 'Mechanics',
    dateAdded: DateTime(2023, 8, 1),
    fileSize: '6 MB',
    fileUrl: 'https://example.com/Mechanics.pdf',
  ),
  CourseActivityFiles(
    courseName: 'Physics',
    courseId: 'PHY111',
    courseActivityFileName: 'Electromagnetism.pdf',
    courseActivityTitle: 'Electromagnetism',
    dateAdded: DateTime(2023, 9, 1),
    fileSize: '7 MB',
    fileUrl: 'https://example.com/Electromagnetism.pdf',
  ),
];
