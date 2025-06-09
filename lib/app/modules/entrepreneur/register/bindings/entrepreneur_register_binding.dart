import 'package:fe_hajifund/app/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../controllers/entrepreneur_register_controller.dart';

class EntrepreneurRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
