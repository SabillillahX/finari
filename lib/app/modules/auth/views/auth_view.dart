import 'package:fe_hajifund/app/widgets/custom_button.dart';
import 'package:fe_hajifund/app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../core/utils/auto_responsive.dart';

class AuthView extends GetView<AuthController> {
  final AuthController controller = Get.put(AuthController());

  AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    final responsive = AutoResponsive(context);
    
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
              padding: EdgeInsets.all(responsive.wp(5.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logo/hajifund.png",
                    width: responsive.wp(40),
                  ),
                  SizedBox(height: responsive.hp(1.5)),
                  Text(
                    'Masuk Akun',
                    style: TextStyle(
                      fontSize: responsive.sp(20),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: responsive.hp(1.2)),
                  Text(
                    'Lengkapi Informasi dibawah ini',
                    style: TextStyle(
                      fontSize: responsive.sp(12),
                      color: Color(0xFF011936),
                    ),
                  ),
                  SizedBox(height: responsive.hp(2.5)),
            
                  // Using the updated CustomTextField with built-in label
                  CustomTextField(
                    controller: controller.emailController,
                    hint: "Masukan email",
                    label: "Email *", // Pass the label text directly
                  ),
                  SizedBox(height: responsive.hp(2)),
                  CustomTextField(
                    controller: controller.passwordController,
                    hint: "Masukan kata sandi",
                    isPassword: true,
                    label: "Kata Sandi *", // Pass the label text directly
                  ),
                  SizedBox(height: responsive.hp(1.2)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Lupa Kata Sandi?",
                      style: TextStyle(
                        color: Colors.blue, 
                        fontFamily: '',
                        fontSize: responsive.sp(12),
                      ),
                    ),
                  ),
                  SizedBox(height: responsive.hp(2.5)),
            
                  // Button Masuk
                  CustomButton(),
                  SizedBox(height: responsive.hp(1.2)),
            
                  // Daftar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum punya akun?',
                        style: TextStyle(
                          fontSize: responsive.sp(12),
                        ),
                      ),
                      SizedBox(width: responsive.wp(0.7)),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Daftar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: responsive.sp(12),
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
