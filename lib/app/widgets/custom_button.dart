import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final double? width;
  final double height;
  final bool isEnabled;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.width,
    this.height = 50,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFFD4AF37);
    final Color secondaryColor = Colors.grey.shade300;

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? primaryColor : secondaryColor,
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.grey.shade400,
          disabledForegroundColor: Colors.grey.shade200,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: isPrimary ? 2 : 0,
        ),
        child: Text(
          'Masuk',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isPrimary || !isEnabled ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
