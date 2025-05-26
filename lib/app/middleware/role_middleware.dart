import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class RoleMiddleware extends GetMiddleware {
  final String role;
  final AuthController _authController = Get.find<AuthController>();

  RoleMiddleware({required this.role});

  @override
  RouteSettings? redirect(String? route) {
    // Check if user is authenticated first
    if (!_authController.isAuth.value) {
      return const RouteSettings(name: '/login');
    }

    // Check if user has the required role
    final userRole = _authController.userRole.value;

    switch (role) {
      case 'investor':
        if (userRole != 'investor') {
          return const RouteSettings(name: '/entrepreneur-dashboard');
        }
        break;
      case 'entrepreneur':
        if (userRole != 'entrepreneur') {
          return const RouteSettings(name: '/investor-dashboard');
        }
        break;
      default:
        return null;
    }

    return null; // No redirection needed
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    return page;
  }

  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    return bindings;
  }

  @override
  Widget onPageBuilt(Widget page) {
    return page;
  }
}
