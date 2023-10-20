import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nmims_app/screens/logout/logout.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    this.categoryName,
    this.categoryIcon,
    required this.categoryScreen,
  });

  final String? categoryName;
  final IconData? categoryIcon;
  final Widget categoryScreen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: () {
        if (categoryName == 'Log out') {
          const Logout().logout(context);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => categoryScreen,
            ),
          );
        }
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
