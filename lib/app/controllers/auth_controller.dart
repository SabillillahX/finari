import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isSkipIntro = false.obs;
  var isAuth = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;
  var isLogin = true.obs;

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
        Get.snackbar("Success", "Login Berhasil");
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
