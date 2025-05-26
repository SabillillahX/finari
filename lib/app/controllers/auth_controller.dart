import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../widgets/custom_snackbar.dart'; // Import widget snackbar
import '../routes/app_pages.dart';

class AuthController extends GetxController {
  var isSkipIntro = false.obs;
  var isAuth = false.obs;
  var isPasswordHidden = true.obs;
  var userRole = ''.obs; // Add user role variable

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;
  var isLogin = true.obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    checkIfSkippedIntro();
    checkAuthStatus();
  }

  void checkIfSkippedIntro() {
    isSkipIntro.value = box.read('skipIntro') ?? false;
  }

  void checkAuthStatus() {
    isAuth.value = box.read('isAuth') ?? false;
    userRole.value = box.read('userRole') ?? '';
  }

  void skipIntroduction() {
    box.write('skipIntro', true);
    isSkipIntro.value = true;
  }

  bool validateInput() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty) {
      CustomToast.show(
        title: "Perhatian!",
        message: "Email tidak boleh kosong",
        icon: Icons.error,
        backgroundColor: Colors.redAccent.withOpacity(0.9),
        textColor: Colors.white,
      );
      return false;
    }

    if (password.isEmpty) {
      CustomToast.show(
        title: "Perhatian!",
        message: "Password tidak boleh kosong",
        icon: Icons.error,
        backgroundColor: Colors.redAccent.withOpacity(0.9),
        textColor: Colors.white,
      );
      return false;
    }

    return true;
  }

  void login() {
    if (!validateInput()) return;

    isLoading.value = true;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Here you would typically make an API call to verify credentials
    // For demo purposes, we'll use hardcoded credentials to demonstrate role-based auth

    Future.delayed(Duration(seconds: 2), () {
      if (email == 'i@i.com' && password == '1234') {
        // Investor login
        _saveUserSession('investor');
        Get.offAllNamed(Routes.INVESTOR_DASHBOARD);
        CustomToast.show(
          title: "Selamat Datang Investor!",
          message: "Login berhasil",
          icon: Icons.check_circle,
          backgroundColor: Colors.green.withOpacity(0.9),
          textColor: Colors.white,
        );
      } else if (email == 'entrepreneur@finari.com' &&
          password == 'entrepreneur123') {
        // Entrepreneur login
        _saveUserSession('entrepreneur');
        Get.offAllNamed(Routes.ENTREPRENEUR_DASHBOARD);
        CustomToast.show(
          title: "Selamat Datang Entrepreneur!",
          message: "Login berhasil",
          icon: Icons.check_circle,
          backgroundColor: Colors.green.withOpacity(0.9),
          textColor: Colors.white,
        );
      } else {
        // Failed login
        CustomToast.show(
          title: "Error!",
          message: "Email atau password salah",
          icon: Icons.error,
          backgroundColor: Colors.redAccent.withOpacity(0.9),
          textColor: Colors.white,
        );
      }

      isLoading.value = false;
    });
  }

  void _saveUserSession(String role) {
    box.write('isAuth', true);
    box.write('userRole', role);
    isAuth.value = true;
    userRole.value = role;
  }

  void logout() {
    box.remove('isAuth');
    box.remove('userRole');
    isAuth.value = false;
    userRole.value = '';
    emailController.clear();
    passwordController.clear();
    Get.offAllNamed(Routes.AUTH);
  }
}
