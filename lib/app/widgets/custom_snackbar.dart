import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomToast {
  static void show({
    required String title,
    required String message,
    IconData? icon,
    Color? backgroundColor, // Tambahkan parameter backgroundColor
    Color? textColor, // Tambahkan parameter textColor
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      OverlayState? overlayState = Overlay.of(Get.overlayContext!);
      if (overlayState == null) return;

      OverlayEntry overlayEntry = OverlayEntry(
        builder:
            (context) => FadeToast(
              title: title,
              message: message,
              icon: icon ?? Icons.info, // Pakai default kalau null
              backgroundColor:
                  backgroundColor ??
                  Colors.redAccent.withOpacity(0.9), // Default background
              textColor: textColor ?? Colors.white, // Default text color
            ),
      );

      overlayState.insert(overlayEntry);

      // Delay sebelum mulai fade out dan menghapus overlay
      Future.delayed(const Duration(seconds: 3), () {
        overlayEntry.remove();
      });
    });
  }
}

class FadeToast extends StatefulWidget {
  final String title;
  final String message;
  final IconData icon; // Tambahkan parameter icon
  final Color backgroundColor; // Tambahkan parameter backgroundColor
  final Color textColor; // Tambahkan parameter textColor

  const FadeToast({
    super.key,
    required this.title,
    required this.message,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  _FadeToastState createState() => _FadeToastState();
}

class _FadeToastState extends State<FadeToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Setelah 2.5 detik, mulai fade out sebelum dihapus
    Future.delayed(const Duration(milliseconds: 2500), () {
      _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 50,
      right: 50,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: widget.backgroundColor, // Gunakan backgroundColor custom
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.icon,
                  color: widget.textColor,
                ), // Gunakan textColor custom
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: widget.textColor, // Gunakan textColor custom
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.message,
                        style: TextStyle(
                          color: widget.textColor,
                        ), // Gunakan textColor custom
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
