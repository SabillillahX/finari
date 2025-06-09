import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUtils {
  /// Show a confirmation dialog with customizable content
  static Future<bool> showConfirmationDialog({
    required String title,
    required String message,
    String confirmText = 'Ya',
    String cancelText = 'Batal',
    Color confirmColor = const Color(0xFF2196F3),
    Color cancelColor = const Color(0xFF757575),
    IconData? icon,
    Color? iconColor,
  }) async {
    final result = await Get.dialog<bool>(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: (iconColor ?? confirmColor).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: iconColor ?? confirmColor,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 20),
              ],
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF757575),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xFFE0E0E0),
                          width: 1,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () => Get.back(result: false),
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          cancelText,
                          style: TextStyle(
                            color: cancelColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: confirmColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: confirmColor.withOpacity(0.3),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextButton(
                        onPressed: () => Get.back(result: true),
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          confirmText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    return result ?? false;
  }

  /// Show exit confirmation dialog
  static Future<bool> showExitDialog() async {
    return await showConfirmationDialog(
      title: 'Konfirmasi Keluar',
      message: 'Apakah Anda yakin ingin keluar?',
      confirmText: 'Keluar',
      cancelText: 'Batal',
      icon: Icons.exit_to_app_rounded,
      confirmColor: const Color(0xFF2196F3),
    );
  }

  /// Show logout confirmation dialog
  static Future<bool> showLogoutDialog() async {
    return await showConfirmationDialog(
      title: 'Konfirmasi Logout',
      message: 'Apakah Anda yakin ingin logout dari akun?',
      confirmText: 'Logout',
      cancelText: 'Batal',
      icon: Icons.logout_rounded,
      confirmColor: const Color(0xFFFF5722),
      iconColor: const Color(0xFFFF5722),
    );
  }

  /// Show delete confirmation dialog
  static Future<bool> showDeleteDialog({
    required String itemName,
  }) async {
    return await showConfirmationDialog(
      title: 'Konfirmasi Hapus',
      message: 'Apakah Anda yakin ingin menghapus $itemName?',
      confirmText: 'Hapus',
      cancelText: 'Batal',
      icon: Icons.delete_rounded,
      confirmColor: const Color(0xFFF44336),
      iconColor: const Color(0xFFF44336),
    );
  }

  /// Show save confirmation dialog
  static Future<bool> showSaveDialog() async {
    return await showConfirmationDialog(
      title: 'Simpan Perubahan',
      message: 'Apakah Anda ingin menyimpan perubahan yang telah dibuat?',
      confirmText: 'Simpan',
      cancelText: 'Batal',
      icon: Icons.save_rounded,
      confirmColor: const Color(0xFF4CAF50),
      iconColor: const Color(0xFF4CAF50),
    );
  }
}
