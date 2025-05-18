import 'package:fe_hajifund/app/core/theme/app_fonts.dart';
import 'package:fe_hajifund/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'app/controllers/auth_controller.dart';
import 'app/core/utils/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

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
    //   theme: AppFonts.theme,
    //   initialRoute: Routes.AUTH,
    //   getPages: AppPages.routes,
    // );
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        } else {
          return Obx(
            () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'FINARI',
              theme: AppFonts.theme,
              initialRoute:
                  authC.isSkipIntro.isTrue
                      ? authC.isAuth.isTrue
                          ? Routes.HOME
                          : Routes.AUTH
                      : Routes.INTRODUCTION,
              getPages: AppPages.routes,
            ),
          );
        }
      },
    );
  }
}
