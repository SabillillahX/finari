import 'package:get/get.dart';

import '../controllers/entrepreneur_dashboard_controller.dart';

class EntrepreneurDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EntrepreneurDashboardController>(
      () => EntrepreneurDashboardController(),
    );
  }
}
