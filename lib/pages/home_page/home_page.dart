import 'package:flutter/material.dart';

import 'package:food_delivery_mobile_application/themes/colors.dart';
import 'package:food_delivery_mobile_application/utilities/dimensions.dart';

import 'package:food_delivery_mobile_application/pages/food_page/main_food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List pages = [MainFoodPage(), Container()];

  void onNavigationItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: AppColors.primaryColor,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home,
              size: Dimensions.height(38.0),
            ),
          ),
          BottomNavigationBarItem(
            label: "Archive",
            icon: Icon(
              Icons.archive,
              size: Dimensions.height(38.0),
            ),
          ),
          BottomNavigationBarItem(
            label: "Shopping cart",
            icon: Icon(
              Icons.shopping_cart,
              size: Dimensions.height(38.0),
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(
              Icons.person,
              size: Dimensions.height(38.0),
            ),
          ),
        ],
      ),
    );
  }
}
