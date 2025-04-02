import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/logo/hajifund.png', // Make sure this path is correct
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.width * 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
