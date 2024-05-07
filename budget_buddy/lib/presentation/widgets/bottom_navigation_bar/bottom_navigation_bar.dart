import 'package:budget_buddy/utils/colorUtils.dart';
import 'package:flutter/material.dart';

import '../../../utils/assetUtils.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int initialIndex;
  final List<NavItem> navItems;
  final Function(int) onItemSelected;

  const CustomBottomNavigationBar({
    required this.initialIndex,
    required this.navItems,
    required this.onItemSelected,
  });

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.2),
        //     //blurRadius: 6,
        //    // offset: Offset(0, -3),
        //   ),
        // ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(widget.navItems.length, (index) {
          NavItem navItem = widget.navItems[index];
          bool isSelected = index == _selectedIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
              widget.onItemSelected(index);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AssetUtils.dashboardIconPath+navItem.iconData,height: 25,width: 25, fit: BoxFit.cover,
                color:  isSelected ? ColorUtils.primaryColor : Colors.grey.withOpacity(0.5),),
                const SizedBox(height: 5),
                Text(
                  navItem.label,
                  style: TextStyle(
                    color: isSelected ? Colors.blue : Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class NavItem {
  final String iconData;
  final String label;

  NavItem({required this.iconData, required this.label});
}
