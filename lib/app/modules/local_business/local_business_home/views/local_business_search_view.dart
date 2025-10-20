import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LocalBusinessSearchView extends GetView {
  const LocalBusinessSearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LocalBusinessSearchView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LocalBusinessSearchView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
