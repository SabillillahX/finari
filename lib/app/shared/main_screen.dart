import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../modules/entrepreneur/dashboard/views/entrepreneur_dashboard_view.dart';
import '../modules/investor/dashboard/views/investor_dashboard_view.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final AuthController authController = Get.find<AuthController>();

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      String role = authController.userRole.value;

      List<Widget> investorScreens = [
        InvestorDashboardView(),
        PlaceholderWidget('My Investments'), // contoh
        PlaceholderWidget('Investor Profile'),
      ];

      List<Widget> entrepreneurScreens = [
        EntrepreneurDashboardView(),
        PlaceholderWidget('My Campaigns'), // contoh
        PlaceholderWidget('Entrepreneur Profile'),
      ];

      List<BottomNavigationBarItem> investorNavItems = [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
        BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Investments'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ];

      List<BottomNavigationBarItem> entrepreneurNavItems = [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
        BottomNavigationBarItem(icon: Icon(Icons.business_center), label: 'Campaigns'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ];

      return Scaffold(
        body: role == 'investor'
            ? investorScreens[_selectedIndex]
            : entrepreneurScreens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: role == 'investor' ? investorNavItems : entrepreneurNavItems,
        ),
      );
    });
  }
}

class PlaceholderWidget extends StatelessWidget {
  final String text;

  PlaceholderWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
