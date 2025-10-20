import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/local_business_account_controller.dart';

class LocalBusinessAccountView extends GetView<LocalBusinessAccountController> {
  const LocalBusinessAccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LocalBusinessAccountView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LocalBusinessAccountView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
