import 'package:flutter/material.dart';
import 'package:nmims_app/models/category_item_model.dart';
import 'package:nmims_app/widgets/app_bar.dart';
import 'package:nmims_app/widgets/home_screen_widgets/category_item.dart';
import 'package:nmims_app/widgets/home_screen_widgets/quick_info_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
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
                QuickInfoCards(text: 'New \nAnnouncements', number: 2),
                SizedBox(height: 20),
                QuickInfoCards(text: 'Pending \nAssignments', number: 3),
                SizedBox(height: 30),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color(0xFFFF6161),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
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
                    categoryScreen: categories[index].categoryScreen,
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
