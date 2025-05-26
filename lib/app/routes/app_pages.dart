import 'package:get/get.dart';

import '../middleware/role_middleware.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/entrepreneur/dashboard/bindings/entrepreneur_dashboard_binding.dart';
import '../modules/entrepreneur/dashboard/views/entrepreneur_dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/introduction/bindings/introduction_binding.dart';
import '../modules/introduction/views/introduction_view.dart';
import '../modules/investor/dashboard/bindings/investor_dashboard_binding.dart';
import '../modules/investor/dashboard/views/investor_dashboard_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => const IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.INVESTOR + _Paths.DASHBOARD,
      page: () => const InvestorDashboardView(),
      binding: InvestorDashboardBinding(),
      middlewares: [
        RoleMiddleware(role: 'investor'),
      ],
    ),
    GetPage(
      name: _Paths.ENTREPRENEUR + _Paths.DASHBOARD,
      page: () => const EntrepreneurDashboardView(),
      binding: EntrepreneurDashboardBinding(),
      middlewares: [
        RoleMiddleware(role: 'entrepreneur'),
      ],
    ),
  ];
}
