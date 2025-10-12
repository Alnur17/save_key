import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/savings_controller.dart';

class SavingsView extends GetView<SavingsController> {
  const SavingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SavingsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SavingsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
