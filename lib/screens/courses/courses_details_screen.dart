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

class _CoursesDetailsScreenState extends State<CoursesDetailsScreen> {
  late final ScrollController _activityTabController;
  late final ScrollController _filesTabController;

  @override
  void initState() {
    super.initState();
    _activityTabController = ScrollController();
    _filesTabController = ScrollController();
  }

  @override
  void dispose() {
    _activityTabController.dispose();
    _filesTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 150.0,
                floating: false,
                pinned: true,
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
            ];
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: TabBarView(
              children: [
                ActivityTab(course: widget.course, scrollController: _activityTabController),
                FilesTab(course: widget.course, scrollController: _filesTabController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
