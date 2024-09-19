import 'package:flutter/material.dart';

class CommonBottomNavigationBar extends StatelessWidget {
  final List<NavigationItem> navItems;
  final TabController tabController;
  final Function(int)? onDestinationSelected;
  final int selectedIndex;

  const CommonBottomNavigationBar(
      {super.key,
      required this.navItems,
      required this.tabController,
      this.onDestinationSelected,
      required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: onDestinationSelected,
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        items: [
          for (var item in navItems)
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Image.asset(width: 25, height: 25, item.icon),
              label: item.name.toString(),
            )
        ]);
  }
}

class NavigationItem {
  String name;
  String icon;
  NavigationItem({required this.name, required this.icon});
}
