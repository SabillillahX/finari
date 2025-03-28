import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isButtonEnabled = false;

  void checkFields() {
    setState(() {
      isButtonEnabled =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(checkFields);
    passwordController.addListener(checkFields);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              "assets/logo/hajifund.png",
              width: MediaQuery.of(context).size.width * 1,
            ),

            const SizedBox(height: 5),

            // Title
            const Text(
              "Masuk Akun",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 4),

            // Subtitle
            const Text(
              "Lengkapi informasi dibawah ini",
              style: TextStyle(fontSize: 14, color: Color(0xFFB39F53)),
            ),

            const SizedBox(height: 24),

            // Email Field
            buildInputField("Email", "Masukkan email", emailController, false),

            const SizedBox(height: 16),

            // Password Field
            buildInputField(
              "Kata Sandi",
              "Masukkan kata sandi",
              passwordController,
              true,
            ),

            const SizedBox(height: 8),

            // Lupa Kata Sandi?
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Get.toNamed('/forgot-password');
                },
                child: const Text(
                  "Lupa Kata Sandi?",
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Login Button
            ElevatedButton(
              onPressed: isButtonEnabled ? () => Get.toNamed('/home') : null,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isButtonEnabled ? Color(0xFFB39F53) : Colors.grey,
                disabledBackgroundColor: Color(0xFFB39F53),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Masuk",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),

            const SizedBox(height: 16),

            // Register Navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Belum punya akun? "),
                GestureDetector(
                  onTap: () => Get.toNamed('/register'),
                  child: const Text(
                    "Daftar Sekarang",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk Input Field
  Widget buildInputField(
    String label,
    String hint,
    TextEditingController controller,
    bool isPassword,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label *",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: isPassword ? !isPasswordVisible : false,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon:
                isPassword
                    ? IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    )
                    : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
      ],
    );
  }
}
