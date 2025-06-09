import 'package:fe_hajifund/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/auto_responsive.dart';
import '../controllers/role_selection_controller.dart';

class RoleSelectionView extends GetView<RoleSelectionController> {
  const RoleSelectionView({super.key});
  
  @override
  Widget build(BuildContext context) {
    final responsive = AutoResponsive(context);

    return WillPopScope(
      onWillPop: () async {
        // Handle back button press
        Get.back(); // Navigate back
        return false; // Prevent default back action
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, size: responsive.wp(6)),
            onPressed: () {
              Get.back(); // Navigate back
            },
          ),
          title: const Text(
            'Daftar Akun',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(responsive.wp(4)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Pilih jenis akun yang ingin dibuat',
                  style: TextStyle(
                    fontSize: responsive.sp(14),
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF011936),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: responsive.hp(4)),
      
                // Investor Card
                _buildRoleCard(
                  responsive: responsive,
                  title: 'Daftar Sebagai Investor',
                  icon: Icons.trending_up,
                  color: Colors.blue,
                  onTap: () {
                    try {
                      print('Navigating to investor register'); // Debug
                      Get.toNamed(Routes.INVESTOR_REGISTER); // Direct route
                    } catch (e) {
                      print('Navigation error: $e');
                      // Fallback navigation
                      Get.snackbar(
                        'Error', 
                        'Halaman belum tersedia',
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                ),
      
                SizedBox(height: responsive.hp(3)),
      
                // Entrepreneur Card
                _buildRoleCard(
                  responsive: responsive,
                  title: 'Daftar Sebagai Pengusaha',
                  icon: Icons.business_center,
                  color: Colors.grey,
                  onTap: () {
                    try {
                      print('Navigating to entrepreneur register'); // Debug
                      Get.toNamed(Routes.ENTREPRENEUR_REGISTER); // Direct route
                    } catch (e) {
                      print('Navigation error: $e');
                      // Fallback navigation
                      Get.snackbar(
                        'Error', 
                        'Halaman belum tersedia',
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                ),  
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard({
    required AutoResponsive responsive,
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: responsive.wp(4),
          vertical: responsive.hp(2),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(responsive.wp(3)),
          border: Border.all(
            color: color.withOpacity(0.3),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon and Title Row
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(responsive.wp(1)),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(responsive.wp(3)),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: responsive.wp(8),
                  ),
                ),
                SizedBox(width: responsive.wp(4)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: responsive.sp(12),
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF011936),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: responsive.wp(4), 
                )
              ],
            ),
            // You can add more widgets here if needed, such as subtitle or description
          ],
        ),
      ),
    );
  }
}
