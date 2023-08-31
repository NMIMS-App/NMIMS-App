// custom_app_bar.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
