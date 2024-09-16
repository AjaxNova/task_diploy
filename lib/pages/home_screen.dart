import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_aug/constants/colors.dart';
import 'package:flutter_test_aug/pages/cart_page.dart';
import 'package:flutter_test_aug/pages/home.dart';
import 'package:flutter_test_aug/pages/static_page.dart';

class HomeScreenButtons extends StatefulWidget {
  const HomeScreenButtons({super.key});

  @override
  State<HomeScreenButtons> createState() => _HomeScreenButtonsState();
}

int currentIndex = 4;

final List<Widget> allPages = [
  const StaticScreens(pageName: "category"),
  const StaticScreens(pageName: "favorites"),
  const Cartpage(),
  const StaticScreens(pageName: "account"),
  Homescreen()
];

class _HomeScreenButtonsState extends State<HomeScreenButtons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: fabBottonColor,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.home_outlined,
          color: Colors.white60,
        ),
        onPressed: () {
          setState(() {
            currentIndex = 4;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        inactiveColor: bottomnavIconColor,
        activeColor: bottomnavIconColor,
        height: MediaQuery.of(context).size.height * 0.09,
        backgroundColor: bottomNavBackground,
        icons: const [
          Icons.square,
          Icons.favorite_border,
          Icons.shopping_cart,
          Icons.person
        ],
        activeIndex: currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        onTap: (index) {
          if (index != 2) {
            setState(() {
              currentIndex = index;
            });
          } else {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Cartpage(),
            ));
          }
        },
      ),
      body: allPages[currentIndex],
    );
  }
}
