import 'package:fe_hajifund/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../../routes/app_pages.dart';
import '../../../core/utils/auto_responsive.dart';
import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authC = Get.find<AuthController>();
    final responsive = AutoResponsive(context);

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "",
          body: "",
          image: Image.asset(
            "assets/logo/hajifund.png",
            width: responsive.wp(60),
          ),
          decoration: PageDecoration(
            bodyPadding: EdgeInsets.all(responsive.wp(4)),
            imagePadding: EdgeInsets.zero,
          ),
        ),
        PageViewModel(
          title: "Dukung Bisnis Raih Keuntungan",
          body:
              "Mendukung pertumbuhan bisnis sambil meraih keuntungan yang transparan dan berkelanjutan",
          image: Image.asset(
            "assets/logo/roi.png",
            width: responsive.wp(40),
          ),
          decoration: PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: responsive.sp(28),
              fontWeight: FontWeight.w700,
              color: Color(0xFFF8F5E4),
              fontFamily: "Sora",
            ),
            bodyTextStyle: TextStyle(
              fontSize: responsive.sp(19),
              color: Color(0xFFF8F5E4),
              fontFamily: "Sora",
            ),
            bodyPadding: EdgeInsets.all(responsive.wp(4)),
            imagePadding: EdgeInsets.zero,
            pageColor: Color(0xFFB39F53),
          ),
        ),
        PageViewModel(
          title: "Dukung Bisnis Raih Keuntungan",
          body:
              "Mendukung pertumbuhan bisnis sambil meraih keuntungan yang transparan dan berkelanjutan",
          image: Image.asset(
            "assets/logo/infaq.png",
            width: responsive.wp(40),
          ),
          decoration: PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: responsive.sp(28),
              fontWeight: FontWeight.w700,
              color: Color(0xFFD4AF37),
              fontFamily: "Sora",
            ),
            bodyTextStyle: TextStyle(
              fontSize: responsive.sp(19),
              color: Color(0xFFD4AF37),
              fontFamily: "Sora",
            ),
            bodyPadding: EdgeInsets.all(responsive.wp(4)),
            imagePadding: EdgeInsets.only(top: responsive.hp(10)),
          ),
          footer: Center(
            child: ElevatedButton.icon(
              onPressed: () {
                authC.skipIntroduction();
                Get.offAllNamed(Routes.AUTH);
              },
              label: Text(
                "Selanjutnya",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Sora",
                  fontWeight: FontWeight.w600,
                  fontSize: responsive.sp(14),
                ),
              ),
              icon: Icon(Icons.arrow_right_alt, color: Colors.white),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFB39F53),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.wp(7.5),
                  vertical: responsive.hp(1.8),
                ),
              ),
            ),
          ),
        ),
      ],
      showSkipButton: false,
      showBackButton: false,
      showNextButton: false,
      showDoneButton: false,
      dotsDecorator: DotsDecorator(
        size: Size(responsive.wp(2.5), responsive.wp(2.5)),
        color: Colors.grey,
        activeSize: Size(responsive.wp(5.5), responsive.wp(2.5)),
        activeColor: Color(0xFFB39F53),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
