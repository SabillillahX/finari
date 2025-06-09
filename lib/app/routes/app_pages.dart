import 'package:get/get.dart';

import '../middleware/role_middleware.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/entrepreneur/dashboard/bindings/entrepreneur_dashboard_binding.dart';
import '../modules/entrepreneur/dashboard/views/entrepreneur_dashboard_view.dart';
import '../modules/entrepreneur/register/bindings/entrepreneur_register_binding.dart';
import '../modules/entrepreneur/register/views/entrepreneur_register_view.dart';
import '../modules/introduction/bindings/introduction_binding.dart';
import '../modules/introduction/views/introduction_view.dart';
import '../modules/investor/dashboard/bindings/investor_dashboard_binding.dart';
import '../modules/investor/dashboard/views/investor_dashboard_view.dart';
import '../modules/investor/register/bindings/investor_register_binding.dart';
import '../modules/investor/register/views/investor_register_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/role_selection/bindings/role_selection_binding.dart';
import '../modules/role_selection/views/role_selection_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
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
      name: _Paths.INVESTOR + _Paths.REGISTER,
      page: () => const InvestorRegisterView(),
      binding: InvestorRegisterBinding(),
      children: [
        GetPage(
          name: _Paths.INVESTOR_REGISTER,
          page: () => const InvestorRegisterView(),
          binding: InvestorRegisterBinding(),
        ),
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
    GetPage(
      name: _Paths.ENTREPRENEUR + _Paths.REGISTER,
      page: () => const EntrepreneurRegisterView(),
      binding: EntrepreneurRegisterBinding(),
      children: [
        GetPage(
          name: _Paths.ENTREPRENEUR_REGISTER,
          page: () => const EntrepreneurRegisterView(),
          binding: EntrepreneurRegisterBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ROLE_SELECTION,
      page: () => const RoleSelectionView(),
      binding: RoleSelectionBinding(),
    ),
  ];
}
