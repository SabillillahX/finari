import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../core/utils/dialog_utils.dart';
import '../../../controllers/auth_controller.dart';

class ProfileController extends GetxController {
  final box = GetStorage();
  
  // Observable variables for user data
  var userName = ''.obs;
  var userEmail = ''.obs;
  var userRole = ''.obs;
  var userAvatar = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void loadUserData() {
    // Load user data from storage
    userRole.value = box.read('userRole') ?? '';
    
    // Load user data if available
    final userData = box.read('userData');
    if (userData != null) {
      userName.value = userData['name'] ?? 'User';
      userEmail.value = userData['email'] ?? 'user@example.com';
    } else {
      // Default values based on role for demo
      if (userRole.value == 'investor') {
        userName.value = 'Deny Arifin';
        userEmail.value = 'i@i.com';
        userAvatar.value = 'https://ui-avatars.com/api/?name=Deny+Arifin&background=0D8ABC&color=fff';
      } else if (userRole.value == 'entrepreneur') {
        userName.value = 'Entrepreneur';
        userEmail.value = 'entrepreneur@finari.com';
        userAvatar.value = 'https://ui-avatars.com/api/?name=Entrepreneur&background=FF6B35&color=fff';
      }
    }
  }

  void showLogoutConfirmation() async {
    final shouldLogout = await DialogUtils.showLogoutDialog();
    if (shouldLogout == true) {
      final authController = Get.find<AuthController>();
      authController.logout();
    }
  }

  void editProfile() {
    // TODO: Implement edit profile functionality
    Get.snackbar(
      'Info',
      'Edit profile functionality will be implemented soon',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void changePassword() {
    // TODO: Implement change password functionality
    Get.snackbar(
      'Info',
      'Change password functionality will be implemented soon',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void showSettings() {
    // TODO: Implement settings functionality
    Get.snackbar(
      'Info',
      'Settings functionality will be implemented soon',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
