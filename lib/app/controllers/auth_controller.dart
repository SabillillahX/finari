import 'package:fe_hajifund/app/shared/main_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart'; // For kDebugMode
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

  // Tambahkan controllers untuk register
  TextEditingController nameController = TextEditingController();
  TextEditingController emailRegisterController = TextEditingController();
  TextEditingController passwordRegisterController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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

  // Validation untuk register
  bool validateRegisterInput() {
    String name = nameController.text.trim();
    String email = emailRegisterController.text.trim();
    String password = passwordRegisterController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (name.isEmpty) {
      CustomToast.show(
        title: "Perhatian!",
        message: "Nama tidak boleh kosong",
        icon: Icons.error,
        backgroundColor: Colors.redAccent.withOpacity(0.9),
        textColor: Colors.white,
      );
      return false;
    }

    if (name.length < 3) {
      CustomToast.show(
        title: "Perhatian!",
        message: "Nama minimal 3 karakter",
        icon: Icons.error,
        backgroundColor: Colors.redAccent.withOpacity(0.9),
        textColor: Colors.white,
      );
      return false;
    }

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

    if (!GetUtils.isEmail(email)) {
      CustomToast.show(
        title: "Perhatian!",
        message: "Format email tidak valid",
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

    if (password.length < 5) {
      CustomToast.show(
        title: "Perhatian!",
        message: "Password minimal 5 karakter",
        icon: Icons.error,
        backgroundColor: Colors.redAccent.withOpacity(0.9),
        textColor: Colors.white,
      );
      return false;
    }

    if (!_isPasswordComplex(password)) {
      CustomToast.show(
        title: "Perhatian!",
        message:
            "Password harus mengandung huruf besar, huruf kecil, angka, dan karakter khusus",
        icon: Icons.error,
        backgroundColor: Colors.redAccent.withOpacity(0.9),
        textColor: Colors.white,
      );
      return false;
    }

    if (!_isPasswordMediumComplex(password)) {
      CustomToast.show(
        title: "Perhatian!",
        message:
            "Password harus mengandung minimal kombinasi huruf, angka, dan karakter khusus",
        icon: Icons.error,
        backgroundColor: Colors.redAccent.withOpacity(0.9),
        textColor: Colors.white,
      );
      return false;
    }

    if (!_isNotCommonPassword(password)) {
      CustomToast.show(
        title: "Perhatian!",
        message: "Password terlalu umum, gunakan kombinasi yang lebih unik",
        icon: Icons.error,
        backgroundColor: Colors.redAccent.withOpacity(0.9),
        textColor: Colors.white,
      );
      return false;
    }

    if (password != confirmPassword) {
      CustomToast.show(
        title: "Perhatian!",
        message: "Password konfirmasi tidak cocok",
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
      } else if (email == 'e@e.com' && password == '12345') {
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

  // Main register function
  Future<void> register(String role) async {
    if (!validateRegisterInput()) return;

    isLoading.value = true;

    try {
      if (kDebugMode) {
        // Debug mode - simulasi registrasi berhasil
        print('DEBUG MODE: Registering as $role');

        await Future.delayed(Duration(seconds: 2)); // Simulasi delay API

        _saveUserSession(role);
        _navigateToRoleDashboard(role);

        CustomToast.show(
          title: "Selamat Datang!",
          message: "Registrasi sebagai $role berhasil",
          icon: Icons.check_circle,
          backgroundColor: Colors.green.withOpacity(0.9),
          textColor: Colors.white,
        );

        // Clear form after successful registration
        _clearRegisterForm();
      } else {
        // Production mode - HTTP API call
        final response = await http.post(
          Uri.parse('https://your-api-endpoint.com/api/register'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: json.encode({
            'name': nameController.text.trim(),
            'email': emailRegisterController.text.trim(),
            'password': passwordRegisterController.text.trim(),
            'password_confirmation': confirmPasswordController.text.trim(),
            'role': role,
          }),
        );

        final responseData = json.decode(response.body);

        if (response.statusCode == 200 || response.statusCode == 201) {
          // Registrasi berhasil

          // Save token jika disediakan API
          if (responseData['token'] != null) {
            box.write('authToken', responseData['token']);
          }

          // Save user data jika disediakan API
          if (responseData['user'] != null) {
            box.write('userData', responseData['user']);

            // Update name dari response jika ada
            if (responseData['user']['name'] != null) {
              box.write('userName', responseData['user']['name']);
            }
          }

          _saveUserSession(role);
          _navigateToRoleDashboard(role);

          CustomToast.show(
            title: "Selamat Datang!",
            message:
                responseData['message'] ?? "Registrasi sebagai $role berhasil",
            icon: Icons.check_circle,
            backgroundColor: Colors.green.withOpacity(0.9),
            textColor: Colors.white,
          );

          _clearRegisterForm();
        } else {
          // Registrasi gagal
          String errorMessage = "Registrasi gagal";

          if (responseData['message'] != null) {
            errorMessage = responseData['message'];
          } else if (responseData['errors'] != null) {
            // Handle validation errors dari Laravel
            final errors = responseData['errors'];
            if (errors is Map) {
              errorMessage = errors.values.first.first;
            }
          }

          CustomToast.show(
            title: "Error!",
            message: errorMessage,
            icon: Icons.error,
            backgroundColor: Colors.redAccent.withOpacity(0.9),
            textColor: Colors.white,
          );
        }
      }
    } catch (e) {
      // Handle network atau error lainnya
      CustomToast.show(
        title: "Error!",
        message: "Terjadi kesalahan: ${e.toString()}",
        icon: Icons.error,
        backgroundColor: Colors.redAccent.withOpacity(0.9),
        textColor: Colors.white,
      );
      print('Register error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Register sebagai investor
  Future<void> registerAsInvestor() async {
    await register('investor');
  }

  // Register sebagai entrepreneur
  Future<void> registerAsEntrepreneur() async {
    await register('entrepreneur');
  }

  void _saveUserSession(String role) {
    box.write('isAuth', true);
    box.write('userRole', role);
    isAuth.value = true;
    userRole.value = role;
    Get.offAll(() => MainScreen());
  }

  void logout() {
    box.remove('isAuth');
    box.remove('userRole');
    box.remove('authToken');
    box.remove('userData');
    box.remove('userName');

    isAuth.value = false;
    userRole.value = '';

    // Clear all forms
    emailController.clear();
    passwordController.clear();
    _clearRegisterForm();

    Get.offAllNamed(Routes.AUTH);
  }

  // Helper function untuk navigasi berdasarkan role
  void _navigateToRoleDashboard(String role) {
    if (role == 'investor') {
      Get.offAllNamed(Routes.INVESTOR_DASHBOARD);
    } else if (role == 'entrepreneur') {
      Get.offAllNamed(Routes.ENTREPRENEUR_DASHBOARD);
    } else {
      // Fallback ke auth jika role tidak dikenali
      Get.offAllNamed(Routes.AUTH);
    }
  }

  // Clear form after successful registration
  void _clearRegisterForm() {
    nameController.clear();
    emailRegisterController.clear();
    passwordRegisterController.clear();
    confirmPasswordController.clear();
  }

  // Getter untuk user name dari storage
  String get userName {
    return box.read('userName') ?? 'User';
  }

  // Method untuk update profile name
  void updateUserName(String newName) {
    box.write('userName', newName);
  }

  // API Integration Functions
  Future<void> joinEntrepreneur() async {
    if (kDebugMode) {
      // Debug mode: Navigate directly tanpa panggilan API
      print('DEBUG MODE: Joining as Entrepreneur');
      _saveUserSession('entrepreneur');
      Get.offAllNamed(Routes.ENTREPRENEUR_DASHBOARD);
      CustomToast.show(
        title: "Debug Mode",
        message: "Bergabung sebagai Entrepreneur berhasil",
        icon: Icons.check_circle,
        backgroundColor: Colors.green.withOpacity(0.9),
        textColor: Colors.white,
      );
      return;
    }

    // Production mode: Make HTTP API call
    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse('https://your-api-endpoint.com/api/join-entrepreneur'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
          'role': 'entrepreneur',
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = json.decode(response.body);

        // Assuming the API returns user data and token
        _saveUserSession('entrepreneur');

        // Save additional user data if provided by API
        if (responseData['token'] != null) {
          box.write('authToken', responseData['token']);
        }
        if (responseData['user'] != null) {
          box.write('userData', responseData['user']);
        }

        Get.offAllNamed(Routes.ENTREPRENEUR_DASHBOARD);
        CustomToast.show(
          title: "Selamat Datang!",
          message: "Bergabung sebagai Entrepreneur berhasil",
          icon: Icons.check_circle,
          backgroundColor: Colors.green.withOpacity(0.9),
          textColor: Colors.white,
        );
      } else {
        final errorData = json.decode(response.body);
        CustomToast.show(
          title: "Error!",
          message:
              errorData['message'] ?? "Gagal bergabung sebagai Entrepreneur",
          icon: Icons.error,
          backgroundColor: Colors.redAccent.withOpacity(0.9),
          textColor: Colors.white,
        );
      }
    } catch (e) {
      CustomToast.show(
        title: "Error!",
        message: "Terjadi kesalahan koneksi: ${e.toString()}",
        icon: Icons.error,
        backgroundColor: Colors.redAccent.withOpacity(0.9),
        textColor: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> joinInvestor() async {
    if (kDebugMode) {
      // Debug mode: Navigate directly tanpa panggilan API
      print('DEBUG MODE: Joining as Investor');
      _saveUserSession('investor');
      Get.offAllNamed(Routes.INVESTOR_DASHBOARD);
      CustomToast.show(
        title: "Debug Mode",
        message: "Bergabung sebagai Investor berhasil",
        icon: Icons.check_circle,
        backgroundColor: Colors.green.withOpacity(0.9),
        textColor: Colors.white,
      );
      return;
    }

    // Production mode: Make HTTP API call
    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse('https://your-api-endpoint.com/api/join-investor'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
          'role': 'investor',
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = json.decode(response.body);

        // Assuming the API returns user data and token
        _saveUserSession('investor');

        // Save additional user data if provided by API
        if (responseData['token'] != null) {
          box.write('authToken', responseData['token']);
        }
        if (responseData['user'] != null) {
          box.write('userData', responseData['user']);
        }

        Get.offAllNamed(Routes.INVESTOR_DASHBOARD);
        CustomToast.show(
          title: "Selamat Datang!",
          message: "Bergabung sebagai Investor berhasil",
          icon: Icons.check_circle,
          backgroundColor: Colors.green.withOpacity(0.9),
          textColor: Colors.white,
        );
      } else {
        final errorData = json.decode(response.body);
        CustomToast.show(
          title: "Error!",
          message: errorData['message'] ?? "Gagal bergabung sebagai Investor",
          icon: Icons.error,
          backgroundColor: Colors.redAccent.withOpacity(0.9),
          textColor: Colors.white,
        );
      }
    } catch (e) {
      CustomToast.show(
        title: "Error!",
        message: "Terjadi kesalahan koneksi: ${e.toString()}",
        icon: Icons.error,
        backgroundColor: Colors.redAccent.withOpacity(0.9),
        textColor: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Helper method untuk validasi kompleksitas password
  bool _isPasswordComplex(String password) {
    // Password harus mengandung:
    // - Minimal 1 huruf besar (A-Z)
    // - Minimal 1 huruf kecil (a-z)
    // - Minimal 1 angka (0-9)
    // - Minimal 1 karakter khusus (!@#$%^&*()_+-=[]{}|;:,.<>?)

    RegExp upperCase = RegExp(r'[A-Z]');
    RegExp lowerCase = RegExp(r'[a-z]');
    RegExp numbers = RegExp(r'[0-9]');
    RegExp specialChars = RegExp(r'[!@#$%^&*()_+\-=\[\]{}|;:,.<>?]');

    return upperCase.hasMatch(password) &&
        lowerCase.hasMatch(password) &&
        numbers.hasMatch(password) &&
        specialChars.hasMatch(password);
  }

  // Alternative: Method untuk validasi password medium complexity
  bool _isPasswordMediumComplex(String password) {
    // Password harus mengandung minimal 2 dari 4 kriteria:
    // - Huruf besar, huruf kecil, angka, karakter khusus

    int complexity = 0;

    if (RegExp(r'[A-Z]').hasMatch(password)) complexity++;
    if (RegExp(r'[a-z]').hasMatch(password)) complexity++;
    if (RegExp(r'[0-9]').hasMatch(password)) complexity++;
    if (RegExp(r'[!@#$%^&*()_+\-=\[\]{}|;:,.<>?]').hasMatch(password))
      complexity++;

    return complexity >= 2; // Minimal 2 kriteria terpenuhi
  }

  // Method untuk cek password tidak mengandung kata umum
  bool _isNotCommonPassword(String password) {
    List<String> commonPasswords = [
      'password',
      '123456',
      '12345678',
      'qwerty',
      'abc123',
      'password123',
      '123456789',
      'welcome',
      'admin',
      'user',
      'guest',
      'test',
      'demo',
      'temp',
      'pass',
    ];

    String lowerPassword = password.toLowerCase();

    // Cek apakah password mengandung kata umum
    for (String common in commonPasswords) {
      if (lowerPassword.contains(common)) {
        return false;
      }
    }

    return true;
  }
}
