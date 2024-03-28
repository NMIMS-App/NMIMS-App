import 'package:cloud_firestore/cloud_firestore.dart';

class StudentDetails {
  final String studentId;

  // Define variables to store the student data
  String? name;
  String? course;
  String? semester;

  StudentDetails({required this.studentId});

  Future<void> getStudentData() async {
    final db = FirebaseFirestore.instance;
    final studentsCollection = db.collection('students');
    final studentDocument = studentsCollection.doc(studentId);

    try {
      final DocumentSnapshot documentSnapshot = await studentDocument.get();

      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        name = data['Name'] as String?;
        course = data['Course'] as String?;
        semester = data['Semester'] as String?;
      } else {
        name = null;
        course = null;
        semester = null;
      }
    } catch (error) {
      print('Error retrieving document: $error');
      name = null;
      course = null;
      semester = null;
    }
  }
}
