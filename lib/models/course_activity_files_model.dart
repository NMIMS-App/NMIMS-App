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
  final String dateAdded;
  final String fileSize;
}

const files = [
  CourseActivityFiles(
    courseName: 'Operating Systems',
    courseId: 'OS111',
    courseActivityFileName: 'OSProgram.docx',
    courseActivityTitle: 'OS',
    dateAdded: 'September 1, 2023',
    fileSize: '2 MB',
  ),
  CourseActivityFiles(
    courseName: 'Operating Systems',
    courseId: 'OS111',
    courseActivityFileName: 'OS_Progam_2.docx',
    courseActivityTitle: 'OS2',
    dateAdded: 'September 1, 2023',
    fileSize: '2 MB',
  ),
  CourseActivityFiles(
    courseName: 'Data Structures',
    courseId: 'DS111',
    courseActivityFileName: 'Java Queue Program.pptx',
    courseActivityTitle: 'JavaQueue',
    dateAdded: 'September 2, 2023',
    fileSize: '3 MB',
  ),
  CourseActivityFiles(
    courseName: 'Computer Networks',
    courseId: 'CN111',
    courseActivityFileName: 'CNProgram.pdf',
    courseActivityTitle: 'CN',
    dateAdded: 'September 3, 2023',
    fileSize: '4 MB',
  ),
  CourseActivityFiles(
    courseName: 'Computer Networks',
    courseId: 'CN111',
    courseActivityFileName: 'CNProgram2.pdf',
    courseActivityTitle: 'CN2',
    dateAdded: 'September 3, 2023',
    fileSize: '4 MB',
  ),
];
