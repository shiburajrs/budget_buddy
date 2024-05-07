import 'package:budget_buddy/presentation/screens/add_transaction.dart';
import 'package:budget_buddy/presentation/screens/wallet.dart';
import 'package:budget_buddy/utils/colorUtils.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'analysis_page.dart';
import 'category_page.dart';
import 'homepage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  
  int selectedIndex = 0;

  final PageController  _pageController = PageController();

  int _activePage = 0;

  List screens = [ const Homepage(), const AnalysisPage(), const WalletPage() , const CategoryPage()];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.white,
      body:  Padding(
      padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
      child:PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          itemCount: screens.length,
          onPageChanged: (int page) {
            setState(() {
              _activePage = page;
            });
          },
          itemBuilder: (BuildContext context, int index){
            return screens[selectedIndex];
          }
      ),
    ),
    bottomNavigationBar: CustomBottomNavigationBar(
      initialIndex: 0,
      navItems: [
        NavItem(iconData: "home.png", label: ''),
        NavItem(iconData: "graph.png", label: ''),
        NavItem(iconData: "wallet.png", label: ''),
        NavItem(iconData: "category.png", label: ''),
      ],
      onItemSelected: (index) {
        // Handle item selection here
      setState(() {
        selectedIndex = index;
      });
      },
    ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorUtils.primaryColor,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddTransaction()));
          },
          child: Container(child: Icon(Icons.add,color: Colors.white,)),
        )
    );
  }
}
