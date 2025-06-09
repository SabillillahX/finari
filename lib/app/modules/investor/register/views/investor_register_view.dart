import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/investor_register_controller.dart';

class InvestorRegisterView extends GetView<InvestorRegisterController> {
  const InvestorRegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InvestorRegisterView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InvestorRegisterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
