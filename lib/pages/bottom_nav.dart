import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/pages/homepage.dart';
import 'package:pharmacy/pages/order_page.dart';
import 'package:pharmacy/pages/profile_page.dart';
import 'package:pharmacy/pages/wallet_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late List<Widget> pages;

  late HomePage homePage;
  late OrderPage orderPage;
  late WalletPage walletPage;
  late ProfilePage profilePage;

  int currentTabIndex = 0;
  @override
  void initState() {
    homePage = HomePage();
    orderPage = OrderPage();
    walletPage = WalletPage();
    profilePage = ProfilePage();
    super.initState();

    pages = [homePage, orderPage, walletPage, profilePage];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: Color.fromARGB(255, 228, 207, 130),
        color: const Color.fromARGB(253, 112, 105, 10),
        animationDuration: Duration(milliseconds: 500),

        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: [
          currentTabIndex == 0
              ? Icon(Icons.home, color: Colors.white)
              : Icon(Icons.home, color: Colors.white),
          currentTabIndex == 1
              ? Icon(Icons.shopping_basket_sharp, color: Colors.white)
              : Icon(Icons.shopping_bag_sharp, color: Colors.white),
          currentTabIndex == 2
              ? Icon(Icons.wallet, color: Colors.white)
              : Icon(Icons.wallet, color: Colors.white),
          currentTabIndex == 3
              ? Icon(Icons.person_outlined, color: Colors.white)
              : Icon(Icons.person_outlined, color: Colors.white),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
