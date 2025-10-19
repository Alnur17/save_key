import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NotificationManageView extends GetView {
  const NotificationManageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotificationManageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NotificationManageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
