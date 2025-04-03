import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../widgets/custom_snackbar.dart'; // Import widget snackbar

class AuthController extends GetxController {
  var isSkipIntro = false.obs;
  var isAuth = false.obs;
  var isPasswordHidden = true.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;
  var isLogin = true.obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    checkIfSkippedIntro();
  }

  void checkIfSkippedIntro() {
    isSkipIntro.value = box.read('skipIntro') ?? false;
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
  }
}
