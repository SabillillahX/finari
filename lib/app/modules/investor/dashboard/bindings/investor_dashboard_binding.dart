import 'package:get/get.dart';

import '../controllers/investor_dashboard_controller.dart';

class InvestorDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvestorDashboardController>(
      () => InvestorDashboardController(),
    );
  }
}
