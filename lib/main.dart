import 'package:fe_hajifund/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'app/controllers/auth_controller.dart';
import 'app/utils/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Haji Fund',
    //   initialRoute: Routes.LOGIN,
    //   getPages: AppPages.routes,
    // );
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 1)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        } else {
          return Obx(
            () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Haji Fund',
              initialRoute:
                  authC.isSkipIntro.isTrue
                      ? authC.isAuth.isTrue
                          ? Routes.HOME
                          : Routes.LOGIN
                      : Routes.INTRODUCTION,
              getPages: AppPages.routes,
            ),
          );
        }
      },
    );
  }
}
