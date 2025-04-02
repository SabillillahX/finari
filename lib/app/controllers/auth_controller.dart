import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  var isSkipIntro = false.obs;
  var isAuth = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;
  var isLogin = true.obs;

  // Add GetStorage instance
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    checkIfSkippedIntro();
  }

  void checkIfSkippedIntro() {
    // Check if introduction has been shown before
    isSkipIntro.value = box.read('skipIntro') ?? false;
  }

  void skipIntroduction() {
    // Save to storage that intro has been shown
    box.write('skipIntro', true);
    isSkipIntro.value = true;
  }

  void toggleAuthMode() {
    isLogin.value = !isLogin.value;
  }

  Future<void> login() async {
    isLoading.value = true;
    final url = Uri.parse('https://yourapi.com/login');
    try {
      final response = await http.post(
        url,
        body: {
          'email': emailController.text,
          'password': passwordController.text,
        },
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // Set auth state and save token if received
        isAuth.value = true;
        if (data['token'] != null) {
          box.write('token', data['token']);
        }
        Get.snackbar("Success", "Login Berhasil");
        Get.offAllNamed('/home'); // Navigate to home after successful login
      } else {
        Get.snackbar("Error", data['message'] ?? "Login Gagal");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan, coba lagi");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> register() async {
    isLoading.value = true;
    final url = Uri.parse('https://yourapi.com/register');
    try {
      final response = await http.post(
        url,
        body: {
          'email': emailController.text,
          'password': passwordController.text,
        },
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.snackbar("Success", "Registrasi Berhasil");
        toggleAuthMode();
      } else {
        Get.snackbar("Error", data['message'] ?? "Registrasi Gagal");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan, coba lagi");
    } finally {
      isLoading.value = false;
    }
  }
}
