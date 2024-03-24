import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nmims_app/models/announcements_model.dart';
import 'package:nmims_app/screens/profile/profile_screen.dart';
import 'package:nmims_app/models/summary_attendance_item_model.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
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
              _showAssignmentsSheet(context);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              _showNotificationsSheet(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _showAssignmentsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: ModalRoute.of(context)!.animation!,
            curve: Curves.easeInOut,
          )),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Attendance',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Divider(color: Colors.grey[400]),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: attendance.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              attendance[index].subject,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              'Total Lectures: ${attendance[index].totallecs}\n'
                              'Present Lectures: ${attendance[index].presentlecs}',
                            ),
                          ),
                          Divider(color: Colors.grey[400]),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showNotificationsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: ModalRoute.of(context)!.animation!,
            curve: Curves.easeInOut,
          )),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Notifications',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Divider(color: Colors.grey[400]),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: announcements.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              announcements[index].title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  announcements[index].description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  DateFormat.yMMMd()
                                      .format(announcements[index].date),
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(color: Colors.grey[400]),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
