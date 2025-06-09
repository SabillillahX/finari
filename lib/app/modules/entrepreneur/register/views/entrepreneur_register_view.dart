import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/auto_responsive.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../controllers/auth_controller.dart';

class EntrepreneurRegisterView extends GetView<AuthController> {
  const EntrepreneurRegisterView({super.key});
  
  @override
  Widget build(BuildContext context) {
    final responsive = AutoResponsive(context);

    return WillPopScope(
      onWillPop: () async{
        Get.back();
        return false;
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Get.back(),
            ),
            title: Text(
              'Daftar Sebagai Pengusaha',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: responsive.sp(16)),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(responsive.wp(5.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Lengkapi informasi di bawah ini untuk bergabung sebagai entrepreneur',
                  style: TextStyle(
                    fontSize: responsive.sp(12),
                    color: const Color(0xFF011936),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: responsive.hp(2.5)),

                // Name Field - Tambahkan field nama yang hilang
                CustomTextField(
                  controller: controller.nameController,
                  hint: "Masukan nama lengkap",
                  label: "Nama Lengkap *",
                ),
                SizedBox(height: responsive.hp(2)),

                // Email Field - Gunakan controller register yang benar
                CustomTextField(
                  controller: controller.emailRegisterController,
                  hint: "Masukan email",
                  label: "Email *",
                ),
                SizedBox(height: responsive.hp(2)),

                // Password Field - Gunakan controller register yang benar
                CustomTextField(
                  controller: controller.passwordRegisterController,
                  hint: "Masukan password",
                  label: "Password *",
                  isPassword: true,
                ),
                SizedBox(height: responsive.hp(2)),

                // Confirm Password Field
                CustomTextField(
                  controller: controller.confirmPasswordController,
                  hint: "Konfirmasi password",
                  label: "Konfirmasi Password *",
                  isPassword: true,
                ),
                SizedBox(height: responsive.hp(3)),

                // Register Button dengan Obx untuk loading state
                Obx(() => SizedBox(
                  width: double.infinity,
                  height: responsive.hp(6),
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value 
                      ? null 
                      : () {
                          // Call register function
                          controller.register('entrepreneur');
                        },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2196F3),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(responsive.wp(3)),
                      ),
                    ),
                    child: controller.isLoading.value
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          strokeWidth: 2,
                        )
                      : Text(
                          'Daftar sebagai Entrepreneur',
                          style: TextStyle(
                            fontSize: responsive.sp(16),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
