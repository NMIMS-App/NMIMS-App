import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, this.categoryName, this.categoryIcon});

  final String? categoryName;
  final IconData? categoryIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(40), // same as the container's radius
      onTap: () {
        // TODO: Handle tap action here.
        print('$categoryName tapped!');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                categoryIcon,
                size: 60,
                color: Colors.black,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                categoryName!,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
