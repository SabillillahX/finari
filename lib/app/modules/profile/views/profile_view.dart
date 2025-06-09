import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/auto_responsive.dart';
import '../../../core/utils/dialog_utils.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = AutoResponsive(context);

    return WillPopScope(
      onWillPop: () => DialogUtils.showExitDialog(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: const Color(0xFF2196F3),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Get.back(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Header
              _buildProfileHeader(responsive),
              
              SizedBox(height: responsive.hp(3)),
              
              // Profile Menu Items
              _buildMenuSection(responsive),
              
              SizedBox(height: responsive.hp(3)),
              
              // Account Actions
              _buildAccountActions(responsive),
              
              SizedBox(height: responsive.hp(5)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(AutoResponsive responsive) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(responsive.wp(6)),
      decoration: const BoxDecoration(
        color: Color(0xFF2196F3),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Obx(() => CircleAvatar(
            radius: responsive.wp(12),
            backgroundImage: NetworkImage(
              controller.userAvatar.value.isNotEmpty 
                ? controller.userAvatar.value
                : 'https://ui-avatars.com/api/?name=User&background=0D8ABC&color=fff',
            ),
          )),
          SizedBox(height: responsive.hp(2)),
          Obx(() => Text(
            controller.userName.value,
            style: TextStyle(
              color: Colors.white,
              fontSize: responsive.sp(20),
              fontWeight: FontWeight.w600,
              fontFamily: 'Sora',
            ),
          )),
          SizedBox(height: responsive.hp(0.5)),
          Obx(() => Text(
            controller.userEmail.value,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: responsive.sp(14),
              fontFamily: 'Sora',
            ),
          )),
          SizedBox(height: responsive.hp(1)),
          Obx(() => Container(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.wp(4),
              vertical: responsive.hp(0.5),
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              controller.userRole.value.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: responsive.sp(12),
                fontWeight: FontWeight.w500,
                fontFamily: 'Sora',
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildMenuSection(AutoResponsive responsive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: responsive.wp(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildMenuItem(
            responsive,
            icon: Icons.edit,
            title: 'Edit Profile',
            subtitle: 'Update your personal information',
            onTap: controller.editProfile,
          ),
          _buildDivider(),
          _buildMenuItem(
            responsive,
            icon: Icons.lock,
            title: 'Change Password',
            subtitle: 'Update your account password',
            onTap: controller.changePassword,
          ),
          _buildDivider(),
          _buildMenuItem(
            responsive,
            icon: Icons.settings,
            title: 'Settings',
            subtitle: 'App preferences and configurations',
            onTap: controller.showSettings,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    AutoResponsive responsive, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: responsive.wp(4),
        vertical: responsive.hp(1),
      ),
      leading: Container(
        padding: EdgeInsets.all(responsive.wp(2.5)),
        decoration: BoxDecoration(
          color: const Color(0xFF2196F3).withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: const Color(0xFF2196F3),
          size: responsive.sp(20),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: responsive.sp(16),
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1A1A1A),
          fontFamily: 'Sora',
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: responsive.sp(12),
          color: const Color(0xFF757575),
          fontFamily: 'Sora',
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: const Color(0xFF757575),
        size: responsive.sp(16),
      ),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 1,
      color: const Color(0xFFF0F0F0),
    );
  }

  Widget _buildAccountActions(AutoResponsive responsive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: responsive.wp(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: responsive.wp(4),
              vertical: responsive.hp(1),
            ),
            leading: Container(
              padding: EdgeInsets.all(responsive.wp(2.5)),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.logout,
                color: Colors.red,
                size: responsive.sp(20),
              ),
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: responsive.sp(16),
                fontWeight: FontWeight.w600,
                color: Colors.red,
                fontFamily: 'Sora',
              ),
            ),
            subtitle: Text(
              'Sign out from your account',
              style: TextStyle(
                fontSize: responsive.sp(12),
                color: const Color(0xFF757575),
                fontFamily: 'Sora',
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: const Color(0xFF757575),
              size: responsive.sp(16),
            ),
            onTap: controller.showLogoutConfirmation,
          ),
        ],
      ),
    );
  }
}
