import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../widgets/app_bar.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: SfPdfViewer.network(
            'https://firebasestorage.googleapis.com/v0/b/nmims-portal-app.appspot.com/o/Time%20Tables%2FMy%20Final%20Timetable.pdf?alt=media&token=029cdb8d-df6d-4354-8014-2ccfa8606171'));
  }
}
