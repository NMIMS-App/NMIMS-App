class Assignments {
  Assignments({
    required this.assignmentName,
    required this.assignmentLink,
    required this.assignmentDueDate,
    required this.assignmentSubmitted,
  });

  String assignmentName;
  String assignmentLink;
  String assignmentDueDate;
  bool assignmentSubmitted;
}

final assignments = [
  Assignments(
    assignmentName: 'Assignment 1',
    assignmentLink: 'https://www.google.com',
    assignmentDueDate: 'Due Date: 12/12/2021',
    assignmentSubmitted: true,
  ),
  Assignments(
    assignmentName: 'Assignment 2',
    assignmentLink: 'https://www.google.com',
    assignmentDueDate: 'Due Date: 12/12/2021',
    assignmentSubmitted: false,
  ),
  Assignments(
    assignmentName: 'Assignment 3',
    assignmentLink: 'https://www.google.com',
    assignmentDueDate: 'Due Date: 12/12/2021',
    assignmentSubmitted: false,
  ),
  Assignments(
    assignmentName: 'Assignment 4',
    assignmentLink: 'https://www.google.com',
    assignmentDueDate: 'Due Date: 12/12/2021',
    assignmentSubmitted: false,
  ),
];
