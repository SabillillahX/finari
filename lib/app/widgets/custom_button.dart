import 'package:fe_hajifund/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatefulWidget {
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  Color _buttonColor = const Color(0xFF011936);
  final AuthController controller = Get.find<AuthController>();

  void _changeColor(Color color) {
    setState(() {
      _buttonColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: GestureDetector(
        onTapDown:
            (_) => _changeColor(Colors.grey), // Warna berubah saat ditekan
        onTapUp:
            (_) => _changeColor(
              const Color(0xFF011936),
            ), // Warna kembali saat dilepas
        onTapCancel:
            () => _changeColor(
              const Color(0xFF011936),
            ), // Jika tap dibatalkan (misal geser jari keluar tombol)
        child: ElevatedButton(
          onPressed: () {
            controller.login();
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15),
            backgroundColor: _buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Masuk',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
