import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickInfoCards extends StatelessWidget {
  const QuickInfoCards({super.key, required this.text, required this.number});

  final String text;
  final int number;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 20,
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
              child: FractionallySizedBox(
                alignment:
                    const Alignment(-0.5, 0), // Adjust the X alignment here.
                widthFactor: 0.7, // taking 70% of the width
                child: Center(
                  child: Text(
                    number.toString(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
