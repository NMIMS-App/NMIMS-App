import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nmims_app/models/category_item_model.dart';
import 'package:nmims_app/widgets/app_bar.dart';
import 'package:nmims_app/widgets/category_item.dart';
import 'package:nmims_app/widgets/home_page_widgets/quick_info_cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Column(
              children: [
                QuickInfoCards(text: 'Attendance', number: 3),
                SizedBox(height: 20),
                QuickInfoCards(text: 'Pending \nAssignments', number: 80),
                SizedBox(height: 30),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color(0xFFFF6161),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(35),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 30,
                ),
                itemBuilder: (context, index) {
                  return CategoryItem(
                    categoryName: categories[index].categoryName,
                    categoryIcon: categories[index].categoryIcon,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
