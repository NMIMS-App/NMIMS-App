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
    courseActivityFileName: 'OS Program',
    courseActivityTitle: 'OS.docx',
    dateAdded: 'September 1, 2023',
    fileSize: '2 MB',
  ),
  CourseActivityFiles(
    courseName: 'Operating Systems',
    courseId: 'OS111',
    courseActivityFileName: 'OS Program 2',
    courseActivityTitle: 'OS2.docx',
    dateAdded: 'September 1, 2023',
    fileSize: '2 MB',
  ),
  CourseActivityFiles(
    courseName: 'Data Structures',
    courseId: 'DS111',
    courseActivityFileName: 'Java Queue Program',
    courseActivityTitle: 'JavaQueue.pptx',
    dateAdded: 'September 2, 2023',
    fileSize: '3 MB',
  ),
  CourseActivityFiles(
    courseName: 'Computer Networks',
    courseId: 'CN111',
    courseActivityFileName: 'CN Program',
    courseActivityTitle: 'CN.pdf',
    dateAdded: 'September 3, 2023',
    fileSize: '4 MB',
  ),
  CourseActivityFiles(
    courseName: 'Computer Networks',
    courseId: 'CN111',
    courseActivityFileName: 'CN Program 2',
    courseActivityTitle: 'CN2.pdf',
    dateAdded: 'September 3, 2023',
    fileSize: '4 MB',
  ),
];
