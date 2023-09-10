class CourseActivityFiles {
  const CourseActivityFiles({
    required this.courseName,
    required this.courseId,
    required this.courseActivityFileName,
    required this.courseActivityTitle,
    required this.dateAdded,
    required this.fileSize,
  });

  final String courseName;
  final String courseId;
  final String courseActivityFileName;
  final String courseActivityTitle;
  final DateTime dateAdded;
  final String fileSize;
}

final files = [
  CourseActivityFiles(
    courseName: 'Operating Systems',
    courseId: 'OS111',
    courseActivityFileName: 'OSProgram.docx',
    courseActivityTitle: 'OS',
    dateAdded: DateTime(2023, 1, 1),
    fileSize: '2 MB',
  ),
  CourseActivityFiles(
    courseName: 'Operating Systems',
    courseId: 'OS111',
    courseActivityFileName: 'OS_Progam_2.docx',
    courseActivityTitle: 'OS2',
    dateAdded: DateTime(2023, 2, 1),
    fileSize: '2 MB',
  ),
  CourseActivityFiles(
    courseName: 'Data Structures',
    courseId: 'DS111',
    courseActivityFileName: 'Java Queue Program.pptx',
    courseActivityTitle: 'JavaQueue',
    dateAdded: DateTime(2023, 3, 1),
    fileSize: '3 MB',
  ),
  CourseActivityFiles(
    courseName: 'Computer Networks',
    courseId: 'CN111',
    courseActivityFileName: 'CNProgram.pdf',
    courseActivityTitle: 'CN',
    dateAdded: DateTime(2023, 4, 1),
    fileSize: '4 MB',
  ),
  CourseActivityFiles(
    courseName: 'Computer Networks',
    courseId: 'CN111',
    courseActivityFileName: 'CNProgram2.pdf',
    courseActivityTitle: 'CN2',
    dateAdded: DateTime(2023, 5, 1),
    fileSize: '4 MB',
  ),
];
