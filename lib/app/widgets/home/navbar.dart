import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/core/utils/auto_responsive.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  final List<NavBarItem> _items = [
    NavBarItem(icon: Icons.home, label: 'Home'),
    NavBarItem(icon: Icons.wallet, label: 'Wallet'),
    NavBarItem(icon: Icons.notifications, label: 'Notifications'),
    NavBarItem(icon: Icons.person, label: 'Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // You can add navigation here based on index
    // e.g., Get.toNamed('/home') or controller.changePage(index)
  }

  @override
  Widget build(BuildContext context) {
    final AutoResponsive responsive = AutoResponsive(context);

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_items.length, (index) {
          return InkWell(
            onTap: () => _onItemTapped(index),
            splashColor: Colors.blue.withOpacity(0.3),
            highlightColor: Colors.blue.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: _selectedIndex == index
                    ? Colors.blue.withOpacity(0.1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _items[index].icon,
                    color: _selectedIndex == index ? Colors.blue : Colors.grey,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _items[index].label,
                    style: TextStyle(
                      color: _selectedIndex == index ? Colors.blue : Colors.grey,
                      fontSize: 12,
                      fontWeight: _selectedIndex == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class NavBarItem {
  final IconData icon;
  final String label;

  NavBarItem({required this.icon, required this.label});
}