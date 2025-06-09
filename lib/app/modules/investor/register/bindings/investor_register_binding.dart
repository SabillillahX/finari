import 'package:get/get.dart';

import '../controllers/investor_register_controller.dart';

class InvestorRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvestorRegisterController>(
      () => InvestorRegisterController(),
    );
  }
}
