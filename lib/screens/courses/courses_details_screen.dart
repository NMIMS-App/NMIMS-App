import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nmims_app/models/courses_model.dart';
import 'package:nmims_app/screens/courses/activity_tab.dart';
import 'package:nmims_app/screens/courses/files_tab.dart';

class CoursesDetailsScreen extends StatefulWidget {
  const CoursesDetailsScreen({
    Key? key,
    required this.course,
  }) : super(key: key);

  final Course course;

  @override
  State<CoursesDetailsScreen> createState() => _CoursesDetailsScreenState();
}

class _CoursesDetailsScreenState extends State<CoursesDetailsScreen> with SingleTickerProviderStateMixin {
  late final ScrollController _activityTabController;
  late final ScrollController _filesTabController;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _activityTabController = ScrollController();
    _filesTabController = ScrollController();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _activityTabController.dispose();
    _filesTabController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Course Details',
          textAlign: TextAlign.left,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          dividerColor: Colors.transparent,
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          labelStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          overlayColor: MaterialStateProperty.all(
            const Color.fromARGB(70, 0, 0, 0),
          ),
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(
              text: 'Posts',
              icon: Icon(
                Icons.assignment,
                color: Colors.black,
              ),
            ),
            Tab(
              text: 'Files',
              icon: Icon(
                Icons.folder,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ActivityTab(course: widget.course, scrollController: _activityTabController),
          FilesTab(course: widget.course, scrollController: _filesTabController),
        ],
      ),
    );
  }
}
