import 'dart:ffi';

class TabularAttendance {
  TabularAttendance({
    required this.subject,
    required this.date,
    required this.time,
    required this.pa,
  });

  String subject;
  DateTime date;
  String time;
  String pa;

}

final t_attendance = [
  TabularAttendance(
    subject: 'supervisory control and data acquisition',
    date: DateTime(2023,12,1),
    time: "3:00pm - 4:00pm",
    pa: 'P',
  ),

  TabularAttendance(
    subject: 'Mobile Application Development',
    date: DateTime(2023,12,1),
    time: "3:00pm - 4:00pm",
    pa: 'A',
  ),

  TabularAttendance(
    subject: 'Computer Networks',
    date: DateTime(2023,12,1),
    time: "3:00pm - 4:00pm",
    pa: 'P',
  ),

  TabularAttendance(
    subject: 'Artificial Intelligence',
    date: DateTime(2023,12,1),
    time: "3:00pm - 4:00pm",
    pa: 'A',
  ),

  TabularAttendance(
    subject: 'Image and Video Processing',
    date: DateTime(2023,12,1),
    time: "3:00pm - 4:00pm",
    pa: 'P',
  ),

  TabularAttendance(
    subject: 'Operating Systems',
    date: DateTime(2023,12,1),
    time: "3:00pm - 4:00pm",
    pa: 'P',
  ),

  TabularAttendance(
    subject: 'Probability and Statistics',
    date: DateTime(2023,12,1),
    time: "3:00pm - 4:00pm",
    pa: 'P',
  ),



];