import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../../routes/app_pages.dart';
import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "",
          body: "",
          image: Image.asset(
            "assets/logo/hajifund.png",
            width: MediaQuery.of(context).size.width * 0.6,
          ),
          decoration: PageDecoration(
            bodyPadding: EdgeInsets.all(16),
            imagePadding: EdgeInsets.zero,
          ),
        ),
        PageViewModel(
          title: "Dukung Bisnis Raih Keuntungan",
          body:
              "Mendukung pertumbuhan bisnis sambil meraih keuntungan yang transparan dan berkelanjutan",
          image: Image.asset(
            "assets/logo/roi.png",
            width: MediaQuery.of(context).size.width * 0.4,
          ),
          decoration: PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
              color: Color(0xFFF8F5E4),
              fontFamily: "Sora",
            ),
            bodyTextStyle: TextStyle(
              fontSize: 19.0,
              color: Color(0xFFF8F5E4),
              fontFamily: "Sora",
            ),
            bodyPadding: EdgeInsets.all(16),
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
            width: MediaQuery.of(context).size.width * 0.4,
          ),
          decoration: PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
              color: Color(0xFFD4AF37),
              fontFamily: "Sora",
            ),
            bodyTextStyle: TextStyle(
              fontSize: 19.0,
              color: Color(0xFFD4AF37),
              fontFamily: "Sora",
            ),
            bodyPadding: EdgeInsets.all(16),
            imagePadding: EdgeInsets.only(top: 100),
          ),
          footer: Center(
            child: ElevatedButton.icon(
              onPressed: () {},
              label: Text(
                "Selanjutnya",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Sora",
                  fontWeight: FontWeight.w600,
                ),
              ),
              icon: Icon(Icons.arrow_right_alt, color: Colors.white),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFB39F53),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
        size: Size(10, 10),
        color: Colors.grey,
        activeSize: Size(22, 10),
        activeColor: Color(0xFFB39F53),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
