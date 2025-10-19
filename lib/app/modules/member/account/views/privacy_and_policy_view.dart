import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PrivacyAndPolicyView extends GetView {
  const PrivacyAndPolicyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PrivacyAndPolicyView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PrivacyAndPolicyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
