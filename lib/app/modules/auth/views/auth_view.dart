import 'package:fe_hajifund/app/widgets/custom_button.dart';
import 'package:fe_hajifund/app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';

class AuthView extends GetView<AuthController> {
  final AuthController controller = Get.put(AuthController());

  AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss the keyboard
      },
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logo/hajifund.png",
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Masuk Akun',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Lengkapi Informasi dibawah ini',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      color: Color(0xFFB39F53),
                    ),
                  ),
                  SizedBox(height: 20),
            
                  // Using the updated CustomTextField with built-in label
                  CustomTextField(
                    controller: controller.emailController,
                    hint: "Masukan email",
                    label: "Email *", // Pass the label text directly
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    controller: controller.passwordController,
                    hint: "Masukan kata sandi",
                    isPassword: true,
                    label: "Kata Sandi *", // Pass the label text directly
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Lupa Kata Sandi?",
                      style: TextStyle(color: Colors.blue, fontFamily: ''),
                    ),
                  ),
                  SizedBox(height: 20),
            
                  // Button Masuk
                  CustomButton(),
                  SizedBox(height: 10),
            
                  // Daftar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum punya akun?',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                        ),
                      ),
                      SizedBox(width: 3),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Daftar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
