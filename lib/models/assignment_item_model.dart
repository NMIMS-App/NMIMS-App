class Assignment {
  Assignment({
    required this.assignmentName,
    required this.assignmentDueDate,
    required this.assignmentSubmitted,
    required this.assignmentCourse,
    required this.assignmentInstructions,
  });

  String assignmentName;
  DateTime assignmentDueDate;
  bool assignmentSubmitted;
  String assignmentCourse;
  String assignmentInstructions;
}

final assignments = [
  Assignment(
    assignmentName: 'Assignment 1',
    assignmentDueDate: DateTime(2021, 12, 12),
    assignmentSubmitted: true,
    assignmentCourse: 'Android Development',
    assignmentInstructions:
        'Create a simple app that displays a list of assignments',
  ),
  Assignment(
    assignmentName: 'Assignment 2',
    assignmentDueDate: DateTime(2021, 11, 5),
    assignmentSubmitted: false,
    assignmentCourse: 'Maths',
    assignmentInstructions: 'Solve the following questions: 1+1=?',
  ),
  Assignment(
    assignmentName: 'Assignment 3',
    assignmentDueDate: DateTime(2025, 1, 5),
    assignmentSubmitted: false,
    assignmentCourse: 'English',
    assignmentInstructions: 'Write a 500 word essay on your favourite book',
  ),
  Assignment(
    assignmentName: 'Assignment 4',
    assignmentDueDate: DateTime(2021, 12, 12),
    assignmentSubmitted: true,
    assignmentCourse: 'Android Development',
    assignmentInstructions:
        'Create a simple app that displays a list of assignments',
  ),
  Assignment(
    assignmentName: 'Assignment 5',
    assignmentDueDate: DateTime(2023, 11, 5),
    assignmentSubmitted: false,
    assignmentCourse: 'Maths',
    assignmentInstructions: 'Solve the following questions: 1+1=?',
  ),
  Assignment(
    assignmentName: 'Assignment 6',
    assignmentDueDate: DateTime(2021, 1, 3),
    assignmentSubmitted: false,
    assignmentCourse: 'English',
    assignmentInstructions: 'Write a 500 word essay on your favourite book',
  ),
];
