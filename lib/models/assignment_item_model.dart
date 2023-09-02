class Assignment {
  Assignment({
    required this.assignmentName,
    required this.assignmentLink,
    required this.assignmentDueDate,
    required this.assignmentSubmitted,
    required this.assignmentCourse,
  });

  String assignmentName;
  String assignmentLink;
  DateTime assignmentDueDate;
  bool assignmentSubmitted;
  String assignmentCourse;
}

final assignments = [
  Assignment(
    assignmentName: 'Assignment 1',
    assignmentLink: 'https://www.google.com',
    assignmentDueDate: DateTime(2021, 12, 12), // 12/12/2021
    assignmentSubmitted: true,
    assignmentCourse: 'Android Development',
  ),
  Assignment(
    assignmentName: 'Assignment 2',
    assignmentLink: 'https://www.google.com',
    assignmentDueDate: DateTime(2021, 11, 5), // 12/12/2021
    assignmentSubmitted: false,
    assignmentCourse: 'Maths',
  ),
  Assignment(
    assignmentName: 'Assignment 3',
    assignmentLink: 'https://www.google.com',
    assignmentDueDate: DateTime(2021, 1, 3), // 12/12/2021
    assignmentSubmitted: false,
    assignmentCourse: 'English',
  ),
];
