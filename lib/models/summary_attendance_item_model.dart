class Attendance {
Attendance({
required this.subject,
required this.totallecs,
required this.presentlecs,
});

String subject;
int totallecs;
int presentlecs;

}

final attendance = [
Attendance(
subject: 'supervisory control and data acquisition',
totallecs: 3,
presentlecs: 2,
),

Attendance(
subject: 'Mobile Application Development',
totallecs: 5,
presentlecs: 5,
),

Attendance(
subject: 'Computer Networks',
totallecs: 2,
presentlecs: 0,
),

Attendance(
subject: 'Artificial Intelligence',
totallecs: 6,
presentlecs: 3,
),

Attendance(
subject: 'Image and Video Processing',
totallecs: 4,
presentlecs: 4,
),

Attendance(
subject: 'Operating Systems',
totallecs: 7,
presentlecs: 6,
),

Attendance(
subject: 'Probability and Statistics',
totallecs: 6,
presentlecs: 6,
),



];