import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nmims_app/widgets/category_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                // Add your assignments icon tap logic here
              },
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Text.rich(
                  TextSpan(
                    text: 'B.Tech Computer - ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'SEM V',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.assignment,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                // Add your attendance icon tap logic here
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.touch_app,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                // Add your attendance icon tap logic here
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                // Add your announcements icon tap logic here
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 50,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Stack(
                        clipBehavior: Clip.hardEdge,
                        children: [
                          Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFFFF5F5F),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Attendance',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: -20,
                            top: -20,
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF58585A),
                              ),
                              child: const Center(
                                child: Text(
                                  '80',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Stack(
                        clipBehavior: Clip.hardEdge,
                        children: [
                          Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFFFF5F5F),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Pending \nAssignments',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: -20,
                            top: -20,
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF58585A),
                              ),
                              child: const Center(
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xFFFF6161),
              ),
              height: 800,
              width: double.infinity,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                padding: const EdgeInsets.all(25),
                children: const [
                  CategoryItem(
                    categoryName: 'Attendance',
                    categoryIcon: Icons.touch_app,
                  ),
                  CategoryItem(
                    categoryName: 'Assignments',
                    categoryIcon: Icons.assignment,
                  ),
                  CategoryItem(
                    categoryName: 'Announcements',
                    categoryIcon: Icons.notifications,
                  ),
                  CategoryItem(
                    categoryName: 'Time Table',
                    categoryIcon: Icons.table_chart,
                  ),
                  CategoryItem(
                    categoryName: 'Syllabus',
                    categoryIcon: Icons.book,
                  ),
                  CategoryItem(
                    categoryName: 'Results',
                    categoryIcon: Icons.assessment,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
